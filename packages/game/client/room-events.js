/**
 *
 * Reldens - RoomEvents
 *
 * This class will listen the scene-rooms and run the related actions, it will also register the other modules action
 * into the room events.
 *
 */

const { PlayerEngine } = require('../../users/client/player-engine');
const { SceneDynamic } = require('./scene-dynamic');
const { ScenePreloader } = require('./scene-preloader');
const { GameConst } = require('../constants');
const { EventsManagerSingleton, Logger, sc } = require('@reldens/utils');

class RoomEvents
{

    constructor(roomName, gameManager)
    {
        this.room = false;
        this.sceneData = false;
        this.scenePreloader = false;
        this.playersQueue = {};
        this.gameManager = gameManager;
        this.gameEngine = gameManager.gameEngine;
        this.roomName = roomName;
        this.objectsUi = {};
    }

    async activateRoom(room, previousScene = false)
    {
        await EventsManagerSingleton.emit('reldens.activateRoom', room, this.gameManager);
        this.room = room;
        // listen to changes coming from the server:
        this.room.state.players.onAdd = (player, key) => {
            if(this.room.state && (!this.sceneData || this.room.state !== this.sceneData)){
                this.prepareScene();
            }
            this.playersOnAdd(player, key, previousScene);
        };
        this.room.state.players.onChange = (player, key) => {
            this.playersOnChange(player, key);
        };
        this.room.state.players.onRemove = (player, key) => {
            this.playersOnRemove(player, key);
        };
        // create players or change scenes:
        this.room.onMessage((message) => {
            this.roomOnMessage(message);
        });
        this.room.onLeave((code) => {
            this.roomOnLeave(code);
        });
    }

    async playersOnAdd(player, key, previousScene)
    {
        await EventsManagerSingleton.emit('reldens.playersOnAdd', player, key, previousScene, this);
        let addPlayerData = {
            x: player.state.x,
            y: player.state.y,
            dir: player.state.dir,
            playerName: player.playerName,
            avatarKey: player.avatarKey
        };
        // create current player:
        if(key === this.room.sessionId){
            this.engineStarted = true;
            await this.startEngineScene(player, this.room, previousScene);
            let currentScene = this.getActiveScene();
            if(currentScene.key === player.state.scene && currentScene.player && currentScene.player.players){
                for(let i of Object.keys(this.playersQueue)){
                    currentScene.player.addPlayer(i, this.playersQueue[i]);
                }
            }
        } else {
            // add new players into the current player scene:
            if(this.engineStarted){
                let currentScene = this.getActiveScene();
                if(currentScene.key === player.state.scene && currentScene.player && currentScene.player.players){
                    currentScene.player.addPlayer(key, addPlayerData);
                }
            } else {
                this.playersQueue[key] = addPlayerData;
            }
        }
    }

    prepareScene()
    {
        this.sceneData = sc.getJson(this.room.state.sceneData);
        if(!this.gameEngine.scene.getScene(this.roomName)){
            let engineSceneDynamic = this.createSceneInstance(this.roomName, this.sceneData, this.gameManager);
            this.gameEngine.scene.add(this.roomName, engineSceneDynamic, false);
        }
    }

    playersOnChange(player, key)
    {
        // do not move the player if is changing scene:
        if(player.state.scene !== this.roomName){
            return;
        }
        let currentScene = this.getActiveScene();
        if(currentScene.player && sc.hasOwn(currentScene.player.players, key)){
            currentScene.player.runPlayerAnimation(key, player);
        }
    }

    playersOnRemove(player, key)
    {
        EventsManagerSingleton.emit('reldens.playersOnRemove', player, key, this);
        if(key === this.room.sessionId){
            // @TODO - BETA - Improve disconnection handler.
            if(!this.gameManager.gameOver){
                alert('Your session ended, please login again.');
                this.gameManager.gameDom.getWindow().location.reload();
            }
        } else {
            let currentScene = this.getActiveScene();
            if(currentScene.player && sc.hasOwn(currentScene.player.players, key)){
                // remove your player entity from the game world:
                currentScene.player.removePlayer(key);
            }
        }
    }

