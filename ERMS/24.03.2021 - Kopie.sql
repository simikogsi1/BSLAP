-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Verleihdauer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Verleihdauer` (
  `Verleih_id` INT NOT NULL AUTO_INCREMENT,
  `verleihungskosten_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Verleih_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Buchexemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Buchexemplar` (
  `Buchexemplar_id` INT NOT NULL AUTO_INCREMENT,
  `Buchexemplar_name` VARCHAR(45) NOT NULL,
  `Verleihdauer_Verleih_id` INT NULL,
  PRIMARY KEY (`Buchexemplar_id`),
  CONSTRAINT `fk_Buchexemplar_Verleihdauer1`
    FOREIGN KEY (`Verleihdauer_Verleih_id`)
    REFERENCES `mydb`.`Verleihdauer` (`Verleih_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Buchexemplar_Verleihdauer1_idx` ON `mydb`.`Buchexemplar` (`Verleihdauer_Verleih_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Buch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Buch` (
  `buch_id` INT NOT NULL AUTO_INCREMENT,
  `buch_name` VARCHAR(45) NOT NULL,
  `Buchexemplar_Buchexemplar_id` INT NULL,
  `Buchexemplar_Verleihdauer_Verleih_id` INT NULL,
  PRIMARY KEY (`buch_id`, `Buchexemplar_Buchexemplar_id`),
  CONSTRAINT `fk_Buch_Buchexemplar1`
    FOREIGN KEY (`Buchexemplar_Buchexemplar_id` , `Buchexemplar_Verleihdauer_Verleih_id`)
    REFERENCES `mydb`.`Buchexemplar` (`Buchexemplar_id` , `Verleihdauer_Verleih_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Buch_Buchexemplar1_idx` ON `mydb`.`Buch` (`Buchexemplar_Buchexemplar_id` ASC, `Buchexemplar_Verleihdauer_Verleih_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Kategorien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kategorien` (
  `Kategorie_id` INT NOT NULL AUTO_INCREMENT,
  `Katergorien_name_einteillung` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Kategorie_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Kosten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kosten` (
  `Kosten_id` INT NOT NULL AUTO_INCREMENT,
  `Verleihdauer_Verleih_id` INT NOT NULL,
  CONSTRAINT `fk_Kosten_Verleihdauer1`
    FOREIGN KEY (`Verleihdauer_Verleih_id`)
    REFERENCES `mydb`.`Verleihdauer` (`Verleih_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Schulbuchereiausweis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Schulbuchereiausweis` (
  `Ausweis_id` INT NOT NULL,
  `asuweis_name_idl` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Ausweis_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Personen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personen` (
  `Personen_id` INT NOT NULL AUTO_INCREMENT,
  `Personen_namen` VARCHAR(45) NOT NULL,
  `Schulbuchereiausweis_Ausweis_id` INT NULL,
  PRIMARY KEY (`Personen_id`),
  CONSTRAINT `fk_Personen_Schulbuchereiausweis1`
    FOREIGN KEY (`Schulbuchereiausweis_Ausweis_id`)
    REFERENCES `mydb`.`Schulbuchereiausweis` (`Ausweis_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Personen_Schulbuchereiausweis1_idx` ON `mydb`.`Personen` (`Schulbuchereiausweis_Ausweis_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Zeitschriften_Kategorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zeitschriften_Kategorie` (
  `zeitschriften_kategorie` INT NOT NULL AUTO_INCREMENT,
  `Zeitschriften_preis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`zeitschriften_kategorie`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Zeitschrift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zeitschrift` (
  `Zeitschrift_id` INT NOT NULL AUTO_INCREMENT,
  `zeitschrift_name` VARCHAR(45) NOT NULL,
  `Zeitschriften_Kategorie_zeitschriften_kategorie` INT NULL,
  CONSTRAINT `fk_Zeitschrift_Zeitschriften_Kategorie1`
    FOREIGN KEY (`Zeitschriften_Kategorie_zeitschriften_kategorie`)
    REFERENCES `mydb`.`Zeitschriften_Kategorie` (`zeitschriften_kategorie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Personen_Buch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personen_Buch` (
  `Personen_Personen_id` INT NULL,
  `Verleihdauer_Verleih_id` INT NULL,
  CONSTRAINT `fk_Personen_has_Buch_Personen`
    FOREIGN KEY (`Personen_Personen_id`)
    REFERENCES `mydb`.`Personen` (`Personen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personen_Buch_Verleihdauer1`
    FOREIGN KEY (`Verleihdauer_Verleih_id`)
    REFERENCES `mydb`.`Verleihdauer` (`Verleih_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Personen_has_Buch_Personen_idx` ON `mydb`.`Personen_Buch` (`Personen_Personen_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Buch_Kategorien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Buch_Kategorien` (
  `Buch_buch_id` INT NULL,
  `Kategorien_Kategorie_id` INT NOT NULL,
  CONSTRAINT `fk_Buch_has_Kategorien_Buch1`
    FOREIGN KEY (`Buch_buch_id`)
    REFERENCES `mydb`.`Buch` (`buch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Buch_has_Kategorien_Kategorien1`
    FOREIGN KEY (`Kategorien_Kategorie_id`)
    REFERENCES `mydb`.`Kategorien` (`Kategorie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Buch_has_Kategorien_Kategorien1_idx` ON `mydb`.`Buch_Kategorien` (`Kategorien_Kategorie_id` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Buch_has_Kategorien_Buch1_idx` ON `mydb`.`Buch_Kategorien` (`Buch_buch_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Zeitschrift_Kategorien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zeitschrift_Kategorien` (
  `Zeitschrift_Zeitschrift_id` INT NOT NULL,
  `Kategorien_Kategorie_id` INT NOT NULL,
  CONSTRAINT `fk_Zeitschrift_has_Kategorien_Zeitschrift1`
    FOREIGN KEY (`Zeitschrift_Zeitschrift_id`)
    REFERENCES `mydb`.`Zeitschrift` (`Zeitschrift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Zeitschrift_has_Kategorien_Kategorien1`
    FOREIGN KEY (`Kategorien_Kategorie_id`)
    REFERENCES `mydb`.`Kategorien` (`Kategorie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Zeitschrift_has_Kategorien_Kategorien1_idx` ON `mydb`.`Zeitschrift_Kategorien` (`Kategorien_Kategorie_id` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Zeitschrift_has_Kategorien_Zeitschrift1_idx` ON `mydb`.`Zeitschrift_Kategorien` (`Zeitschrift_Zeitschrift_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Sachbücher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sachbücher` (
  `Sachbücher_id` INT NOT NULL AUTO_INCREMENT,
  `sachbücher_namen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Sachbücher_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Belletristik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Belletristik` (
  `Belletristik_id` INT NOT NULL,
  `Belletristik_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Belletristik_id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Sachbücher_Buch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sachbücher_Buch` (
  `Sachbücher_Sachbücher_id` INT NOT NULL,
  `Buch_buch_id` INT NOT NULL,
  CONSTRAINT `fk_Sachbücher_has_Buch_Sachbücher1`
    FOREIGN KEY (`Sachbücher_Sachbücher_id`)
    REFERENCES `mydb`.`Sachbücher` (`Sachbücher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sachbücher_has_Buch_Buch1`
    FOREIGN KEY (`Buch_buch_id`)
    REFERENCES `mydb`.`Buch` (`buch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Sachbücher_has_Buch_Buch1_idx` ON `mydb`.`Sachbücher_Buch` (`Buch_buch_id` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Sachbücher_has_Buch_Sachbücher1_idx` ON `mydb`.`Sachbücher_Buch` (`Sachbücher_Sachbücher_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Buch_Belletristik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Buch_Belletristik` (
  `Buch_buch_id` INT NOT NULL,
  `Belletristik_Belletristik_id` INT NOT NULL,
  CONSTRAINT `fk_Buch_has_Belletristik_Buch1`
    FOREIGN KEY (`Buch_buch_id`)
    REFERENCES `mydb`.`Buch` (`buch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Buch_has_Belletristik_Belletristik1`
    FOREIGN KEY (`Belletristik_Belletristik_id`)
    REFERENCES `mydb`.`Belletristik` (`Belletristik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Buch_has_Belletristik_Belletristik1_idx` ON `mydb`.`Buch_Belletristik` (`Belletristik_Belletristik_id` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `fk_Buch_has_Belletristik_Buch1_idx` ON `mydb`.`Buch_Belletristik` (`Buch_buch_id` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`Autoren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autoren` (
  `autoren_id` INT NOT NULL AUTO_INCREMENT,
  `autoren_name` VARCHAR(45) NOT NULL,
  `Buch_buch_id` INT NOT NULL,
  PRIMARY KEY (`autoren_id`),
  CONSTRAINT `fk_Autoren_Buch1`
    FOREIGN KEY (`Buch_buch_id`)
    REFERENCES `mydb`.`Buch` (`buch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Autoren_Buch1_idx` ON `mydb`.`Autoren` (`Buch_buch_id` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
