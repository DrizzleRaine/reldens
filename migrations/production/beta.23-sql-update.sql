#######################################################################################################################

SET FOREIGN_KEY_CHECKS = 0;

#######################################################################################################################

# Config:
UPDATE `config` SET `value` = 25 WHERE `path` LIKE 'enemies/initialStats/%' AND `value` = 10;
UPDATE `config` SET `value` = 0 WHERE `path` = 'ui/controls/primaryMove';

#######################################################################################################################

SET FOREIGN_KEY_CHECKS = 1;

#######################################################################################################################
