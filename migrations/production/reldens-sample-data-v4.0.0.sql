--

SET FOREIGN_KEY_CHECKS = 0;

--

TRUNCATE `ads`;
TRUNCATE `ads_banner`;
TRUNCATE `ads_event_video`;
TRUNCATE `ads_played`;
TRUNCATE `ads_providers`;
TRUNCATE `ads_types`;
TRUNCATE `audio`;
TRUNCATE `audio_categories`;
TRUNCATE `audio_markers`;
TRUNCATE `audio_player_config`;
TRUNCATE `chat`;
TRUNCATE `chat_message_types`;
TRUNCATE `clan`;
TRUNCATE `clan_levels`;
TRUNCATE `clan_levels_modifiers`;
TRUNCATE `clan_members`;
TRUNCATE `config`;
TRUNCATE `config_types`;
TRUNCATE `features`;
TRUNCATE `items_group`;
TRUNCATE `items_inventory`;
TRUNCATE `items_item`;
TRUNCATE `items_item_modifiers`;
TRUNCATE `items_types`;
TRUNCATE `locale`;
TRUNCATE `objects`;
TRUNCATE `objects_animations`;
TRUNCATE `objects_assets`;
TRUNCATE `objects_items_inventory`;
TRUNCATE `objects_items_requirements`;
TRUNCATE `objects_items_rewards`;
TRUNCATE `objects_items_rewards_animations`;
TRUNCATE `objects_skills`;
TRUNCATE `objects_stats`;
TRUNCATE `objects_types`;
TRUNCATE `operation_types`;
TRUNCATE `players`;
TRUNCATE `players_state`;
TRUNCATE `players_stats`;
TRUNCATE `respawn`;
TRUNCATE `rewards`;
TRUNCATE `rewards_modifiers`;
TRUNCATE `rooms`;
TRUNCATE `rooms_change_points`;
TRUNCATE `rooms_return_points`;
TRUNCATE `skills_class_level_up_animations`;
TRUNCATE `skills_class_path`;
TRUNCATE `skills_class_path_level_labels`;
TRUNCATE `skills_class_path_level_skills`;
TRUNCATE `skills_groups`;
TRUNCATE `skills_levels`;
TRUNCATE `skills_levels_modifiers`;
TRUNCATE `skills_levels_modifiers_conditions`;
TRUNCATE `skills_levels_set`;
TRUNCATE `skills_owners_class_path`;
TRUNCATE `skills_skill`;
TRUNCATE `skills_skill_animations`;
TRUNCATE `skills_skill_attack`;
TRUNCATE `skills_skill_group_relation`;
TRUNCATE `skills_skill_owner_conditions`;
TRUNCATE `skills_skill_owner_effects`;
TRUNCATE `skills_skill_owner_effects_conditions`;
TRUNCATE `skills_skill_physical_data`;
TRUNCATE `skills_skill_target_effects`;
TRUNCATE `skills_skill_target_effects_conditions`;
TRUNCATE `skills_skill_type`;
TRUNCATE `snippets`;
TRUNCATE `stats`;
TRUNCATE `target_options`;
TRUNCATE `users`;
TRUNCATE `users_locale`;

