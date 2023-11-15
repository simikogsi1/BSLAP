-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hardware
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hardware` ;

-- -----------------------------------------------------
-- Schema hardware
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hardware` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `hardware` ;

-- -----------------------------------------------------
-- Table `hardware`.`artikelart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hardware`.`artikelart` (
  `art_id` INT NOT NULL AUTO_INCREMENT,
  `art_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`art_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hardware`.`hersteller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hardware`.`hersteller` (
  `her_id` INT NOT NULL AUTO_INCREMENT,
  `her_name1` VARCHAR(45) NOT NULL,
  `her_name2` VARCHAR(45) NULL,
  PRIMARY KEY (`her_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hardware`.`zusatz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hardware`.`zusatz` (
  `zus_id` INT NOT NULL AUTO_INCREMENT,
  `zus_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`zus_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hardware`.`artikelart_hersteller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hardware`.`artikelart_hersteller` (
  `arhe_id` INT NOT NULL AUTO_INCREMENT,
  `arhe_name` VARCHAR(45) NOT NULL,
  `art_id` INT NOT NULL,
  `her_id` INT NOT NULL,
  `zus_id` INT NOT NULL,
  INDEX `fk_artikelart_has_hersteller_hersteller1_idx` (`her_id` ASC),
  INDEX `fk_artikelart_has_hersteller_artikelart_idx` (`art_id` ASC),
  PRIMARY KEY (`arhe_id`),
  INDEX `fk_artikelart_has_hersteller_zusatz1_idx` (`zus_id` ASC),
  CONSTRAINT `fk_artikelart_has_hersteller_artikelart`
    FOREIGN KEY (`art_id`)
    REFERENCES `hardware`.`artikelart` (`art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artikelart_has_hersteller_hersteller1`
    FOREIGN KEY (`her_id`)
    REFERENCES `hardware`.`hersteller` (`her_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artikelart_has_hersteller_zusatz1`
    FOREIGN KEY (`zus_id`)
    REFERENCES `hardware`.`zusatz` (`zus_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `hardware`.`artikelart`
-- -----------------------------------------------------
START TRANSACTION;
USE `hardware`;
INSERT INTO `hardware`.`artikelart` (`art_id`, `art_name`) VALUES (NULL, 'Maus');
INSERT INTO `hardware`.`artikelart` (`art_id`, `art_name`) VALUES (NULL, 'Tastatur');
INSERT INTO `hardware`.`artikelart` (`art_id`, `art_name`) VALUES (NULL, 'Bildschirm');
INSERT INTO `hardware`.`artikelart` (`art_id`, `art_name`) VALUES (NULL, 'Drucker');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hardware`.`hersteller`
-- -----------------------------------------------------
START TRANSACTION;
USE `hardware`;
INSERT INTO `hardware`.`hersteller` (`her_id`, `her_name1`, `her_name2`) VALUES (NULL, 'Logitech', NULL);
INSERT INTO `hardware`.`hersteller` (`her_id`, `her_name1`, `her_name2`) VALUES (NULL, 'HP Inc.', 'Hewlett-Packard Company');
INSERT INTO `hardware`.`hersteller` (`her_id`, `her_name1`, `her_name2`) VALUES (NULL, 'Dell Technologies Inc.', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hardware`.`zusatz`
-- -----------------------------------------------------
START TRANSACTION;
USE `hardware`;
INSERT INTO `hardware`.`zusatz` (`zus_id`, `zus_name`) VALUES (NULL, 'Alienware');
INSERT INTO `hardware`.`zusatz` (`zus_id`, `zus_name`) VALUES (NULL, 'OMEN');
INSERT INTO `hardware`.`zusatz` (`zus_id`, `zus_name`) VALUES (NULL, 'LaserJet');
INSERT INTO `hardware`.`zusatz` (`zus_id`, `zus_name`) VALUES (NULL, 'S Series');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hardware`.`artikelart_hersteller`
-- -----------------------------------------------------
START TRANSACTION;
USE `hardware`;
INSERT INTO `hardware`.`artikelart_hersteller` (`arhe_id`, `arhe_name`, `art_id`, `her_id`, `zus_id`) VALUES (NULL, 'AW3821DW', 3, 3, 1);
INSERT INTO `hardware`.`artikelart_hersteller` (`arhe_id`, `arhe_name`, `art_id`, `her_id`, `zus_id`) VALUES (NULL, 'X27', 3, 2, 2);
INSERT INTO `hardware`.`artikelart_hersteller` (`arhe_id`, `arhe_name`, `art_id`, `her_id`, `zus_id`) VALUES (NULL, 'Pro M15w', 4, 2, 3);
INSERT INTO `hardware`.`artikelart_hersteller` (`arhe_id`, `arhe_name`, `art_id`, `her_id`, `zus_id`) VALUES (NULL, 'S2721H', 3, 3, 4);

COMMIT;

