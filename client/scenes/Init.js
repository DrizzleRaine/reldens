const Phaser = require('phaser');
var Scene = Phaser.Scene;
const UP = 'up';
const LEFT = 'left';
const DOWN = 'down';
const RIGHT = 'right';
const INIT = 'Init';
const TOWN = 'Town';
const IMAGE_PLAYER = 'player';
const IMAGE_TOWN = 'town';
const IMAGE_HOUSE = 'house';
const MAP_TOWN = 'map-town';
const MAP_HOUSE_1 = 'map-house-1';
const MAP_HOUSE_2 = 'map-house-2';

class Init extends Scene
{

    constructor()
    {
        super({ key: INIT });
        this.progressBar = null;
        this.progressCompleteRect = null;
        this.progressRect = null;
    }

    preload()
    {
        this.load.tilemapTiledJSON(MAP_TOWN, 'assets/maps/town.json');
        this.load.tilemapTiledJSON(MAP_HOUSE_1, 'assets/maps/house-1.json');
        this.load.tilemapTiledJSON(MAP_HOUSE_2, 'assets/maps/house-2.json');
        this.load.spritesheet(IMAGE_PLAYER, 'assets/sprites/player.png', { frameWidth: 32, frameHeight: 32 });
        this.load.spritesheet(IMAGE_TOWN, 'assets/maps/town.png', { frameWidth: 32, frameHeight: 32 });
        this.load.spritesheet(IMAGE_HOUSE, 'assets/maps/house.png', { frameWidth: 32, frameHeight: 32 });
        this.load.on('progress', this.onLoadProgress, this);
        this.load.on('complete', this.onLoadComplete, this);
        this.createProgressBar();
    }

    create()
    {
        this.anims.create({
            key: LEFT,
            frames: this.anims.generateFrameNumbers(IMAGE_PLAYER, { start: 3, end: 5 }),
            frameRate: 16,
            repeat: -1
        });
        this.anims.create({
            key: RIGHT,
            frames: this.anims.generateFrameNumbers(IMAGE_PLAYER, { start: 6, end: 8 }),
            frameRate: 16,
            repeat: -1
        });
        this.anims.create({
            key: UP,
            frames: this.anims.generateFrameNumbers(IMAGE_PLAYER, { start: 9, end: 11 }),
            frameRate: 16,
            repeat: -1
        });
        this.anims.create({
            key: DOWN,
            frames: this.anims.generateFrameNumbers(IMAGE_PLAYER, { start: 0, end: 2 }),
            frameRate: 16,
            repeat: -1
        });
    }

    createProgressBar()
    {
        let Rectangle = Phaser.Geom.Rectangle;
        let main = Rectangle.Clone(this.cameras.main);
        this.progressRect = new Rectangle(0, 0, main.width / 2, 50);
        Rectangle.CenterOn(this.progressRect, main.centerX, main.centerY);
        this.progressCompleteRect = Phaser.Geom.Rectangle.Clone(this.progressRect);
        this.progressBar = this.add.graphics();
    }

    onLoadComplete(loader) 
    {
        // this.scene.start(TOWN);
        this.scene.shutdown();
    }

    onLoadProgress(progress)
    {
        let color = (0xffffff);
        this.progressRect.width = progress * this.progressCompleteRect.width;
        this.progressBar
            .clear()
            .fillStyle(0x222222)
            .fillRectShape(this.progressCompleteRect)
            .fillStyle(color)
            .fillRectShape(this.progressRect);
    }

}

module.exports = Init;