REPLACE INTO `ads` (`id`, `key`, `provider_id`, `type_id`, `width`, `height`, `position`, `top`, `bottom`, `left`, `right`, `replay`, `enabled`) VALUES
	(3, 'fullTimeBanner', 1, 1, 320, 50, NULL, NULL, 0, NULL, 80, NULL, 0),
	(4, 'ui-banner', 1, 1, 320, 50, NULL, NULL, 80, NULL, 80, NULL, 0),
	(5, 'crazy-games-sample-video', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
	(6, 'game-monetize-sample-video', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);

REPLACE INTO `ads_banner` (`id`, `ads_id`, `banner_data`) VALUES
	(1, 3, '{"fullTime": true}'),
	(2, 4, '{"uiReferenceIds":["box-open-clan","equipment-open","inventory-open","player-stats-open"]}');

REPLACE INTO `ads_event_video` (`id`, `ads_id`, `event_key`, `event_data`) VALUES
	(1, 5, 'activatedRoom_ReldensTown', '{"rewardItemKey":"coins","rewardItemQty":1}'),
	(2, 6, 'activatedRoom_ReldensForest', '{"rewardItemKey":"coins","rewardItemQty":1}');

REPLACE INTO `ads_providers` (`id`, `key`, `enabled`) VALUES
	(1, 'crazyGames', 0),
	(2, 'gameMonetize', 0);

REPLACE INTO `ads_types` (`id`, `key`) VALUES
	(1, 'banner'),
	(2, 'eventVideo');

REPLACE INTO `audio` (`id`, `audio_key`, `files_name`, `config`, `room_id`, `category_id`, `enabled`) VALUES
	(3, 'footstep', 'footstep.mp3', NULL, NULL, 3, 1),
	(4, 'reldens-town', 'reldens-town.mp3', '', 4, 1, 1);

REPLACE INTO `audio_categories` (`id`, `category_key`, `category_label`, `enabled`, `single_audio`) VALUES
	(1, 'music', 'Music', 1, 1),
	(3, 'sound', 'Sound', 1, 0);

REPLACE INTO `audio_markers` (`id`, `audio_id`, `marker_key`, `start`, `duration`, `config`) VALUES
	(1, 4, 'ReldensTown', 0, 41, NULL),
	(2, 3, 'journeyman_right', 0, 1, NULL),
	(3, 3, 'journeyman_left', 0, 1, NULL),
	(4, 3, 'journeyman_up', 0, 1, NULL),
	(5, 3, 'journeyman_down', 0, 1, NULL),
	(6, 3, 'r_journeyman_right', 0, 1, NULL),
	(7, 3, 'r_journeyman_left', 0, 1, NULL),
	(8, 3, 'r_journeyman_up', 0, 1, NULL),
	(9, 3, 'r_journeyman_down', 0, 1, NULL),
	(10, 3, 'sorcerer_right', 0, 1, NULL),
	(11, 3, 'sorcerer_left', 0, 1, NULL),
	(12, 3, 'sorcerer_up', 0, 1, NULL),
	(13, 3, 'sorcerer_down', 0, 1, NULL),
	(14, 3, 'r_sorcerer_right', 0, 1, NULL),
	(15, 3, 'r_sorcerer_left', 0, 1, NULL),
	(16, 3, 'r_sorcerer_up', 0, 1, NULL),
	(17, 3, 'r_sorcerer_down', 0, 1, NULL),
	(18, 3, 'warlock_right', 0, 1, NULL),
	(19, 3, 'warlock_left', 0, 1, NULL),
	(20, 3, 'warlock_up', 0, 1, NULL),
	(21, 3, 'warlock_down', 0, 1, NULL),
	(22, 3, 'r_warlock_right', 0, 1, NULL),
	(23, 3, 'r_warlock_left', 0, 1, NULL),
	(24, 3, 'r_warlock_up', 0, 1, NULL),
	(25, 3, 'r_warlock_down', 0, 1, NULL),
	(26, 3, 'swordsman_right', 0, 1, NULL),
	(27, 3, 'swordsman_left', 0, 1, NULL),
	(28, 3, 'swordsman_up', 0, 1, NULL),
	(29, 3, 'swordsman_down', 0, 1, NULL),
	(30, 3, 'r_swordsman_right', 0, 1, NULL),
	(31, 3, 'r_swordsman_left', 0, 1, NULL),
	(32, 3, 'r_swordsman_up', 0, 1, NULL),
	(33, 3, 'r_swordsman_down', 0, 1, NULL),
	(34, 3, 'warrior_right', 0, 1, NULL),
	(35, 3, 'warrior_left', 0, 1, NULL),
	(36, 3, 'warrior_up', 0, 1, NULL),
	(37, 3, 'warrior_down', 0, 1, NULL),
	(38, 3, 'r_warrior_right', 0, 1, NULL),
	(39, 3, 'r_warrior_left', 0, 1, NULL),
	(40, 3, 'r_warrior_up', 0, 1, NULL),
	(41, 3, 'r_warrior_down', 0, 1, NULL);

REPLACE INTO `chat_message_types` (`id`, `key`, `show_tab`, `also_show_in_type`) VALUES
	(1, 'message', 1, NULL),
	(2, 'joined', 0, 1),
	(3, 'system', 0, 1),
	(4, 'private', 1, 1),
	(5, 'damage', 0, 1),
	(6, 'reward', 0, 1),
	(7, 'skill', 0, 1),
	(8, 'teams', 1, 1),
	(9, 'global', 1, 1),
	(10, 'error', 0, 1);

REPLACE INTO `clan_levels` (`id`, `key`, `label`, `required_experience`) VALUES
	(1, 1, '1', 0);

REPLACE INTO `config_types` (`id`, `label`) VALUES
    (1, 'string'),
    (2, 'float'),
    (3, 'boolean'),
    (4, 'json'),
    (5, 'comma_separated');

REPLACE INTO `config` (`id`, `scope`, `path`, `value`, `type`) VALUES
	(1, 'client', 'actions/damage/color', '#ff0000', 1),
	(2, 'client', 'actions/damage/duration', '600', 2),
	(3, 'client', 'actions/damage/enabled', '1', 3),
	(4, 'client', 'actions/damage/font', 'Verdana, Geneva, sans-serif', 1),
	(5, 'client', 'actions/damage/fontSize', '14', 2),
	(6, 'client', 'actions/damage/shadowColor', 'rgba(0,0,0,0.7)', 1),
	(7, 'client', 'actions/damage/showAll', '0', 3),
	(8, 'client', 'actions/damage/stroke', '#000000', 1),
	(9, 'client', 'actions/damage/strokeThickness', '4', 2),
	(10, 'client', 'actions/damage/top', '50', 2),
	(11, 'client', 'actions/skills/affectedProperty', 'hp', 1),
	(12, 'client', 'ads/general/providers/crazyGames/enabled', '0', 3),
	(13, 'client', 'ads/general/providers/crazyGames/sdkUrl', 'https://sdk.crazygames.com/crazygames-sdk-v2.js', 1),
	(14, 'client', 'ads/general/providers/crazyGames/videoMinimumDuration', '3000', 2),
	(15, 'client', 'ads/general/providers/gameMonetize/enabled', '0', 3),
	(16, 'client', 'ads/general/providers/gameMonetize/gameId', 'your-game-id-should-be-here', 1),
	(17, 'client', 'ads/general/providers/gameMonetize/sdkUrl', 'https://api.gamemonetize.com/sdk.js', 1),
	(18, 'client', 'chat/messages/characterLimit', '100', 2),
	(19, 'client', 'chat/messages/characterLimitOverhead', '30', 2),
	(20, 'client', 'clan/general/openInvites', '0', 3),
	(21, 'client', 'clan/labels/clanTitle', 'Clan: %clanName - Leader: %leaderName', 1),
	(22, 'client', 'clan/labels/propertyMaxValue', '/ %propertyMaxValue', 1),
	(23, 'client', 'clan/labels/requestFromTitle', 'Clan request from:', 1),
	(24, 'client', 'gameEngine/dom/createContainer', '1', 3),
	(25, 'client', 'gameEngine/parent', 'reldens', 1),
	(26, 'client', 'gameEngine/physics/arcade/debug', 'false', 3),
	(27, 'client', 'gameEngine/physics/arcade/gravity/x', '0', 2),
	(28, 'client', 'gameEngine/physics/arcade/gravity/y', '0', 2),
	(29, 'client', 'gameEngine/physics/default', 'arcade', 1),
	(30, 'client', 'gameEngine/scale/autoCenter', '1', 3),
	(31, 'client', 'gameEngine/scale/height', '720', 2),
	(32, 'client', 'gameEngine/scale/min/height', '360', 2),
	(33, 'client', 'gameEngine/scale/min/width', '360', 2),
	(34, 'client', 'gameEngine/scale/mode', '3', 2),
	(35, 'client', 'gameEngine/scale/parent', 'reldens', 1),
	(36, 'client', 'gameEngine/scale/width', '1280', 2),
	(37, 'client', 'gameEngine/type', '0', 2),
	(38, 'client', 'general/animations/frameRate', '10', 2),
	(39, 'client', 'general/assets/arrowDownPath', '/assets/sprites/arrow-down.png', 1),
	(40, 'client', 'general/assets/statsIconPath', '/assets/icons/book.png', 1),
	(41, 'client', 'general/controls/action_button_hold', '0', 3),
	(42, 'client', 'general/controls/allowSimultaneousKeys', '1', 3),
	(43, 'client', 'general/engine/clientInterpolation', '1', 3),
	(44, 'client', 'general/engine/experimentalClientPrediction', '0', 3),
	(45, 'client', 'general/engine/interpolationSpeed', '0.4', 2),
	(46, 'client', 'general/gameEngine/updateGameSizeTimeOut', '500', 2),
	(47, 'client', 'login/termsAndConditions/body', 'This is our test terms and conditions content.', 1),
	(48, 'client', 'login/termsAndConditions/checkboxLabel', 'Accept terms and conditions', 1),
	(49, 'client', 'login/termsAndConditions/es/body', 'Este es el contenido de nuestros términos y condiciones de prueba.', 1),
	(50, 'client', 'login/termsAndConditions/es/checkboxLabel', 'Aceptar terminos y condiciones', 1),
	(51, 'client', 'login/termsAndConditions/es/heading', 'Términos y condiciones', 1),
	(52, 'client', 'login/termsAndConditions/es/link', 'Acepta nuestros Términos y Condiciones (haz clic aquí).', 1),
	(53, 'client', 'login/termsAndConditions/heading', 'Terms and conditions', 1),
	(54, 'client', 'login/termsAndConditions/link', 'Accept our Terms and Conditions (click here).', 1),
	(55, 'client', 'map/layersDepth/belowPlayer', '0', 2),
	(56, 'client', 'map/layersDepth/changePoints', '0', 2),
	(57, 'client', 'map/tileData/height', '16', 2),
	(58, 'client', 'map/tileData/margin', '1', 2),
	(59, 'client', 'map/tileData/spacing', '2', 2),
	(60, 'client', 'map/tileData/width', '16', 2),
	(61, 'client', 'objects/npc/invalidOptionMessage', 'I do not understand.', 1),
	(62, 'client', 'players/animations/basedOnPress', '1', 3),
	(63, 'client', 'players/animations/collideWorldBounds', '1', 3),
	(64, 'client', 'players/animations/defaultFrames/down/end', '2', 2),
	(65, 'client', 'players/animations/defaultFrames/down/start', '0', 2),
	(66, 'client', 'players/animations/defaultFrames/left/end', '5', 2),
	(67, 'client', 'players/animations/defaultFrames/left/start', '3', 2),
	(68, 'client', 'players/animations/defaultFrames/right/end', '8', 2),
	(69, 'client', 'players/animations/defaultFrames/right/start', '6', 2),
	(70, 'client', 'players/animations/defaultFrames/up/end', '11', 2),
	(71, 'client', 'players/animations/defaultFrames/up/start', '9', 2),
	(72, 'client', 'players/animations/diagonalHorizontal', '1', 3),
	(73, 'client', 'players/animations/fadeDuration', '1000', 2),
	(74, 'client', 'players/animations/fallbackImage', 'player-base.png', 1),
	(75, 'client', 'players/multiplePlayers/enabled', '1', 3),
	(76, 'client', 'players/physicalBody/height', '25', 2),
	(77, 'client', 'players/physicalBody/width', '25', 2),
	(78, 'client', 'players/playedTime/label', 'Played time %playedTimeInHs hs', 1),
	(79, 'client', 'players/playedTime/show', '2', 2),
	(80, 'client', 'players/size/height', '71', 2),
	(81, 'client', 'players/size/leftOffset', '0', 2),
	(82, 'client', 'players/size/topOffset', '20', 2),
	(83, 'client', 'players/size/width', '52', 2),
	(84, 'client', 'players/tapMovement/enabled', '1', 3),
	(85, 'client', 'rewards/titles/rewardMessage', 'You obtained %dropQuantity %itemLabel', 1),
	(86, 'client', 'rooms/selection/allowOnLogin', '1', 3),
	(87, 'client', 'rooms/selection/allowOnRegistration', '1', 3),
	(88, 'client', 'rooms/selection/loginAvailableRooms', '*', 1),
	(89, 'client', 'rooms/selection/loginLastLocation', '1', 3),
	(90, 'client', 'rooms/selection/loginLastLocationLabel', 'Last Location', 1),
	(91, 'client', 'rooms/selection/registrationAvailableRooms', '*', 1),
	(92, 'client', 'skills/animations/default_atk', '{"key":"default_atk","animationData":{"enabled":true,"type":"spritesheet","img":"default_atk","frameWidth":64,"frameHeight":64,"start":0,"end":4,"repeat":0}}', 4),
	(93, 'client', 'skills/animations/default_bullet', '{"key":"default_bullet","animationData":{"enabled":true,"type":"spritesheet","img":"default_bullet","frameWidth":64,"frameHeight":64,"start":0,"end":2,"repeat":-1,"rate":1}}', 4),
	(94, 'client', 'skills/animations/default_cast', '{"key": "default_cast","animationData":{"enabled":false,"type":"spritesheet","img":"default_cast","frameWidth":64,"frameHeight":64,"start":0,"end":3,"repeat":0}}', 4),
	(95, 'client', 'skills/animations/default_death', '{"key":"default_death","animationData":{"enabled":true,"type":"spritesheet","img":"default_death","frameWidth":64,"frameHeight":64,"start":0,"end":1,"repeat":0,"rate":1}}', 4),
	(96, 'client', 'skills/animations/default_hit', '{"key":"default_hit","animationData":{"enabled":true,"type":"spritesheet","img":"default_hit","frameWidth":64,"frameHeight":64,"start":0,"end":3,"repeat":0,"depthByPlayer":"above"}}', 4),
	(97, 'client', 'team/labels/leaderNameTitle', 'Team leader: %leaderName', 1),
	(98, 'client', 'team/labels/propertyMaxValue', '/ %propertyMaxValue', 1),
	(99, 'client', 'team/labels/requestFromTitle', 'Team request from:', 1),
	(100, 'client', 'trade/players/awaitTimeOut', '1', 3),
	(101, 'client', 'trade/players/timeOut', '8000', 2),
	(102, 'client', 'ui/chat/damageMessages', '1', 3),
	(103, 'client', 'ui/chat/defaultOpen', '0', 3),
	(104, 'client', 'ui/chat/dodgeMessages', '1', 3),
	(105, 'client', 'ui/chat/effectMessages', '1', 3),
	(106, 'client', 'ui/chat/enabled', '1', 3),
	(107, 'client', 'ui/chat/notificationBalloon', '1', 3),
	(108, 'client', 'ui/chat/overheadChat/closeChatBoxAfterSend', '1', 3),
	(109, 'client', 'ui/chat/overheadChat/enabled', '1', 3),
	(110, 'client', 'ui/chat/overheadChat/isTyping', '1', 3),
	(111, 'client', 'ui/chat/overheadText/align', 'center', 1),
	(112, 'client', 'ui/chat/overheadText/depth', '200000', 2),
	(113, 'client', 'ui/chat/overheadText/fill', '#ffffff', 1),
	(114, 'client', 'ui/chat/overheadText/fontFamily', 'Verdana, Geneva, sans-serif', 1),
	(115, 'client', 'ui/chat/overheadText/fontSize', '12px', 1),
	(116, 'client', 'ui/chat/overheadText/height', '15', 2),
	(117, 'client', 'ui/chat/overheadText/shadowBlur', '5', 2),
	(118, 'client', 'ui/chat/overheadText/shadowColor', 'rgba(0,0,0,0.7)', 1),
	(119, 'client', 'ui/chat/overheadText/shadowX', '5', 2),
	(120, 'client', 'ui/chat/overheadText/shadowY', '5', 2),
	(121, 'client', 'ui/chat/overheadText/stroke', 'rgba(0,0,0,0.7)', 1),
	(122, 'client', 'ui/chat/overheadText/strokeThickness', '20', 2),
	(123, 'client', 'ui/chat/overheadText/textLength', '4', 2),
	(124, 'client', 'ui/chat/overheadText/timeOut', '5000', 2),
	(125, 'client', 'ui/chat/overheadText/topOffset', '20', 2),
	(126, 'client', 'ui/chat/responsiveX', '100', 2),
	(127, 'client', 'ui/chat/responsiveY', '100', 2),
	(128, 'client', 'ui/chat/showTabs', '1', 3),
	(129, 'client', 'ui/chat/totalValidTypes', '2', 2),
	(130, 'client', 'ui/chat/x', '440', 2),
	(131, 'client', 'ui/chat/y', '940', 2),
	(132, 'client', 'ui/clan/enabled', '1', 3),
	(133, 'client', 'ui/clan/responsiveX', '100', 2),
	(134, 'client', 'ui/clan/responsiveY', '0', 2),
	(135, 'client', 'ui/clan/sharedProperties', '{"hp":{"path":"stats/hp","pathMax":"statsBase/hp","label":"HP"},"mp":{"path":"stats/mp","pathMax":"statsBase/mp","label":"MP"}}', 4),
	(136, 'client', 'ui/clan/x', '430', 2),
	(137, 'client', 'ui/clan/y', '100', 2),
	(138, 'client', 'ui/controls/allowPrimaryTouch', '1', 3),
	(139, 'client', 'ui/controls/defaultActionKey', '', 1),
	(140, 'client', 'ui/controls/disableContextMenu', '1', 3),
	(141, 'client', 'ui/controls/enabled', '1', 3),
	(142, 'client', 'ui/controls/opacityEffect', '1', 3),
	(143, 'client', 'ui/controls/primaryMove', '0', 3),
	(144, 'client', 'ui/controls/responsiveX', '0', 2),
	(145, 'client', 'ui/controls/responsiveY', '100', 2),
	(146, 'client', 'ui/controls/tabTarget', '1', 3),
	(147, 'client', 'ui/controls/x', '120', 2),
	(148, 'client', 'ui/controls/y', '390', 2),
	(149, 'client', 'ui/default/responsiveX', '10', 2),
	(150, 'client', 'ui/default/responsiveY', '10', 2),
	(151, 'client', 'ui/default/x', '120', 2),
	(152, 'client', 'ui/default/y', '100', 2),
	(153, 'client', 'ui/equipment/enabled', '1', 3),
	(154, 'client', 'ui/equipment/responsiveX', '100', 2),
	(155, 'client', 'ui/equipment/responsiveY', '0', 2),
	(156, 'client', 'ui/equipment/x', '430', 2),
	(157, 'client', 'ui/equipment/y', '90', 2),
	(158, 'client', 'ui/instructions/enabled', '1', 3),
	(159, 'client', 'ui/instructions/responsiveX', '100', 2),
	(160, 'client', 'ui/instructions/responsiveY', '100', 2),
	(161, 'client', 'ui/instructions/x', '380', 2),
	(162, 'client', 'ui/instructions/y', '940', 2),
	(163, 'client', 'ui/inventory/enabled', '1', 3),
	(164, 'client', 'ui/inventory/responsiveX', '100', 2),
	(165, 'client', 'ui/inventory/responsiveY', '0', 2),
	(166, 'client', 'ui/inventory/x', '380', 2),
	(167, 'client', 'ui/inventory/y', '450', 2),
	(168, 'client', 'ui/lifeBar/enabled', '1', 3),
	(169, 'client', 'ui/lifeBar/fillStyle', '0xff0000', 1),
	(170, 'client', 'ui/lifeBar/fixedPosition', '0', 3),
	(171, 'client', 'ui/lifeBar/height', '5', 2),
	(172, 'client', 'ui/lifeBar/lineStyle', '0xffffff', 1),
	(173, 'client', 'ui/lifeBar/responsiveX', '1', 2),
	(174, 'client', 'ui/lifeBar/responsiveY', '24', 2),
	(175, 'client', 'ui/lifeBar/showAllPlayers', '0', 3),
	(176, 'client', 'ui/lifeBar/showEnemies', '1', 3),
	(177, 'client', 'ui/lifeBar/showOnClick', '1', 3),
	(178, 'client', 'ui/lifeBar/top', '5', 2),
	(179, 'client', 'ui/lifeBar/width', '50', 2),
	(180, 'client', 'ui/lifeBar/x', '5', 2),
	(181, 'client', 'ui/lifeBar/y', '12', 2),
	(182, 'client', 'ui/loading/assetsColor', '#ffffff', 1),
	(183, 'client', 'ui/loading/assetsSize', '18px', 1),
	(184, 'client', 'ui/loading/font', 'Verdana, Geneva, sans-serif', 1),
	(185, 'client', 'ui/loading/fontSize', '20px', 1),
	(186, 'client', 'ui/loading/loadingColor', '#ffffff', 1),
	(187, 'client', 'ui/loading/percentColor', '#666666', 1),
	(188, 'client', 'ui/loading/showAssets', '1', 3),
	(189, 'client', 'ui/maximum/x', '1280', 2),
	(190, 'client', 'ui/maximum/y', '720', 2),
	(191, 'client', 'ui/minimap/addCircle', '1', 3),
	(192, 'client', 'ui/minimap/camBackgroundColor', 'rgba(0,0,0,0.6)', 1),
	(193, 'client', 'ui/minimap/camX', '140', 2),
	(194, 'client', 'ui/minimap/camY', '10', 2),
	(195, 'client', 'ui/minimap/camZoom', '0.15', 2),
	(196, 'client', 'ui/minimap/circleAlpha', '1', 2),
	(197, 'client', 'ui/minimap/circleColor', 'rgb(0,0,0)', 1),
	(198, 'client', 'ui/minimap/circleFillAlpha', '0', 2),
	(199, 'client', 'ui/minimap/circleFillColor', '1', 2),
	(200, 'client', 'ui/minimap/circleRadio', '80.35', 2),
	(201, 'client', 'ui/minimap/circleStrokeAlpha', '0.6', 2),
	(202, 'client', 'ui/minimap/circleStrokeColor', '0', 2),
	(203, 'client', 'ui/minimap/circleStrokeLineWidth', '6', 2),
	(204, 'client', 'ui/minimap/circleX', '220', 2),
	(205, 'client', 'ui/minimap/circleY', '88', 2),
	(206, 'client', 'ui/minimap/enabled', '1', 3),
	(207, 'client', 'ui/minimap/fixedHeight', '450', 2),
	(208, 'client', 'ui/minimap/fixedWidth', '450', 2),
	(209, 'client', 'ui/minimap/mapHeightDivisor', '1', 2),
	(210, 'client', 'ui/minimap/mapWidthDivisor', '1', 2),
	(211, 'client', 'ui/minimap/responsiveX', '34', 2),
	(212, 'client', 'ui/minimap/responsiveY', '2.4', 2),
	(213, 'client', 'ui/minimap/roundMap', '1', 3),
	(214, 'client', 'ui/minimap/x', '180', 2),
	(215, 'client', 'ui/minimap/y', '10', 2),
	(216, 'client', 'ui/npcDialog/responsiveX', '10', 2),
	(217, 'client', 'ui/npcDialog/responsiveY', '10', 2),
	(218, 'client', 'ui/npcDialog/x', '120', 2),
	(219, 'client', 'ui/npcDialog/y', '100', 2),
	(220, 'client', 'ui/options/acceptOrDecline', '{"1":{"label":"Accept","value":1},"2":{"label":"Decline","value":2}}', 4),
	(221, 'client', 'ui/playerBox/enabled', '1', 3),
	(222, 'client', 'ui/playerBox/responsiveX', '0', 2),
	(223, 'client', 'ui/playerBox/responsiveY', '0', 2),
	(224, 'client', 'ui/playerBox/x', '50', 2),
	(225, 'client', 'ui/playerBox/y', '30', 2),
	(226, 'client', 'ui/players/nameText/align', 'center', 1),
	(227, 'client', 'ui/players/nameText/depth', '200000', 2),
	(228, 'client', 'ui/players/nameText/fill', '#ffffff', 1),
	(229, 'client', 'ui/players/nameText/fontFamily', 'Verdana, Geneva, sans-serif', 1),
	(230, 'client', 'ui/players/nameText/fontSize', '12px', 1),
	(231, 'client', 'ui/players/nameText/height', '-90', 2),
	(232, 'client', 'ui/players/nameText/shadowBlur', '5', 2),
	(233, 'client', 'ui/players/nameText/shadowColor', 'rgba(0,0,0,0.7)', 1),
	(234, 'client', 'ui/players/nameText/shadowX', '5', 2),
	(235, 'client', 'ui/players/nameText/shadowY', '5', 2),
	(236, 'client', 'ui/players/nameText/stroke', '#000000', 1),
	(237, 'client', 'ui/players/nameText/strokeThickness', '4', 2),
	(238, 'client', 'ui/players/nameText/textLength', '4', 2),
	(239, 'client', 'ui/players/showNames', '1', 3),
	(240, 'client', 'ui/playerStats/enabled', '1', 3),
	(241, 'client', 'ui/playerStats/responsiveX', '100', 2),
	(242, 'client', 'ui/playerStats/responsiveY', '0', 2),
	(243, 'client', 'ui/playerStats/x', '430', 2),
	(244, 'client', 'ui/playerStats/y', '20', 2),
	(245, 'client', 'ui/pointer/show', '1', 3),
	(246, 'client', 'ui/pointer/topOffSet', '16', 2),
	(247, 'client', 'ui/sceneLabel/enabled', '1', 3),
	(248, 'client', 'ui/sceneLabel/responsiveX', '50', 2),
	(249, 'client', 'ui/sceneLabel/responsiveY', '0', 2),
	(250, 'client', 'ui/sceneLabel/x', '250', 2),
	(251, 'client', 'ui/sceneLabel/y', '20', 2),
	(252, 'client', 'ui/screen/responsive', '1', 3),
	(253, 'client', 'ui/settings/enabled', '1', 3),
	(254, 'client', 'ui/settings/responsiveX', '100', 2),
	(255, 'client', 'ui/settings/responsiveY', '100', 2),
	(256, 'client', 'ui/settings/x', '940', 2),
	(257, 'client', 'ui/settings/y', '280', 2),
	(258, 'client', 'ui/skills/enabled', '1', 3),
	(259, 'client', 'ui/skills/responsiveX', '0', 2),
	(260, 'client', 'ui/skills/responsiveY', '100', 2),
	(261, 'client', 'ui/skills/x', '230', 2),
	(262, 'client', 'ui/skills/y', '390', 2),
	(263, 'client', 'ui/teams/enabled', '1', 3),
	(264, 'client', 'ui/teams/responsiveX', '100', 2),
	(265, 'client', 'ui/teams/responsiveY', '0', 2),
	(266, 'client', 'ui/teams/sharedProperties', '{"hp":{"path":"stats/hp","pathMax":"statsBase/hp","label":"HP"},"mp":{"path":"stats/mp","pathMax":"statsBase/mp","label":"MP"}}', 4),
	(267, 'client', 'ui/teams/x', '430', 2),
	(268, 'client', 'ui/teams/y', '100', 2),
	(269, 'client', 'ui/trade/responsiveX', '5', 2),
	(270, 'client', 'ui/trade/responsiveY', '5', 2),
	(271, 'client', 'ui/trade/x', '5', 2),
	(272, 'client', 'ui/trade/y', '5', 2),
	(273, 'client', 'ui/uiTarget/enabled', '1', 3),
	(274, 'client', 'ui/uiTarget/hideOnDialog', '0', 3),
	(275, 'client', 'ui/uiTarget/responsiveX', '0', 2),
	(276, 'client', 'ui/uiTarget/responsiveY', '0', 2),
	(277, 'client', 'ui/uiTarget/x', '10', 2),
	(278, 'client', 'ui/uiTarget/y', '85', 2),
	(279, 'client', 'world/debug/enabled', '0', 3),
	(280, 'server', 'actions/pvp/battleTimeOff', '20000', 2),
	(281, 'server', 'actions/pvp/timerType', 'bt', 1),
	(282, 'server', 'admin/companyName', 'Reldens - Administration Panel', 1),
	(283, 'server', 'admin/faviconPath', '/assets/web/favicon.ico', 1),
	(284, 'server', 'admin/logoPath', '/assets/web/reldens-your-logo-mage.png', 1),
	(285, 'server', 'admin/roleId', '99', 2),
	(286, 'server', 'admin/stylesPath', '/css/reldens-admin.css', 1),
	(287, 'server', 'chat/messages/broadcast_join', '1', 3),
	(288, 'server', 'chat/messages/broadcast_leave', '1', 3),
	(289, 'server', 'chat/messages/global_allowed_roles', '1,9000', 1),
	(290, 'server', 'chat/messages/global_enabled', '1', 3),
	(291, 'server', 'enemies/default/affectedProperty', 'stats/hp', 1),
	(292, 'server', 'enemies/default/skillKey', 'attackShort', 1),
	(293, 'server', 'enemies/initialStats/aim', '50', 2),
	(294, 'server', 'enemies/initialStats/atk', '50', 2),
	(295, 'server', 'enemies/initialStats/def', '50', 2),
	(296, 'server', 'enemies/initialStats/dodge', '50', 2),
	(297, 'server', 'enemies/initialStats/hp', '50', 2),
	(298, 'server', 'enemies/initialStats/mp', '50', 2),
	(299, 'server', 'enemies/initialStats/speed', '50', 2),
	(300, 'server', 'enemies/initialStats/stamina', '50', 2),
	(301, 'server', 'objects/actions/closeInteractionOnOutOfReach', '1', 3),
	(302, 'server', 'objects/actions/interactionsDistance', '140', 2),
	(303, 'server', 'players/actions/initialClassPathId', '1', 2),
	(304, 'server', 'players/actions/interactionDistance', '40', 2),
	(305, 'server', 'players/gameOver/timeOut', '10000', 2),
	(306, 'server', 'players/initialState/dir', 'down', 1),
	(307, 'server', 'players/initialState/room_id', '4', 2),
	(308, 'server', 'players/initialState/x', '400', 2),
	(309, 'server', 'players/initialState/y', '345', 2),
	(310, 'server', 'players/initialUser/roleId', '1', 2),
	(311, 'server', 'players/initialUser/status', '1', 2),
	(312, 'server', 'players/physicsBody/speed', '180', 2),
	(313, 'server', 'players/physicsBody/usePlayerSpeedConfig', '0', 3),
	(314, 'server', 'players/physicsBody/usePlayerSpeedProperty', '0', 3),
	(315, 'server', 'rewards/actions/disappearTime', '1800000', 2),
	(316, 'server', 'rewards/actions/interactionsDistance', '40', 2),
	(317, 'server', 'rooms/validation/enabled', '1', 3),
	(318, 'server', 'rooms/validation/valid', 'room_game,chat_global', 1),
	(319, 'server', 'rooms/world/bulletsStopOnPlayer', '1', 3),
	(320, 'server', 'rooms/world/groupWallsHorizontally', '1', 3),
	(321, 'server', 'rooms/world/groupWallsVertically', '0', 3),
	(322, 'server', 'rooms/world/movementSpeed', '180', 2),
	(323, 'server', 'rooms/world/onlyWalkable', '1', 3),
	(324, 'server', 'rooms/world/timeStep', '0.04', 2),
	(325, 'server', 'rooms/world/tryClosestPath', '1', 3);

REPLACE INTO `features` (`id`, `code`, `title`, `is_enabled`) VALUES
	(1, 'chat', 'Chat', 1),
	(2, 'objects', 'Objects', 1),
	(3, 'respawn', 'Respawn', 1),
	(4, 'inventory', 'Inventory', 1),
	(5, 'firebase', 'Firebase', 1),
	(6, 'actions', 'Actions', 1),
	(7, 'users', 'Users', 1),
	(8, 'audio', 'Audio', 1),
	(9, 'rooms', 'Rooms', 1),
	(10, 'admin', 'Admin', 1),
	(11, 'prediction', 'Prediction', 0),
	(12, 'teams', 'Teams', 1),
	(13, 'rewards', 'Rewards', 1),
	(14, 'snippets', 'Snippets', 1),
	(16, 'ads', 'Ads', 1),
	(17, 'world', 'World', 0);

REPLACE INTO `items_group` (`id`, `key`, `label`, `description`, `files_name`, `sort`, `items_limit`, `limit_per_item`) VALUES
	(1, 'weapon', 'Weapon', 'All kinds of weapons.', 'weapon.png', 2, 1, 0),
	(2, 'shield', 'Shield', 'Protect with these items.', 'shield.png', 3, 1, 0),
	(3, 'armor', 'Armor', '', 'armor.png', 4, 1, 0),
	(4, 'boots', 'Boots', '', 'boots.png', 6, 1, 0),
	(5, 'gauntlets', 'Gauntlets', '', 'gauntlets.png', 5, 1, 0),
	(6, 'helmet', 'Helmet', '', 'helmet.png', 1, 1, 0);

REPLACE INTO `items_item` (`id`, `key`, `type`, `group_id`, `label`, `description`, `qty_limit`, `uses_limit`, `useTimeOut`, `execTimeOut`, `customData`) VALUES
	(1, 'coins', 3, NULL, 'Coins', NULL, 0, 1, NULL, NULL, NULL),
	(2, 'branch', 10, NULL, 'Tree branch', 'An useless tree branch (for now)', 0, 1, NULL, NULL, NULL),
	(3, 'heal_potion_20', 5, NULL, 'Heal Potion', 'A heal potion that will restore 20 HP.', 0, 1, NULL, NULL, '{"animationData":{"frameWidth":64,"frameHeight":64,"start":6,"end":11,"repeat":0,"usePlayerPosition":true,"followPlayer":true,"startsOnTarget":true},"removeAfterUse":true}'),
	(4, 'axe', 1, 1, 'Axe', 'A short distance but powerful weapon.', 0, 0, NULL, NULL, '{"animationData":{"frameWidth":64,"frameHeight":64,"start":6,"end":11,"repeat":0,"destroyOnComplete":true,"usePlayerPosition":true,"followPlayer":true,"startsOnTarget":true}}'),
	(5, 'spear', 1, 1, 'Spear', 'A short distance but powerful weapon.', 0, 0, NULL, NULL, '{"animationData":{"frameWidth":64,"frameHeight":64,"start":6,"end":11,"repeat":0,"destroyOnComplete":true,"usePlayerPosition":true,"followPlayer":true,"startsOnTarget":true}}'),
	(6, 'magic_potion_20', 5, NULL, 'Magic Potion', 'A magic potion that will restore 20 MP.', 0, 1, NULL, NULL, '{"animationData":{"frameWidth":64,"frameHeight":64,"start":6,"end":11,"repeat":0,"usePlayerPosition":true,"followPlayer":true,"startsOnTarget":true},"removeAfterUse":true}');

REPLACE INTO `items_item_modifiers` (`id`, `item_id`, `key`, `property_key`, `operation`, `value`, `maxProperty`) VALUES
	(1, 4, 'atk', 'stats/atk', 5, '5', NULL),
	(2, 3, 'heal_potion_20', 'stats/hp', 1, '20', 'statsBase/hp'),
	(3, 5, 'atk', 'stats/atk', 5, '3', NULL),
	(4, 6, 'magic_potion_20', 'stats/mp', 1, '20', 'statsBase/mp');

REPLACE INTO `items_types` (`id`, `key`) VALUES
	(10, 'base'),
	(1, 'equipment'),
	(3, 'single'),
	(4, 'single_equipment'),
	(5, 'single_usable'),
	(2, 'usable');

REPLACE INTO `locale` (`id`, `locale`, `language_code`, `country_code`, `enabled`) VALUES
	(1, 'en_US', 'en', 'US', 1);

REPLACE INTO `objects` (`id`, `room_id`, `layer_name`, `tile_index`, `class_type`, `object_class_key`, `client_key`, `title`, `private_params`, `client_params`, `enabled`) VALUES
	(1, 4, 'ground-collisions', 444, 2, 'door_1', 'door_house_1', '', '{"runOnHit":true,"roomVisible":true,"yFix":6}', '{"positionFix":{"y":-18},"frameStart":0,"frameEnd":3,"repeat":0,"hideOnComplete":false,"autoStart":false,"restartTime":2000}', 1),
	(4, 4, 'ground-collisions', 951, 2, 'door_2', 'door_house_2', '', '{"runOnHit":true,"roomVisible":true,"yFix":6}', '{"positionFix":{"y":-18},"frameStart":0,"frameEnd":3,"repeat":0,"hideOnComplete":false,"autoStart":false,"restartTime":2000}', 1),
	(5, 4, 'house-collisions-over-player', 535, 3, 'npc_1', 'people_town_1', 'Alfred', '{"runOnAction":true,"playerVisible":true}', '{"content":"Hello! My name is Alfred. Go to the forest and kill some monsters! Now... leave me alone!"}', 1),
	(6, 5, 'respawn-area-monsters-lvl-1-2', NULL, 7, 'enemy_1', 'enemy_forest_1', 'Tree', '{"shouldRespawn":true,"childObjectType":4,"isAggressive":true}', '{"autoStart":true}', 1),
	(7, 5, 'respawn-area-monsters-lvl-1-2', NULL, 7, 'enemy_2', 'enemy_forest_2', 'Tree Punch', '{"shouldRespawn":true,"childObjectType":4}', '{"autoStart":true}', 1),
	(8, 4, 'house-collisions-over-player', 538, 3, 'npc_2', 'healer_1', 'Mamon', '{"runOnAction":true,"playerVisible":true,"sendInvalidOptionMessage":true}', '{"content":"Hello traveler! I can restore your health, would you like me to do it?","options":{"1":{"label":"Heal HP","value":1},"2":{"label":"Nothing...","value":2},"3":{"label":"Need some MP","value":3}},"ui":true}', 1),
	(10, 4, 'house-collisions-over-player', 560, 5, 'npc_3', 'merchant_1', 'Gimly', '{"runOnAction":true,"playerVisible":true,"sendInvalidOptionMessage":true}', '{"content":"Hi there! What would you like to do?","options":{"buy":{"label":"Buy","value":"buy"},"sell":{"label":"Sell","value":"sell"}}}', 1),
	(12, 4, 'house-collisions-over-player', 562, 3, 'npc_4', 'weapons_master_1', 'Barrik', '{"runOnAction":true,"playerVisible":true,"sendInvalidOptionMessage":true}', '{"content":"Hi, I am the weapons master, choose your weapon and go kill some monsters!","options":{"1":{"key":"axe","label":"Axe","value":1,"icon":"axe"},"2":{"key":"spear","label":"Spear","value":2,"icon":"spear"}},"ui":true}', 1),
	(13, 5, 'forest-collisions', 258, 3, 'npc_5', 'quest_npc_1', 'Miles', '{"runOnAction":true,"playerVisible":true,"sendInvalidOptionMessage":true}', '{"content":"Hi there! Do you want a coin? I can give you one if you give me a tree branch.","options":{"1":{"label":"Sure!","value":1},"2":{"label":"No, thank you.","value":2}},"ui":true}', 1);

REPLACE INTO `objects_animations` (`id`, `object_id`, `animationKey`, `animationData`) VALUES
	(5, 6, 'respawn-area-monsters-lvl-1-2_6_right', '{"start":6,"end":8}'),
	(6, 6, 'respawn-area-monsters-lvl-1-2_6_down', '{"start":0,"end":2}'),
	(7, 6, 'respawn-area-monsters-lvl-1-2_6_left', '{"start":3,"end":5}'),
	(8, 6, 'respawn-area-monsters-lvl-1-2_6_up', '{"start":9,"end":11}');

REPLACE INTO `objects_assets` (`object_asset_id`, `object_id`, `asset_type`, `asset_key`, `asset_file`, `extra_params`) VALUES
	(1, 1, 'spritesheet', 'door_house_1', 'door-a-x2.png', '{"frameWidth":32,"frameHeight":58}'),
	(2, 4, 'spritesheet', 'door_house_2', 'door-a-x2.png', '{"frameWidth":32,"frameHeight":58}'),
	(3, 5, 'spritesheet', 'people_town_1', 'people-b-x2.png', '{"frameWidth":52,"frameHeight":71}'),
	(5, 6, 'spritesheet', 'enemy_forest_1', 'monster-treant.png', '{"frameWidth":47,"frameHeight":50}'),
	(6, 7, 'spritesheet', 'enemy_forest_2', 'monster-golem2.png', '{"frameWidth":47,"frameHeight":50}'),
	(7, 5, 'spritesheet', 'healer_1', 'healer-1.png', '{"frameWidth":52,"frameHeight":71}'),
	(9, 10, 'spritesheet', 'merchant_1', 'people-d-x2.png', '{"frameWidth":52,"frameHeight":71}'),
	(10, 12, 'spritesheet', 'weapons_master_1', 'people-c-x2.png', '{"frameWidth":52,"frameHeight":71}'),
	(11, 13, 'spritesheet', 'quest_npc_1', 'people-quest-npc.png', '{"frameWidth":52,"frameHeight":71}');

REPLACE INTO `objects_items_inventory` (`id`, `owner_id`, `item_id`, `qty`, `remaining_uses`, `is_active`) VALUES
	(2, 10, 4, -1, -1, 0),
	(3, 10, 5, -1, -1, 0),
	(5, 10, 3, -1, 1, 0),
	(6, 10, 6, -1, 1, 0);

REPLACE INTO `objects_items_requirements` (`id`, `object_id`, `item_key`, `required_item_key`, `required_quantity`, `auto_remove_requirement`) VALUES
	(1, 10, 'axe', 'coins', 5, 1),
	(2, 10, 'spear', 'coins', 2, 1),
	(3, 10, 'heal_potion_20', 'coins', 2, 1),
	(5, 10, 'magic_potion_20', 'coins', 2, 1);

REPLACE INTO `objects_items_rewards` (`id`, `object_id`, `item_key`, `reward_item_key`, `reward_quantity`, `reward_item_is_required`) VALUES
	(1, 10, 'axe', 'coins', 2, 0),
	(2, 10, 'spear', 'coins', 1, 0),
	(3, 10, 'heal_potion_20', 'coins', 1, 0),
	(5, 10, 'magic_potion_20', 'coins', 1, 0);

REPLACE INTO `objects_items_rewards_animations` (`id`, `reward_id`, `asset_type`, `asset_key`, `file`, `extra_params`) VALUES
	(1, 2, 'spritesheet', 'branch-sprite', 'branch-sprite', '{"start":0,"end":2,"repeat":-1,"frameWidth":32, "frameHeight":32,"depthByPlayer":"above"}'),
	(2, 1, 'spritesheet', 'branch-sprite', 'branch-sprite', '{"start":0,"end":2,"repeat":-1,"frameWidth":32, "frameHeight":32,"depthByPlayer":"above"}');

REPLACE INTO `objects_skills` (`id`, `object_id`, `skill_id`, `target`) VALUES
	(1, 6, 1, 1);

REPLACE INTO `objects_stats` (`id`, `object_id`, `stat_id`, `base_value`, `value`) VALUES
	(1, 7, 1, 50, 50),
	(2, 7, 2, 50, 50),
	(3, 7, 3, 50, 50),
	(4, 7, 4, 50, 50),
	(5, 7, 5, 50, 50),
	(6, 7, 6, 50, 50),
	(7, 7, 7, 50, 50),
	(8, 7, 8, 50, 50),
	(9, 7, 9, 50, 50),
	(10, 7, 10, 50, 50),
	(16, 6, 1, 50, 50),
	(17, 6, 2, 50, 50),
	(18, 6, 3, 50, 50),
	(19, 6, 4, 50, 50),
	(20, 6, 5, 50, 50),
	(21, 6, 6, 50, 50),
	(22, 6, 7, 50, 50),
	(23, 6, 8, 50, 50),
	(24, 6, 9, 50, 50),
	(25, 6, 10, 50, 50);

REPLACE INTO `objects_types` (`id`, `key`) VALUES
	(2, 'animation'),
	(1, 'base'),
	(6, 'drop'),
	(4, 'enemy'),
	(7, 'multiple'),
	(3, 'npc'),
	(5, 'trader');

REPLACE INTO `operation_types` (`id`, `label`, `key`) VALUES
	(1, 'Increment', 1),
	(3, 'Decrease', 2),
	(4, 'Divide', 3),
	(5, 'Multiply', 4),
	(6, 'Increment Percentage', 5),
	(7, 'Decrease Percentage', 6),
	(8, 'Set', 7),
	(9, 'Method', 8),
	(10, 'Set Number', 9);

REPLACE INTO `players` (`id`, `user_id`, `name`, `created_at`) VALUES
	(1, 1, 'ImRoot', '2022-03-17 19:57:50');

REPLACE INTO `players_state` (`id`, `player_id`, `room_id`, `x`, `y`, `dir`) VALUES
	(1, 1, 5, 332, 288, 'down');

REPLACE INTO `players_stats` (`id`, `player_id`, `stat_id`, `base_value`, `value`) VALUES
	(1, 1, 1, 280, 81),
	(2, 1, 2, 280, 85),
	(3, 1, 3, 280, 400),
	(4, 1, 4, 280, 280),
	(5, 1, 5, 100, 100),
	(6, 1, 6, 100, 100),
	(7, 1, 7, 100, 100),
	(8, 1, 8, 100, 100),
	(9, 1, 9, 100, 100),
	(10, 1, 10, 100, 100);

REPLACE INTO `respawn` (`id`, `object_id`, `respawn_time`, `instances_limit`, `layer`) VALUES
	(3, 6, 20000, 2, 'respawn-area-monsters-lvl-1-2'),
	(4, 7, 10000, 3, 'respawn-area-monsters-lvl-1-2');

REPLACE INTO `rewards` (`id`, `object_id`, `item_id`, `modifier_id`, `experience`, `drop_rate`, `drop_quantity`, `is_unique`, `was_given`, `has_drop_body`) VALUES
	(1, 7, 2, NULL, 10, 100, 1, 0, 0, 1),
	(2, 6, 2, NULL, 10, 100, 3, 0, 0, 1);

REPLACE INTO `rooms` (`id`, `name`, `title`, `map_filename`, `scene_images`, `room_class_key`, `customData`) VALUES
	(2, 'reldens-house-1', 'House - 1', 'reldens-house-1.json', 'reldens-house-1.png', NULL, NULL),
	(3, 'reldens-house-2', 'House - 2', 'reldens-house-2.json', 'reldens-house-2.png', NULL, NULL),
	(4, 'reldens-town', 'Town', 'reldens-town.json', 'reldens-town.png', NULL, NULL),
	(5, 'reldens-forest', 'Forest', 'reldens-forest.json', 'reldens-forest.png', NULL, NULL),
	(6, 'reldens-house-1-2d-floor', 'House - 1 - Floor 2', 'reldens-house-1-2d-floor.json', 'reldens-house-1-2d-floor.png', NULL, NULL),
	(7, 'reldens-gravity', 'Gravity World!', 'reldens-gravity.json', 'reldens-gravity.png', NULL, '{"gravity":[0,625],"applyGravity":true,"allowPassWallsFromBelow":true,"timeStep":0.012,"type":"TOP_DOWN_WITH_GRAVITY","useFixedWorldStep":false,"maxSubSteps":2,"movementSpeed":160,"usePathFinder":false}');

REPLACE INTO `rooms_change_points` (`id`, `room_id`, `tile_index`, `next_room_id`) VALUES
	(1, 2, 816, 4),
	(2, 2, 817, 4),
	(3, 3, 778, 4),
	(4, 3, 779, 4),
	(5, 4, 444, 2),
	(6, 4, 951, 3),
	(7, 4, 18, 5),
	(8, 4, 19, 5),
	(9, 5, 1315, 4),
	(10, 5, 1316, 4),
	(11, 2, 623, 6),
	(12, 2, 663, 6),
	(13, 6, 624, 2),
	(14, 6, 664, 2),
	(15, 7, 540, 3),
	(16, 3, 500, 7),
	(17, 3, 780, 4);

REPLACE INTO `rooms_return_points` (`id`, `room_id`, `direction`, `x`, `y`, `is_default`, `from_room_id`) VALUES
	(1, 2, 'up', 548, 615, 1, 4),
	(2, 3, 'up', 640, 600, 1, 4),
	(3, 4, 'down', 400, 345, 1, 2),
	(4, 4, 'down', 1266, 670, 0, 3),
	(5, 5, 'up', 640, 768, 0, 4),
	(7, 4, 'down', 615, 64, 0, 5),
	(9, 6, 'right', 820, 500, 0, 2),
	(11, 2, 'left', 720, 540, 0, 6),
	(12, 7, 'left', 340, 600, 0, NULL),
	(13, 3, 'down', 660, 520, 0, 7);

REPLACE INTO `skills_class_level_up_animations` (`id`, `class_path_id`, `level_id`, `animationData`) VALUES
	(1, NULL, NULL, '{"enabled":true,"type":"spritesheet","img":"heal_cast","frameWidth":64,"frameHeight":70,"start":0,"end":3,"repeat":-1,"destroyTime":2000,"depthByPlayer":"above"}');

REPLACE INTO `skills_class_path` (`id`, `key`, `label`, `levels_set_id`, `enabled`) VALUES
	(1, 'journeyman', 'Journeyman', 1, 1),
	(2, 'sorcerer', 'Sorcerer', 2, 1),
	(3, 'warlock', 'Warlock', 3, 1),
	(4, 'swordsman', 'Swordsman', 4, 1),
	(5, 'warrior', 'Warrior', 5, 1);

REPLACE INTO `skills_class_path_level_labels` (`id`, `class_path_id`, `level_id`, `label`) VALUES
	(1, 1, 3, 'Old Traveler'),
	(2, 2, 7, 'Fire Master'),
	(3, 3, 11, 'Magus'),
	(4, 4, 15, 'Blade Master'),
	(5, 5, 19, 'Palading');

REPLACE INTO `skills_class_path_level_skills` (`id`, `class_path_id`, `level_id`, `skill_id`) VALUES
	(1, 1, 1, 2),
	(2, 1, 3, 1),
	(3, 1, 4, 3),
	(4, 1, 4, 4),
	(5, 2, 5, 1),
	(6, 2, 7, 3),
	(7, 2, 8, 4),
	(8, 3, 9, 1),
	(9, 3, 11, 3),
	(10, 3, 12, 2),
	(11, 4, 13, 2),
	(12, 4, 15, 4),
	(13, 5, 17, 2),
	(14, 5, 19, 1),
	(15, 5, 20, 4);

REPLACE INTO `skills_levels` (`id`, `key`, `label`, `required_experience`, `level_set_id`) VALUES
	(1, 1, '1', 0, 1),
	(2, 2, '2', 100, 1),
	(3, 5, '5', 338, 1),
	(4, 10, '10', 2570, 1),
	(5, 1, '1', 0, 2),
	(6, 2, '2', 100, 2),
	(7, 5, '5', 338, 2),
	(8, 10, '10', 2570, 2),
	(9, 1, '1', 0, 3),
	(10, 2, '2', 100, 3),
	(11, 5, '5', 338, 3),
	(12, 10, '10', 2570, 3),
	(13, 1, '1', 0, 4),
	(14, 2, '2', 100, 4),
	(15, 5, '5', 338, 4),
	(16, 10, '10', 2570, 4),
	(17, 1, '1', 0, 5),
	(18, 2, '2', 100, 5),
	(19, 5, '5', 338, 5),
	(20, 10, '10', 2570, 5);

REPLACE INTO `skills_levels_modifiers` (`id`, `level_id`, `key`, `property_key`, `operation`, `value`, `minValue`, `maxValue`, `minProperty`, `maxProperty`) VALUES
	(1, 2, 'inc_atk', 'stats/atk', 1, '10', NULL, NULL, NULL, NULL),
	(2, 2, 'inc_def', 'stats/def', 1, '10', NULL, NULL, NULL, NULL),
	(3, 2, 'inc_hp', 'stats/hp', 1, '10', NULL, NULL, NULL, NULL),
	(4, 2, 'inc_mp', 'stats/mp', 1, '10', NULL, NULL, NULL, NULL),
	(5, 2, 'inc_atk', 'statsBase/atk', 1, '10', NULL, NULL, NULL, NULL),
	(6, 2, 'inc_def', 'statsBase/def', 1, '10', NULL, NULL, NULL, NULL),
	(7, 2, 'inc_hp', 'statsBase/hp', 1, '10', NULL, NULL, NULL, NULL),
	(8, 2, 'inc_mp', 'statsBase/mp', 1, '10', NULL, NULL, NULL, NULL),
	(9, 3, 'inc_atk', 'stats/atk', 1, '20', NULL, NULL, NULL, NULL),
	(10, 3, 'inc_def', 'stats/def', 1, '20', NULL, NULL, NULL, NULL),
	(11, 3, 'inc_hp', 'stats/hp', 1, '20', NULL, NULL, NULL, NULL),
	(12, 3, 'inc_mp', 'stats/mp', 1, '20', NULL, NULL, NULL, NULL),
	(13, 3, 'inc_atk', 'statsBase/atk', 1, '20', NULL, NULL, NULL, NULL),
	(14, 3, 'inc_def', 'statsBase/def', 1, '20', NULL, NULL, NULL, NULL),
	(15, 3, 'inc_hp', 'statsBase/hp', 1, '20', NULL, NULL, NULL, NULL),
	(16, 3, 'inc_mp', 'statsBase/mp', 1, '20', NULL, NULL, NULL, NULL),
	(17, 4, 'inc_atk', 'stats/atk', 1, '50', NULL, NULL, NULL, NULL),
	(18, 4, 'inc_def', 'stats/def', 1, '50', NULL, NULL, NULL, NULL),
	(19, 4, 'inc_hp', 'stats/hp', 1, '50', NULL, NULL, NULL, NULL),
	(20, 4, 'inc_mp', 'stats/mp', 1, '50', NULL, NULL, NULL, NULL),
	(21, 4, 'inc_atk', 'statsBase/atk', 1, '50', NULL, NULL, NULL, NULL),
	(22, 4, 'inc_def', 'statsBase/def', 1, '50', NULL, NULL, NULL, NULL),
	(23, 4, 'inc_hp', 'statsBase/hp', 1, '50', NULL, NULL, NULL, NULL),
	(24, 4, 'inc_mp', 'statsBase/mp', 1, '50', NULL, NULL, NULL, NULL),
	(25, 6, 'inc_atk', 'stats/atk', 1, '10', NULL, NULL, NULL, NULL),
	(26, 6, 'inc_def', 'stats/def', 1, '10', NULL, NULL, NULL, NULL),
	(27, 6, 'inc_hp', 'stats/hp', 1, '10', NULL, NULL, NULL, NULL),
	(28, 6, 'inc_mp', 'stats/mp', 1, '10', NULL, NULL, NULL, NULL),
	(29, 6, 'inc_atk', 'statsBase/atk', 1, '10', NULL, NULL, NULL, NULL),
	(30, 6, 'inc_def', 'statsBase/def', 1, '10', NULL, NULL, NULL, NULL),
	(31, 6, 'inc_hp', 'statsBase/hp', 1, '10', NULL, NULL, NULL, NULL),
	(32, 6, 'inc_mp', 'statsBase/mp', 1, '10', NULL, NULL, NULL, NULL),
	(33, 7, 'inc_atk', 'stats/atk', 1, '20', NULL, NULL, NULL, NULL),
	(34, 7, 'inc_def', 'stats/def', 1, '20', NULL, NULL, NULL, NULL),
	(35, 7, 'inc_hp', 'stats/hp', 1, '20', NULL, NULL, NULL, NULL),
	(36, 7, 'inc_mp', 'stats/mp', 1, '20', NULL, NULL, NULL, NULL),
	(37, 7, 'inc_atk', 'statsBase/atk', 1, '20', NULL, NULL, NULL, NULL),
	(38, 7, 'inc_def', 'statsBase/def', 1, '20', NULL, NULL, NULL, NULL),
	(39, 7, 'inc_hp', 'statsBase/hp', 1, '20', NULL, NULL, NULL, NULL),
	(40, 7, 'inc_mp', 'statsBase/mp', 1, '20', NULL, NULL, NULL, NULL),
	(41, 8, 'inc_atk', 'stats/atk', 1, '50', NULL, NULL, NULL, NULL),
	(42, 8, 'inc_def', 'stats/def', 1, '50', NULL, NULL, NULL, NULL),
	(43, 8, 'inc_hp', 'stats/hp', 1, '50', NULL, NULL, NULL, NULL),
	(44, 8, 'inc_mp', 'stats/mp', 1, '50', NULL, NULL, NULL, NULL),
	(45, 8, 'inc_atk', 'statsBase/atk', 1, '50', NULL, NULL, NULL, NULL),
	(46, 8, 'inc_def', 'statsBase/def', 1, '50', NULL, NULL, NULL, NULL),
	(47, 8, 'inc_hp', 'statsBase/hp', 1, '50', NULL, NULL, NULL, NULL),
	(48, 8, 'inc_mp', 'statsBase/mp', 1, '50', NULL, NULL, NULL, NULL),
	(49, 10, 'inc_atk', 'stats/atk', 1, '10', NULL, NULL, NULL, NULL),
	(50, 10, 'inc_def', 'stats/def', 1, '10', NULL, NULL, NULL, NULL),
	(51, 10, 'inc_hp', 'stats/hp', 1, '10', NULL, NULL, NULL, NULL),
	(52, 10, 'inc_mp', 'stats/mp', 1, '10', NULL, NULL, NULL, NULL),
	(53, 10, 'inc_atk', 'statsBase/atk', 1, '10', NULL, NULL, NULL, NULL),
	(54, 10, 'inc_def', 'statsBase/def', 1, '10', NULL, NULL, NULL, NULL),
	(55, 10, 'inc_hp', 'statsBase/hp', 1, '10', NULL, NULL, NULL, NULL),
	(56, 10, 'inc_mp', 'statsBase/mp', 1, '10', NULL, NULL, NULL, NULL),
	(57, 11, 'inc_atk', 'stats/atk', 1, '20', NULL, NULL, NULL, NULL),
	(58, 11, 'inc_def', 'stats/def', 1, '20', NULL, NULL, NULL, NULL),
	(59, 11, 'inc_hp', 'stats/hp', 1, '20', NULL, NULL, NULL, NULL),
	(60, 11, 'inc_mp', 'stats/mp', 1, '20', NULL, NULL, NULL, NULL),
	(61, 11, 'inc_atk', 'statsBase/atk', 1, '20', NULL, NULL, NULL, NULL),
	(62, 11, 'inc_def', 'statsBase/def', 1, '20', NULL, NULL, NULL, NULL),
	(63, 11, 'inc_hp', 'statsBase/hp', 1, '20', NULL, NULL, NULL, NULL),
	(64, 11, 'inc_mp', 'statsBase/mp', 1, '20', NULL, NULL, NULL, NULL),
	(65, 12, 'inc_atk', 'stats/atk', 1, '50', NULL, NULL, NULL, NULL),
	(66, 12, 'inc_def', 'stats/def', 1, '50', NULL, NULL, NULL, NULL),
	(67, 12, 'inc_hp', 'stats/hp', 1, '50', NULL, NULL, NULL, NULL),
	(68, 12, 'inc_mp', 'stats/mp', 1, '50', NULL, NULL, NULL, NULL),
	(69, 12, 'inc_atk', 'statsBase/atk', 1, '50', NULL, NULL, NULL, NULL),
	(70, 12, 'inc_def', 'statsBase/def', 1, '50', NULL, NULL, NULL, NULL),
	(71, 12, 'inc_hp', 'statsBase/hp', 1, '50', NULL, NULL, NULL, NULL),
	(72, 12, 'inc_mp', 'statsBase/mp', 1, '50', NULL, NULL, NULL, NULL),
	(73, 14, 'inc_atk', 'stats/atk', 1, '10', NULL, NULL, NULL, NULL),
	(74, 14, 'inc_def', 'stats/def', 1, '10', NULL, NULL, NULL, NULL),
	(75, 14, 'inc_hp', 'stats/hp', 1, '10', NULL, NULL, NULL, NULL),
	(76, 14, 'inc_mp', 'stats/mp', 1, '10', NULL, NULL, NULL, NULL),
	(77, 14, 'inc_atk', 'statsBase/atk', 1, '10', NULL, NULL, NULL, NULL),
	(78, 14, 'inc_def', 'statsBase/def', 1, '10', NULL, NULL, NULL, NULL),
	(79, 14, 'inc_hp', 'statsBase/hp', 1, '10', NULL, NULL, NULL, NULL),
	(80, 14, 'inc_mp', 'statsBase/mp', 1, '10', NULL, NULL, NULL, NULL),
	(81, 15, 'inc_atk', 'stats/atk', 1, '20', NULL, NULL, NULL, NULL),
	(82, 15, 'inc_def', 'stats/def', 1, '20', NULL, NULL, NULL, NULL),
	(83, 15, 'inc_hp', 'stats/hp', 1, '20', NULL, NULL, NULL, NULL),
	(84, 15, 'inc_mp', 'stats/mp', 1, '20', NULL, NULL, NULL, NULL),
	(85, 15, 'inc_atk', 'statsBase/atk', 1, '20', NULL, NULL, NULL, NULL),
	(86, 15, 'inc_def', 'statsBase/def', 1, '20', NULL, NULL, NULL, NULL),
	(87, 15, 'inc_hp', 'statsBase/hp', 1, '20', NULL, NULL, NULL, NULL),
	(88, 15, 'inc_mp', 'statsBase/mp', 1, '20', NULL, NULL, NULL, NULL),
	(89, 16, 'inc_atk', 'stats/atk', 1, '50', NULL, NULL, NULL, NULL),
	(90, 16, 'inc_def', 'stats/def', 1, '50', NULL, NULL, NULL, NULL),
	(91, 16, 'inc_hp', 'stats/hp', 1, '50', NULL, NULL, NULL, NULL),
	(92, 16, 'inc_mp', 'stats/mp', 1, '50', NULL, NULL, NULL, NULL),
	(93, 16, 'inc_atk', 'statsBase/atk', 1, '50', NULL, NULL, NULL, NULL),
	(94, 16, 'inc_def', 'statsBase/def', 1, '50', NULL, NULL, NULL, NULL),
	(95, 16, 'inc_hp', 'statsBase/hp', 1, '50', NULL, NULL, NULL, NULL),
	(96, 16, 'inc_mp', 'statsBase/mp', 1, '50', NULL, NULL, NULL, NULL),
	(97, 18, 'inc_atk', 'stats/atk', 1, '10', NULL, NULL, NULL, NULL),
	(98, 18, 'inc_def', 'stats/def', 1, '10', NULL, NULL, NULL, NULL),
	(99, 18, 'inc_hp', 'stats/hp', 1, '10', NULL, NULL, NULL, NULL),
	(100, 18, 'inc_mp', 'stats/mp', 1, '10', NULL, NULL, NULL, NULL),
	(101, 18, 'inc_atk', 'statsBase/atk', 1, '10', NULL, NULL, NULL, NULL),
	(102, 18, 'inc_def', 'statsBase/def', 1, '10', NULL, NULL, NULL, NULL),
	(103, 18, 'inc_hp', 'statsBase/hp', 1, '10', NULL, NULL, NULL, NULL),
	(104, 18, 'inc_mp', 'statsBase/mp', 1, '10', NULL, NULL, NULL, NULL),
	(105, 19, 'inc_atk', 'stats/atk', 1, '20', NULL, NULL, NULL, NULL),
	(106, 19, 'inc_def', 'stats/def', 1, '20', NULL, NULL, NULL, NULL),
	(107, 19, 'inc_hp', 'stats/hp', 1, '20', NULL, NULL, NULL, NULL),
	(108, 19, 'inc_mp', 'stats/mp', 1, '20', NULL, NULL, NULL, NULL),
	(109, 19, 'inc_atk', 'statsBase/atk', 1, '20', NULL, NULL, NULL, NULL),
	(110, 19, 'inc_def', 'statsBase/def', 1, '20', NULL, NULL, NULL, NULL),
	(111, 19, 'inc_hp', 'statsBase/hp', 1, '20', NULL, NULL, NULL, NULL),
	(112, 19, 'inc_mp', 'statsBase/mp', 1, '20', NULL, NULL, NULL, NULL),
	(113, 20, 'inc_atk', 'stats/atk', 1, '50', NULL, NULL, NULL, NULL),
	(114, 20, 'inc_def', 'stats/def', 1, '50', NULL, NULL, NULL, NULL),
	(115, 20, 'inc_hp', 'stats/hp', 1, '50', NULL, NULL, NULL, NULL),
	(116, 20, 'inc_mp', 'stats/mp', 1, '50', NULL, NULL, NULL, NULL),
	(117, 20, 'inc_atk', 'statsBase/atk', 1, '50', NULL, NULL, NULL, NULL),
	(118, 20, 'inc_def', 'statsBase/def', 1, '50', NULL, NULL, NULL, NULL),
	(119, 20, 'inc_hp', 'statsBase/hp', 1, '50', NULL, NULL, NULL, NULL),
	(120, 20, 'inc_mp', 'statsBase/mp', 1, '50', NULL, NULL, NULL, NULL);

REPLACE INTO `skills_levels_set` (`id`, `autoFillRanges`, `autoFillExperienceMultiplier`) VALUES
	(1, 1, NULL),
	(2, 1, NULL),
	(3, 1, NULL),
	(4, 1, NULL),
	(5, 1, NULL);

REPLACE INTO `skills_owners_class_path` (`id`, `class_path_id`, `owner_id`, `currentLevel`, `currentExp`) VALUES
	(1, 1, 1, 10, 9080);

REPLACE INTO `skills_skill_type` (`id`, `key`) VALUES
	(2, 'attack'),
	(1, 'base'),
	(3, 'effect'),
	(4, 'physical_attack'),
	(5, 'physical_effect');

REPLACE INTO `skills_skill` (`id`, `key`, `type`, `autoValidation`, `skillDelay`, `castTime`, `usesLimit`, `range`, `rangeAutomaticValidation`, `rangePropertyX`, `rangePropertyY`, `rangeTargetPropertyX`, `rangeTargetPropertyY`, `allowSelfTarget`, `criticalChance`, `criticalMultiplier`, `criticalFixedValue`, `customData`) VALUES
	(1, 'attackBullet', '4', 0, 1000, 0, 0, 250, 1, 'state/x', 'state/y', NULL, NULL, 0, 10, 2, 0, NULL),
	(2, 'attackShort', '2', 0, 600, 0, 0, 50, 1, 'state/x', 'state/y', NULL, NULL, 0, 10, 2, 0, NULL),
	(3, 'fireball', '4', 0, 1500, 2000, 0, 280, 1, 'state/x', 'state/y', NULL, NULL, 0, 10, 2, 0, NULL),
	(4, 'heal', '3', 0, 1500, 2000, 0, 100, 1, 'state/x', 'state/y', NULL, NULL, 1, 0, 1, 0, NULL);

REPLACE INTO `skills_skill_animations` (`id`, `skill_id`, `key`, `classKey`, `animationData`) VALUES
	(1, 3, 'bullet', NULL, '{"enabled":true,"type":"spritesheet","img":"fireball_bullet","frameWidth":64,"frameHeight":64,"start":0,"end":3,"repeat":-1,"rate":1,"dir":3}'),
	(2, 3, 'cast', NULL, '{"enabled":true,"type":"spritesheet","img":"fireball_cast","frameWidth":64,"frameHeight":70,"start":0,"end":3,"repeat":-1,"destroyTime":2000,"depthByPlayer":"above"}'),
	(3, 4, 'cast', NULL, '{"enabled":true,"type":"spritesheet","img":"heal_cast","frameWidth":64,"frameHeight":70,"start":0,"end":3,"repeat":-1,"destroyTime":2000}'),
	(6, 4, 'hit', NULL, '{"enabled":true,"type":"spritesheet","img":"heal_hit","frameWidth":64,"frameHeight":70,"start":0,"end":4,"repeat":0,"depthByPlayer":"above"}');

REPLACE INTO `skills_skill_attack` (`id`, `skill_id`, `affectedProperty`, `allowEffectBelowZero`, `hitDamage`, `applyDirectDamage`, `attackProperties`, `defenseProperties`, `aimProperties`, `dodgeProperties`, `dodgeFullEnabled`, `dodgeOverAimSuccess`, `damageAffected`, `criticalAffected`) VALUES
	(1, 1, 'stats/hp', 0, 3, 0, 'stats/atk,stats/stamina,stats/speed', 'stats/def,stats/stamina,stats/speed', 'stats/aim', 'stats/dodge', 0, 1, 0, 0),
	(2, 2, 'stats/hp', 0, 5, 0, 'stats/atk,stats/stamina,stats/speed', 'stats/def,stats/stamina,stats/speed', 'stats/aim', 'stats/dodge', 0, 1, 0, 0),
	(3, 3, 'stats/hp', 0, 7, 0, 'stats/atk,stats/stamina,stats/speed', 'stats/def,stats/stamina,stats/speed', 'stats/aim', 'stats/dodge', 0, 1, 0, 0);

REPLACE INTO `skills_skill_owner_conditions` (`id`, `skill_id`, `key`, `property_key`, `conditional`, `value`) VALUES
	(1, 3, 'available_mp', 'stats/mp', 'ge', '5');

REPLACE INTO `skills_skill_owner_effects` (`id`, `skill_id`, `key`, `property_key`, `operation`, `value`, `minValue`, `maxValue`, `minProperty`, `maxProperty`) VALUES
	(2, 3, 'dec_mp', 'stats/mp', 2, '5', '0', ' ', NULL, NULL),
	(3, 4, 'dec_mp', 'stats/mp', 2, '2', '0', '', NULL, NULL);

REPLACE INTO `skills_skill_physical_data` (`id`, `skill_id`, `magnitude`, `objectWidth`, `objectHeight`, `validateTargetOnHit`) VALUES
	(1, 1, 350, 5, 5, 0),
	(2, 3, 550, 5, 5, 0);

REPLACE INTO `skills_skill_target_effects` (`id`, `skill_id`, `key`, `property_key`, `operation`, `value`, `minValue`, `maxValue`, `minProperty`, `maxProperty`) VALUES
	(1, 4, 'heal', 'stats/hp', 1, '10', '0', '0', NULL, 'statsBase/hp');

REPLACE INTO `stats` (`id`, `key`, `label`, `description`, `base_value`, `customData`) VALUES
	(1, 'hp', 'HP', 'Player life points', 100, '{"showBase":true}'),
	(2, 'mp', 'MP', 'Player magic points', 100, '{"showBase":true}'),
	(3, 'atk', 'Atk', 'Player attack points', 100, NULL),
	(4, 'def', 'Def', 'Player defense points', 100, NULL),
	(5, 'dodge', 'Dodge', 'Player dodge points', 100, NULL),
	(6, 'speed', 'Speed', 'Player speed point', 100, NULL),
	(7, 'aim', 'Aim', 'Player aim points', 100, NULL),
	(8, 'stamina', 'Stamina', 'Player stamina points', 100, '{"showBase":true}'),
	(9, 'mgk-atk', 'Magic Atk', 'Player magic attack', 100, NULL),
	(10, 'mgk-def', 'Magic Def', 'Player magic defense', 100, NULL);

REPLACE INTO `target_options` (`id`, `target_key`, `target_label`) VALUES
	(1, 0, 'Object'),
	(2, 1, 'Player');

-- default user/password: root/root
REPLACE INTO `users` (`id`, `email`, `username`, `password`, `role_id`, `status`, `created_at`, `updated_at`, `played_time`) VALUES
	(1, 'root@yourgame.com', 'root', '$2b$10$SzjZph10Svebltx8Nmd7lec14wATo7ikEQQ0WEA0YZ188qGWHDu8S', 99, '1', '2022-03-17 18:57:44', '2023-10-21 16:51:55', 0);

REPLACE INTO `users_locale` (`id`, `locale_id`, `user_id`) VALUES
	(1, 1, 1);

--

SET FOREIGN_KEY_CHECKS = 1;

--
