-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               5.6.21 - MySQL Community Server (GPL)
-- Server Betriebssystem:        Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportiere Datenbank Struktur für filmverwaltung
CREATE DATABASE IF NOT EXISTS `filmverwaltung` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `filmverwaltung`;


-- Exportiere Struktur von Tabelle filmverwaltung.produktionsfirma
CREATE TABLE IF NOT EXISTS `produktionsfirma` (
  `Produktionsfirma_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Produktionsfirma_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle filmverwaltung.produktionsfirma: ~4 rows (ungefähr)
DELETE FROM `produktionsfirma`;
/*!40000 ALTER TABLE `produktionsfirma` DISABLE KEYS */;
INSERT INTO `produktionsfirma` (`Produktionsfirma_ID`, `Bezeichnung`) VALUES
	(1, 'Bavaria Fimlstudios'),
	(2, 'Great American FIlms'),
	(3, 'Touchsones Pictures'),
	(4, 'Warner Brothers Pictures');
/*!40000 ALTER TABLE `produktionsfirma` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle filmverwaltung.filme
CREATE TABLE IF NOT EXISTS `filme` (
  `Song_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Titel` varchar(45) DEFAULT NULL,
  `Erscheinungs-Datum` date DEFAULT NULL,
  `Produktionsfirma_ID` int(11) NOT NULL,
  PRIMARY KEY (`Song_ID`),
  KEY `fk_Filme_Produktionsfirma_idx` (`Produktionsfirma_ID`),
  CONSTRAINT `fk_Filme_Produktionsfirma` FOREIGN KEY (`Produktionsfirma_ID`) REFERENCES `produktionsfirma` (`Produktionsfirma_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle filmverwaltung.filme: ~8 rows (ungefähr)
DELETE FROM `filme`;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` (`Song_ID`, `Titel`, `Erscheinungs-Datum`, `Produktionsfirma_ID`) VALUES
	(3, 'Dirty Dancing', '1987-08-21', 2),
	(4, 'Sister Act', '1992-05-29', 3),
	(5, 'Harry Potter u. der Stein der Weisen', '2001-11-23', 4),
	(6, 'Casanova', '2006-02-09', 3),
	(7, 'Die unendliche Geschichte', '1984-05-20', 1),
	(8, 'Die Welle', '2008-03-13', 1),
	(9, 'Krieg in Chinatown', '1987-09-25', 2),
	(10, 'I Am Legend', '2008-01-10', 4),
	(11, 'Transcendence', '2014-04-18', 4);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle filmverwaltung.schauspieler
CREATE TABLE IF NOT EXISTS `schauspieler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(45) DEFAULT NULL,
  `Nachname` varchar(45) DEFAULT NULL,
  `Herkunpft` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle filmverwaltung.schauspieler: ~4 rows (ungefähr)
DELETE FROM `schauspieler`;
/*!40000 ALTER TABLE `schauspieler` DISABLE KEYS */;
INSERT INTO `schauspieler` (`id`, `Vorname`, `Nachname`, `Herkunpft`) VALUES
	(1, 'Christoph', 'Pollhammer', 'Norwegen'),
	(2, 'Max', 'Heinz', 'Deutschaldn'),
	(3, 'Christian', 'Mandel', 'Austria'),
	(4, 'Chris', 'Lux', 'Norway');
/*!40000 ALTER TABLE `schauspieler` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle filmverwaltung.schauspieler_has_filme
CREATE TABLE IF NOT EXISTS `schauspieler_has_filme` (
  `Schauspieler_id` int(11) NOT NULL,
  `Filme_Song_ID` int(11) NOT NULL,
  `Rolle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Schauspieler_id`,`Filme_Song_ID`),
  KEY `fk_Schauspieler_has_Filme_Filme1_idx` (`Filme_Song_ID`),
  KEY `fk_Schauspieler_has_Filme_Schauspieler1_idx` (`Schauspieler_id`),
  CONSTRAINT `fk_Schauspieler_has_Filme_Filme1` FOREIGN KEY (`Filme_Song_ID`) REFERENCES `filme` (`Song_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schauspieler_has_Filme_Schauspieler1` FOREIGN KEY (`Schauspieler_id`) REFERENCES `schauspieler` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle filmverwaltung.schauspieler_has_filme: ~4 rows (ungefähr)
DELETE FROM `schauspieler_has_filme`;
/*!40000 ALTER TABLE `schauspieler_has_filme` DISABLE KEYS */;
INSERT INTO `schauspieler_has_filme` (`Schauspieler_id`, `Filme_Song_ID`, `Rolle`) VALUES
	(1, 6, NULL),
	(2, 8, NULL),
	(3, 3, NULL),
	(4, 11, NULL);
/*!40000 ALTER TABLE `schauspieler_has_filme` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
