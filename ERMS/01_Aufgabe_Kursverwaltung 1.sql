-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema kurs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `kurs` ;

-- -----------------------------------------------------
-- Schema kurs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kurs` ;
USE `kurs` ;

-- -----------------------------------------------------
-- Table `kurs`.`person_firma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kurs`.`person_firma` (
  `per_id` INT NOT NULL AUTO_INCREMENT,
  `per_vname` VARCHAR(100) NULL,
  `per_nname` VARCHAR(100) NOT NULL,
  `per_geschlecht` CHAR(1) NOT NULL DEFAULT 'w',
  `per_vortragender` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`per_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kurs`.`kurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kurs`.`kurs` (
  `kur_id` INT NOT NULL AUTO_INCREMENT,
  `kur_bezeichnung` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`kur_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kurs`.`kurstermin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kurs`.`kurstermin` (
  `kute_id` INT NOT NULL AUTO_INCREMENT,
  `kute_start` DATE NOT NULL,
  `kur_id` INT NOT NULL,
  `vortragender_per_id` INT NOT NULL,
  PRIMARY KEY (`kute_id`),
  CONSTRAINT `fk_kurstermin_kurs1`
    FOREIGN KEY (`kur_id`)
    REFERENCES `kurs`.`kurs` (`kur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kurstermin_person1`
    FOREIGN KEY (`vortragender_per_id`)
    REFERENCES `kurs`.`person_firma` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_kurstermin_kurs1_idx` ON `kurs`.`kurstermin` (`kur_id` ASC);

CREATE INDEX `fk_kurstermin_person1_idx` ON `kurs`.`kurstermin` (`vortragender_per_id` ASC);


