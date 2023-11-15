SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema taxi
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `taxi`;

-- -----------------------------------------------------
-- Schema taxi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taxi` DEFAULT CHARACTER SET utf8;
USE `taxi`;

-- -----------------------------------------------------
-- Table `taxi`.`Standorte_wagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxi`.`Standorte_wagen` (
  `standort_id` INT NOT NULL AUTO_INCREMENT,
  `standort_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`standort_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `taxi`.`Ladestation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxi`.`Ladestation` (
  `Ladestation_id` INT NOT NULL AUTO_INCREMENT,
  `Ladestation_ort` VARCHAR(45) NOT NULL,
  `Ladestation_saeule` VARCHAR(45) NOT NULL,
  `ladestation_kosten` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`Ladestation_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `taxi`.`Adresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxi`.`Adresse` (
  `Adresse_id` INT NOT NULL AUTO_INCREMENT,
  `Adresse_start` VARCHAR(45) NOT NULL,
  `Adresse_ziel` VARCHAR(45) NOT NULL,
  `Adresse_km` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`Adresse_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `taxi`.`Personen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxi`.`Personen` (
  `fahrer_id` INT NOT NULL AUTO_INCREMENT,
  `fahrer_vname` VARCHAR(45) NOT NULL,
  `fahrer_nname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fahrer_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `taxi`.`Wagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taxi`.`Wagen` (
  `autos_id` INT NOT NULL AUTO_INCREMENT,
  `autos_kennzeichen` VARCHAR(45) NOT NULL,
  `autos_kilometer` DECIMAL(5,2) NOT NULL,
  `autos_Uhrzeit` TIME NOT NULL,
  `autos_Datum` DATE NOT NULL,
  `Standorte_wagen_standort_id` INT NOT NULL,
  `Ladelstation_Ladestation_id` INT NOT NULL,
  `Adresse_Adresse_id` INT NOT NULL,
  `Personen_fahrer_id` INT NOT NULL,
  PRIMARY KEY (`autos_id`),
  CONSTRAINT `fk_Wagen_Standorte_wagen1`
    FOREIGN KEY (`Standorte_wagen_standort_id`)
    REFERENCES `taxi`.`Standorte_wagen` (`standort_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Wagen_Ladelstation1`
    FOREIGN KEY (`Ladelstation_Ladestation_id`)
    REFERENCES `taxi`.`Ladestation` (`Ladestation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Wagen_Adresse1`
    FOREIGN KEY (`Adresse_Adresse_id`)
    REFERENCES `taxi`.`Adresse` (`Adresse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Wagen_Personen1`
    FOREIGN KEY (`Personen_fahrer_id`)
    REFERENCES `taxi`.`Personen` (`fahrer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE INDEX `fk_Wagen_Standorte_wagen1_idx` ON `taxi`.`Wagen` (`Standorte_wagen_standort_id`);
CREATE INDEX `fk_Wagen_Ladelstation1_idx` ON `taxi`.`Wagen` (`Ladelstation_Ladestation_id`);
CREATE INDEX `fk_Wagen_Adresse1_idx` ON `taxi`.`Wagen` (`Adresse_Adresse_id`);
CREATE INDEX `fk_Wagen_Personen1_idx` ON `taxi`.`Wagen` (`Personen_fahrer_id`);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `taxi`.`Standorte_wagen`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`Standorte_wagen` (`standort_id`, `standort_name`) VALUES (1, 'Kaufhaus');
INSERT INTO `taxi`.`Standorte_wagen` (`standort_id`, `standort_name`) VALUES (2, 'Schule');
INSERT INTO `taxi`.`Standorte_wagen` (`standort_id`, `standort_name`) VALUES (3, 'Parkplatz');
COMMIT;

-- -----------------------------------------------------
-- Data for table `taxi`.`Ladestation`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`Ladestation` (`Ladestation_id`, `Ladestation_ort`, `Ladestation_saeule`, `ladestation_kosten`) VALUES (1, 'Einkaufszentrum', '1', '0.5');
INSERT INTO `taxi`.`Ladestation` (`Ladestation_id`, `Ladestation_ort`, `Ladestation_saeule`, `ladestation_kosten`) VALUES (2, 'Kaffee Haus', '2', '0.75');
INSERT INTO `taxi`.`Ladestation` (`Ladestation_id`, `Ladestation_ort`, `Ladestation_saeule`, `ladestation_kosten`) VALUES (3, 'Restaurant', '3', '1');
COMMIT;

-- -----------------------------------------------------
-- Data for table `taxi`.`Adresse`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`Adresse` (`Adresse_id`, `Adresse_start`, `Adresse_ziel`, `Adresse_km`) VALUES (1, 'Schule', 'See', '5');
INSERT INTO `taxi`.`Adresse` (`Adresse_id`, `Adresse_start`, `Adresse_ziel`, `Adresse_km`) VALUES (2, 'Kindergarten', 'Spielplatz', '10');
INSERT INTO `taxi`.`Adresse` (`Adresse_id`, `Adresse_start`, `Adresse_ziel`, `Adresse_km`) VALUES (3, 'Villa', 'Teich', '20');
COMMIT;

-- -----------------------------------------------------
-- Data for table `taxi`.`Personen`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`Personen` (`fahrer_id`, `fahrer_vname`, `fahrer_nname`) VALUES (1, 'Franz', 'Maier');
INSERT INTO `taxi`.`Personen` (`fahrer_id`, `fahrer_vname`, `fahrer_nname`) VALUES (2, 'Hans', 'Schmidt');
INSERT INTO `taxi`.`Personen` (`fahrer_id`, `fahrer_vname`, `fahrer_nname`) VALUES (3, 'Anna', 'Müller');
COMMIT;

-- -----------------------------------------------------
-- Data for table `taxi`.`Wagen`
-- -----------------------------------------------------
START TRANSACTION;
USE `taxi`;
INSERT INTO `taxi`.`Wagen` (`autos_id`, `autos_kennzeichen`, `autos_kilometer`, `autos_Uhrzeit`, `autos_Datum`, `Standorte_wagen_standort_id`, `Ladelstation_Ladestation_id`, `Adresse_Adresse_id`, `Personen_fahrer_id`) VALUES (1, 'MUC123', '100.50', '12:00:00', '2022-01-01', 1, 1, 1, 1);
INSERT INTO `taxi`.`Wagen` (`autos_id`, `autos_kennzeichen`, `autos_kilometer`, `autos_Uhrzeit`, `autos_Datum`, `Standorte_wagen_standort_id`, `Ladelstation_Ladestation_id`, `Adresse_Adresse_id`, `Personen_fahrer_id`) VALUES (2, 'MUC456', '200.75', '13:30:00', '2022-02-15', 2, 2, 2, 2);
INSERT INTO `taxi`.`Wagen` (`autos_id`, `autos_kennzeichen`, `autos_kilometer`, `autos_Uhrzeit`, `autos_Datum`, `Standorte_wagen_standort_id`, `Ladelstation_Ladestation_id`, `Adresse_Adresse_id`, `Personen_fahrer_id`) VALUES (3, 'MUC789', '300.20', '10:45:00', '2022-03-20', 3, 3, 3, 3);
COMMIT;
