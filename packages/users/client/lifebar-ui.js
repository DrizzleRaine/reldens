/**
 *
 * Reldens - LifebarUi
 *
 */

const { UsersConst } = require('../constants');
const { ActionsConst } = require('../../actions/constants');
const { GameConst } = require('../../game/constants');
const { EventsManagerSingleton, sc } = require('@reldens/utils');

class LifebarUi
{

    setup(gameManager)
    {
        this.barConfig = gameManager.config.get('client/ui/lifeBar');
        if(!this.barConfig.enabled){
            return false;
        }
        this.gameManager = gameManager;
        this.fixedPositionX = false;
        this.fixedPositionY = false;
        this.barProperty = this.gameManager.config.get('client/actions/skills/affectedProperty');
        this.playerSize = this.gameManager.config.get('client/players/size');
        this.lifeBars = {};
        EventsManagerSingleton.on('reldens.playerStatsUpdateAfter', (message, roomEvents) => {
            this.onPlayerStatsUpdateAfter(message, roomEvents);
        });
        // eslint-disable-next-line no-unused-vars
        EventsManagerSingleton.on('reldens.joinedRoom', (room, gameManager) => {
            this.listenMessages(room);
        });
        // eslint-disable-next-line no-unused-vars
        EventsManagerSingleton.on('reldens.runPlayerAnimation', (playerEngine, playerId, player) => {
            this.drawLifeBar(playerId);
        });
        // eslint-disable-next-line no-unused-vars
        EventsManagerSingleton.on('reldens.updateGameSizeBefore', (gameEngine, newWidth, newHeight) => {
            if(!this.barConfig.fixedPosition){
                return false;
            }
            this.setFixedPosition(newWidth, newHeight);
            let currentPlayer = this.gameManager.getCurrentPlayer();
            this.drawLifeBar(currentPlayer.playerId);
        });
        // eslint-disable-next-line no-unused-vars
        EventsManagerSingleton.on('reldens.playersOnRemove', (player, key, roomEvents) => {
            this.removeLifeBar(key);
        });
        // eslint-disable-next-line no-unused-vars
        EventsManagerSingleton.on('reldens.playersOnAddReady', (player, key, previousScene, roomEvents) => {
            this.processLifeBarQueue();
        });
        // eslint-disable-next-line no-unused-vars
        EventsManagerSingleton.on('reldens.playerEngineAddPlayer', (playerEngine, addedPlayerId, addedPlayerData) => {
            this.processLifeBarQueue();
        });
        EventsManagerSingleton.on('reldens.objectBodyChanged', (event) => {
            let {key} = event;
            let currentObject = sc.getDef(this.gameManager.getActiveScene().objectsAnimations, key, false);
            if(!currentObject){
                return false;
            }
            if(sc.hasOwn(this.lifeBars, key)){
                this.lifeBars[key].destroy();
            }
            this.lifeBars[key] = this.gameManager.getActiveScene().add.graphics();
            let {x, y} = this.calculateObjectLifeBarPosition(currentObject);
            this.drawBar(
                this.lifeBars[key],
                currentObject[this.barProperty+'Total'],
                currentObject[this.barProperty+'Value'],
                x,
                y
            );
        });
        return this;
    }

    calculateObjectLifeBarPosition(currentObject)
    {
        return {
            x: currentObject.x - (currentObject.sceneSprite.width / 2),
            y: currentObject.y - (currentObject.sceneSprite.height / 2) - this.barConfig.height - this.barConfig.top
        };
    }

    setFixedPosition(newWidth, newHeight)
    {
        if(!newWidth || !newHeight){
            let position = this.gameManager.gameEngine.getCurrentScreenSize(this.gameManager);
            newWidth = position.newWidth;
            newHeight = position.newHeight;
        }
        let {uiX, uiY} = this.gameManager.gameEngine.uiScene.getUiConfig('lifeBar', newWidth, newHeight);
        this.fixedPositionX = uiX;
        this.fixedPositionY = uiY;
    }

    onPlayerStatsUpdateAfter(message, roomEvents)
    {
        let currentPlayer = roomEvents.gameManager.getCurrentPlayer();
        this.updateAndDraw(
            currentPlayer.playerId,
            message.statsBase[this.barProperty],
            message.stats[this.barProperty]
        );
    }

    listenMessages(room)
    {
        room.onMessage((message) => {
            if(message.act === UsersConst.ACTION_LIFEBAR_UPDATE){
                if(message.oT === 'o' && this.barConfig.showEnemies){
                    this.processObjectLifeBarMessage(message, true);
                }
                if(message.oT === 'p'){
                    this.processPlayerLifeBarMessage(message, true);
                }
            }
            if(message.act === ActionsConst.BATTLE_ENDED){
                if(sc.hasOwn(this.lifeBars, message.t)){
                    this.lifeBars[message.t].destroy();
                }
            }
        });
    }

    canShow(playerId)
    {
        return this.barConfig.showAllPlayers || playerId === this.gameManager.getCurrentPlayer().playerId;
    }