-- -----------------------------------------------------
-- Table `kurs`.`buchung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kurs`.`buchung` (
  `buc_id` INT NOT NULL AUTO_INCREMENT,
  `kute_id` INT NOT NULL,
  `per_id` INT NOT NULL,
  `buc_pay_id` INT NULL,
  PRIMARY KEY (`buc_id`),
  CONSTRAINT `fk_buchung_kurstermin1`
    FOREIGN KEY (`kute_id`)
    REFERENCES `kurs`.`kurstermin` (`kute_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_buchung_person1`
    FOREIGN KEY (`per_id`)
    REFERENCES `kurs`.`person_firma` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_buchung_person2`
    FOREIGN KEY (`buc_pay_id`)
    REFERENCES `kurs`.`person_firma` (`per_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_buchung_kurstermin1_idx` ON `kurs`.`buchung` (`kute_id` ASC);

CREATE INDEX `fk_buchung_person1_idx` ON `kurs`.`buchung` (`per_id` ASC);

CREATE INDEX `fk_buchung_person2_idx` ON `kurs`.`buchung` (`buc_pay_id` ASC);


-- -----------------------------------------------------
-- Table `kurs`.`kurspreis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kurs`.`kurspreis` (
  `kupr_id` INT NOT NULL AUTO_INCREMENT,
  `kupr_wert` DOUBLE NOT NULL,
  `kupr_bis` DATE NOT NULL,
  `kur_id` INT NOT NULL,
  PRIMARY KEY (`kupr_id`),
  CONSTRAINT `fk_kurspreis_kurs1`
    FOREIGN KEY (`kur_id`)
    REFERENCES `kurs`.`kurs` (`kur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';

CREATE INDEX `fk_kurspreis_kurs1_idx` ON `kurs`.`kurspreis` (`kur_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `kurs`.`person_firma`
-- -----------------------------------------------------
START TRANSACTION;
USE `kurs`;
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Martin', 'Huber KG', 'x', DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Klara', 'Baum', DEFAULT, DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Harald', 'Stolz', 'm', DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, NULL, 'voestalpine', 'x', DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Lars', 'Trier', 'm', 2);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Anette', 'Brief', DEFAULT, 2);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Maria', 'Maier', DEFAULT, DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Hans', 'Klausen', 'm', DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Erna', 'Gruber', DEFAULT, DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Sara', 'Waldbrand', DEFAULT, DEFAULT);
INSERT INTO `kurs`.`person_firma` (`per_id`, `per_vname`, `per_nname`, `per_geschlecht`, `per_vortragender`) VALUES (DEFAULT, 'Anita', 'Weber', DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kurs`.`kurs`
-- -----------------------------------------------------
START TRANSACTION;
USE `kurs`;
INSERT INTO `kurs`.`kurs` (`kur_id`, `kur_bezeichnung`) VALUES (DEFAULT, 'PHP 5');
INSERT INTO `kurs`.`kurs` (`kur_id`, `kur_bezeichnung`) VALUES (DEFAULT, 'C#');
INSERT INTO `kurs`.`kurs` (`kur_id`, `kur_bezeichnung`) VALUES (DEFAULT, 'Geschichte der Programmiersprachen');

COMMIT;


-- -----------------------------------------------------
-- Data for table `kurs`.`kurstermin`
-- -----------------------------------------------------
START TRANSACTION;
USE `kurs`;
INSERT INTO `kurs`.`kurstermin` (`kute_id`, `kute_start`, `kur_id`, `vortragender_per_id`) VALUES (DEFAULT, '2016-10-20', 2, 6);
INSERT INTO `kurs`.`kurstermin` (`kute_id`, `kute_start`, `kur_id`, `vortragender_per_id`) VALUES (DEFAULT, '2020-05-23', 1, 6);
INSERT INTO `kurs`.`kurstermin` (`kute_id`, `kute_start`, `kur_id`, `vortragender_per_id`) VALUES (DEFAULT, '2020-10-10', 1, 6);
INSERT INTO `kurs`.`kurstermin` (`kute_id`, `kute_start`, `kur_id`, `vortragender_per_id`) VALUES (DEFAULT, '2022-01-25', 2, 6);
INSERT INTO `kurs`.`kurstermin` (`kute_id`, `kute_start`, `kur_id`, `vortragender_per_id`) VALUES (DEFAULT, '2021-12-07', 1, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kurs`.`buchung`
-- -----------------------------------------------------
START TRANSACTION;
USE `kurs`;
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 2, 2, 1);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 2, 3, 4);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 2, 6, 4);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 3, 2, NULL);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 3, 6, NULL);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 4, 2, 1);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 2, 8, NULL);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 2, 9, NULL);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 2, 10, NULL);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 2, 11, NULL);
INSERT INTO `kurs`.`buchung` (`buc_id`, `kute_id`, `per_id`, `buc_pay_id`) VALUES (DEFAULT, 5, 6, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kurs`.`kurspreis`
-- -----------------------------------------------------
START TRANSACTION;
USE `kurs`;
INSERT INTO `kurs`.`kurspreis` (`kupr_id`, `kupr_wert`, `kupr_bis`, `kur_id`) VALUES (DEFAULT, 2120, '2015-12-31', 1);
INSERT INTO `kurs`.`kurspreis` (`kupr_id`, `kupr_wert`, `kupr_bis`, `kur_id`) VALUES (DEFAULT, 4690, '9999-12-31', 2);
INSERT INTO `kurs`.`kurspreis` (`kupr_id`, `kupr_wert`, `kupr_bis`, `kur_id`) VALUES (DEFAULT, 2500, '2021-11-30', 1);
INSERT INTO `kurs`.`kurspreis` (`kupr_id`, `kupr_wert`, `kupr_bis`, `kur_id`) VALUES (DEFAULT, 289, '2021-01-31', 3);
INSERT INTO `kurs`.`kurspreis` (`kupr_id`, `kupr_wert`, `kupr_bis`, `kur_id`) VALUES (DEFAULT, 315, '9999-12-31', 3);
INSERT INTO `kurs`.`kurspreis` (`kupr_id`, `kupr_wert`, `kupr_bis`, `kur_id`) VALUES (DEFAULT, 2420, '2021-12-31', 1);
INSERT INTO `kurs`.`kurspreis` (`kupr_id`, `kupr_wert`, `kupr_bis`, `kur_id`) VALUES (DEFAULT, 2700, '9999-12-31', 1);

COMMIT;