    roomOnMessage(message)
    {
        if(message.act === GameConst.GAME_OVER){
            EventsManagerSingleton.emit('reldens.gameOver', message, this);
            this.gameManager.gameOver = true;
            let currentPlayer = this.gameManager.getCurrentPlayer();
            let currentPlayerSprite = currentPlayer.players[currentPlayer.playerId];
            currentPlayerSprite.visible = false;
            this.gameManager.gameDom.getElement('#game-over').removeClass('hidden');
        }
        if(message.act === GameConst.REVIVED){
            let currentPlayer = this.gameManager.getCurrentPlayer();
            let currentPlayerSprite = currentPlayer.players[currentPlayer.playerId];
            this.gameManager.gameDom.getElement('#game-over').addClass('hidden');
            currentPlayerSprite.visible = true;
        }
        if(
            message.act === GameConst.CHANGED_SCENE
            && message.scene === this.room.name
            && this.room.sessionId !== message.id
        ){
            EventsManagerSingleton.emit('reldens.changedScene', message, this);
            let currentScene = this.getActiveScene();
            // if other users enter in the current scene we need to add them:
            let {id, x, y, dir, playerName, avatarKey} = message;
            let topOff = this.gameManager.config.get('client/players/size/topOffset');
            let leftOff = this.gameManager.config.get('client/players/size/leftOffset');
            let addPlayerData = {x:(x-leftOff), y:(y-topOff), dir, playerName, avatarKey};
            currentScene.player.addPlayer(id, addPlayerData);
        }
        // @NOTE: here we don't need to evaluate the id since the reconnect only is sent to the current client.
        if(message.act === GameConst.RECONNECT){
            EventsManagerSingleton.emit('reldens.beforeReconnectGameClient', message, this);
            this.gameManager.reconnectGameClient(message, this.room);
        }
        // @NOTE: now this method will update the stats every time the stats action is received but the UI will be
        // created only once in the preloader.
        if(message.act === GameConst.PLAYER_STATS){
            EventsManagerSingleton.emit('reldens.playerStatsUpdateBefore', message, this);
            this.updatePlayerStats(message);
        }
        if(message.act === GameConst.UI && message.id){
            EventsManagerSingleton.emit('reldens.initUi', message, this);
            this.initUi(message);
        }
    }

    roomOnLeave(code)
    {
        if(code > 1000){
            // server error, handle disconnection:
            if(!this.gameManager.gameOver){
                // @TODO - BETA - Improve disconnection handler.
                alert('There was a connection error.');
            }
            this.gameManager.gameDom.getWindow().location.reload();
        } else {
            // NOTE: the client has initiated the disconnection, this is also triggered when the users change the room.
        }
    }

    updatePlayerStats(message)
    {
        if(!sc.hasOwn(message, 'stats') || !message.stats){
            return false;
        }
        let currentScene = this.getActiveScene();
        if(!currentScene.player || !sc.hasOwn(currentScene.player.players, this.room.sessionId)){
            Logger.error('For some reason you hit this case which should not happen.');
            return false;
        }
        let playerSprite = currentScene.player.players[this.room.sessionId];
        playerSprite.stats = message.stats;
        this.gameManager.playerData.stats = message.stats;
        this.gameManager.playerData.statsBase = message.statsBase;
        let playerStats = this.gameManager.getUiElement('playerStats');
        if(!playerStats){
            return false;
        }
        let statsPanel = playerStats.getChildByProperty('id', 'player-stats-container');
        if(!statsPanel){
            return false;
        }
        let messageTemplate = this.gameEngine.uiScene.cache.html.get('playerStat');
        statsPanel.innerHTML = '';
        for(let i of Object.keys(message.stats)){
            let parsedStatsTemplate = this.gameManager.gameEngine.parseTemplate(messageTemplate, {
                statLabel: i,
                statValue: message.stats[i]+(
                    sc.hasOwn(this.gameManager.config.client.players.initialStats[i], 'data')
                    && sc.getDef(this.gameManager.config.client.players.initialStats[i].data, 'showBase', false)
                        ? ' / '+message.statsBase[i] : ''
                )
            });
            statsPanel.innerHTML = statsPanel.innerHTML+parsedStatsTemplate;
        }
        EventsManagerSingleton.emit('reldens.playerStatsUpdateAfter', message, this);
    }