    processObjectLifeBarMessage(message, queue = false)
    {
        let currentObject = sc.getDef(this.gameManager.getActiveScene().objectsAnimations, message.oK, false);
        if(!currentObject || currentObject.isDead){
            if(queue){
                this.queueLifeBarMessage(message);
            }
            return false;
        }
        currentObject[this.barProperty+'Total'] = message.totalValue;
        currentObject[this.barProperty+'Value'] = message.newValue;
        this.drawObjectLifeBar(currentObject, message);
    }

    queueLifeBarMessage(message)
    {
        if(!sc.hasOwn(this.gameManager, 'lifeBarQueue')){
            this.gameManager.lifeBarQueue = [];
        }
        this.gameManager.lifeBarQueue.push(message);
    }

    drawObjectLifeBar(currentObject, message)
    {
        let objectKey = message.oK;
        if(sc.hasOwn(this.lifeBars, objectKey)){
            this.lifeBars[objectKey].destroy();
        }
        if(currentObject.inState === GameConst.STATUS.DEATH){
            return false;
        }
        this.lifeBars[objectKey] = this.gameManager.getActiveScene().add.graphics();
        let {x, y} = this.calculateObjectLifeBarPosition(currentObject);
        this.drawBar(
            this.lifeBars[objectKey],
            message.totalValue,
            message.newValue,
            x,
            y
        );
    }

    processPlayerLifeBarMessage(message, queue = false)
    {
        let currentPlayer = this.gameManager.getCurrentPlayer();
        if(!currentPlayer || !currentPlayer.players || !currentPlayer.players[message.oK]){
            if(queue){
                this.queueLifeBarMessage(message);
            }
            return false;
        }
        if(message.oT === 'o' && this.barConfig.showEnemies){
            this.processObjectLifeBarMessage(message);
        }
        if(message.oT === 'p' && this.canShow(message.oK)){
            this.updateAndDraw(message.oK, message.totalValue, message.newValue);
        }
    }

    updateAndDraw(playerId, total, newValue)
    {
        let currentPlayer = this.gameManager.getCurrentPlayer();
        currentPlayer.players[playerId][this.barProperty+'Total'] = total;
        currentPlayer.players[playerId][this.barProperty+'Value'] = newValue;
        this.drawLifeBar(playerId);
    }

    processLifeBarQueue()
    {
        if(!this.gameManager.lifeBarQueue.length){
            return false;
        }
        for(let message of this.gameManager.lifeBarQueue){
            // process queue messages:
            if(message.oT === 'o' && this.barConfig.showEnemies){
                this.processObjectLifeBarMessage(message);
            }
            if(message.oT === 'p' && this.canShow(message.oK)){
                this.processPlayerLifeBarMessage(message);
            }
        }
    }

    drawLifeBar(playerId)
    {
        if(sc.hasOwn(this.lifeBars, playerId)){
            this.lifeBars[playerId].destroy();
        }
        if(!this.canShow(playerId)){
            return false;
        }
        let barData = this.prepareBarData(playerId);
        let barHeight = this.barConfig.height;
        let barTop = this.barConfig.top;
        let fullBarWidth = this.barConfig.width;
        let uiX = barData.player.x - (fullBarWidth / 2);
        let uiY = barData.player.y - barHeight - barTop + (barData.ownerTop/2);
        if(playerId === this.gameManager.getCurrentPlayer().playerId && this.barConfig.fixedPosition){
            // if the position is fixed then the bar has to go on the ui scene:
            this.lifeBars[playerId] = this.gameManager.getActiveScenePreloader().add.graphics();
            if(this.fixedPositionX === false || this.fixedPositionY === false){
                this.setFixedPosition();
            }
            uiX = this.fixedPositionX;
            uiY = this.fixedPositionY;
        } else {
            // otherwise the bar will be added in the current scene:
            this.lifeBars[playerId] = this.gameManager.getActiveScene().add.graphics();
        }
        this.drawBar(this.lifeBars[playerId], barData.fullValue, barData.filledValue, uiX, uiY);
        return this;
    }

    prepareBarData(playerId)
    {
        let player = this.gameManager.getCurrentPlayer().players[playerId];
        let fullValue = player[this.barProperty+'Total'];
        let filledValue = player[this.barProperty+'Value'];
        let ownerTop = sc.getDef(this.player, 'topOff', 0) - this.playerSize.height;
        return {player, fullValue, filledValue, ownerTop};
    }

    removeLifeBar(playerId)
    {
        if(!sc.hasOwn(this.lifeBars, playerId)){
            return false;
        }
        this.lifeBars[playerId].destroy();
        delete this.lifeBars[playerId];
    }

    drawBar(lifeBarGraphic, fullValue, filledValue, uiX, uiY)
    {
        let barHeight = this.barConfig.height;
        let fullBarWidth = this.barConfig.width;
        let filledBarWidth = (filledValue * fullBarWidth) / fullValue;
        lifeBarGraphic.clear();
        lifeBarGraphic.fillStyle(parseInt(this.barConfig.fillStyle), 1);
        lifeBarGraphic.fillRect(uiX, uiY, filledBarWidth, barHeight);
        lifeBarGraphic.lineStyle(1, parseInt(this.barConfig.lineStyle));
        lifeBarGraphic.strokeRect(uiX, uiY, fullBarWidth, barHeight);
        lifeBarGraphic.alpha = 0.6;
        lifeBarGraphic.setDepth(300000);
    }

}

module.exports.LifebarUi = LifebarUi;