    initUi(props)
    {
        let uiScene = this.gameEngine.uiScene;
        if(!uiScene || !sc.hasOwn(uiScene.userInterfaces, props.id)){
            return false;
        }
        let uiBox = uiScene.userInterfaces[props.id];
        if(props.title){
            let boxTitle = uiBox.getChildByProperty('className', 'box-title');
            if(boxTitle){
                boxTitle.innerHTML = props.title;
            }
        }
        if(props.content){
            let boxContent = uiBox.getChildByProperty('className', 'box-content');
            if(boxContent){
                boxContent.innerHTML = props.content;
                // @TODO - BETA - IMPROVE! I need time to focus on this which I don't have right now :(
                if(props.options){
                    let optionsContainerTemplate = uiScene.cache.html.get('uiOptionsContainer');
                    let optionsContainer = this.gameManager.gameEngine.parseTemplate(optionsContainerTemplate,
                        {id: 'ui-'+props.id});
                    boxContent.innerHTML += optionsContainer;
                    for(let i of Object.keys(props.options)){
                        let {label, value, icon} = props.options[i];
                        let optTemplate = icon ? 'Icon' : 'Button';
                        let buttonTemplate = uiScene.cache.html.get('uiOption'+optTemplate);
                        let templateVars = {
                            id: i,
                            object_id: props.id,
                            label,
                            value,
                            icon: '/assets/custom/items/'+icon+'.png'
                        };
                        let buttonHtml = this.gameManager.gameEngine.parseTemplate(buttonTemplate, templateVars);
                        this.gameManager.gameDom.appendToElement('#ui-'+props.id, buttonHtml);
                        this.gameManager.gameDom.getElement('#opt-'+i+'-'+props.id).on('click', (event) => {
                            let optionSend = {
                                id: props.id,
                                act: GameConst.BUTTON_OPTION,
                                value: event.target.getAttribute('data-option-value')
                            };
                            this.room.send(optionSend);
                        });
                    }
                }
            }
        }
        let dialogContainer = uiBox.getChildByID('box-'+props.id);
        dialogContainer.style.display = 'block';
        // set box depth over the other boxes:
        uiBox.setDepth(2);
        // on dialog display clear the current target:
        if(this.gameManager.config.get('client/ui/uiTarget/hideOnDialog')){
            this.gameEngine.clearTarget();
        }
    }

    async startEngineScene(player, room, previousScene = false)
    {
        await EventsManagerSingleton.emit('reldens.startEngineScene', this, player, room, previousScene);
        let uiScene = false;
        if(!this.gameEngine.uiScene){
            uiScene = true;
        }
        let preloaderName = GameConst.SCENE_PRELOADER+this.sceneData.roomName;
        if(!this.gameEngine.scene.getScene(preloaderName)){
            this.scenePreloader = this.createPreloaderInstance({
                name: preloaderName,
                map: this.sceneData.roomMap,
                images: this.sceneData.sceneImages,
                uiScene: uiScene,
                gameManager: this.gameManager,
                preloadAssets: this.sceneData.preloadAssets,
                objectsAnimationsData: this.sceneData.objectsAnimationsData
            });
            this.gameEngine.scene.add(preloaderName, this.scenePreloader, true);
            await EventsManagerSingleton.emit('reldens.createdPreloaderInstance', this, this.scenePreloader);
            let preloader = this.gameEngine.scene.getScene(preloaderName);
            preloader.load.on('complete', async () => {
                // set ui on first preloader scene:
                if(!this.gameEngine.uiScene){
                    // assign the preloader:
                    this.gameEngine.uiScene = preloader;
                    // if the box right is present then assign the actions:
                    let playerBox = this.gameManager.getUiElement('playerBox');
                    if(playerBox){
                        let element = playerBox.getChildByProperty('className', 'player-name');
                        if(element){
                            element.innerHTML = this.gameManager.playerData.name;
                        }
                    }
                }
                await this.createEngineScene(player, room, previousScene);
            });
        } else {
            let currentScene = this.getActiveScene();
            currentScene.objectsAnimationsData = this.sceneData.objectsAnimationsData;
            this.scenePreloader = this.gameEngine.scene.getScene(preloaderName);
            await EventsManagerSingleton.emit('reldens.createdPreloaderRecurring', this, this.scenePreloader);
            await this.createEngineScene(player, room, previousScene);
        }
    }

    async createEngineScene(player, room, previousScene)
    {
        await EventsManagerSingleton.emit('reldens.createEngineScene', player, room, previousScene, this);
        if(!this.gameManager.room){
            this.gameEngine.scene.start(player.state.scene);
        } else {
            if(previousScene && this.gameEngine.scene.getScene(previousScene)){
                // destroy previous scene tileset:
                this.gameEngine.scene.getScene(previousScene).changeScene();
                // stop the previous scene and start the new one:
                this.gameEngine.scene.stop(previousScene);
                this.gameEngine.scene.start(player.state.scene);
            }
        }
        this.gameManager.room = room;
        let currentScene = this.gameEngine.scene.getScene(player.state.scene);
        currentScene.player = this.createPlayerEngineInstance(currentScene, player, this.gameManager, room);
        currentScene.player.create();
        if(room.state.players){
            for(let i of Object.keys(room.state.players)){
                let tmp = room.state.players[i];
                if(tmp.sessionId && tmp.sessionId !== room.sessionId){
                    let addPlayerData = {
                        x: tmp.state.x,
                        y: tmp.state.y,
                        dir: tmp.state.dir,
                        playerName: tmp.playerName,
                        avatarKey: tmp.avatarKey
                    };
                    currentScene.player.addPlayer(tmp.sessionId, addPlayerData);
                }
            }
        }
        // update any ui if needed, this event happens once for every scene:
        let sceneLabel = this.gameManager.getUiElement('sceneLabel');
        // if scene label is visible assign the data to the box:
        if(sceneLabel){
            let element = sceneLabel.getChildByProperty('className', 'scene-label');
            if(element){
                element.innerHTML = this.sceneData.roomTitle;
            }
        }
        // @NOTE: player states must be requested since are private user data that we can share with other players or
        // broadcast to the rooms.
        // request player stats after the player was added to the scene:
        this.room.send({act: GameConst.PLAYER_STATS});
        // send notification about client joined:
        this.room.send({act: GameConst.CLIENT_JOINED});
        await EventsManagerSingleton.emit('reldens.playersOnAddReady',
            currentScene.player,
            currentScene.player.playerId,
            previousScene,
            this
        );
    }

    getActiveScene()
    {
        return this.gameEngine.scene.getScene(this.roomName);
    }

    createSceneInstance(sceneName, sceneData, gameManager)
    {
        return new SceneDynamic(sceneName, sceneData, gameManager);
    }

    createPlayerEngineInstance(currentScene, player, gameManager, room)
    {
        return new PlayerEngine(currentScene, player, gameManager, room);
    }

    createPreloaderInstance(props)
    {
        return new ScenePreloader(props);
    }

}

module.exports.RoomEvents = RoomEvents;
