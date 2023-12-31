-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: rezept
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `einheit`
--

DROP TABLE IF EXISTS `einheit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `einheit` (
  `ein_id` int(11) NOT NULL,
  `ein_name` varchar(25) NOT NULL,
  PRIMARY KEY (`ein_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `einheit`
--

LOCK TABLES `einheit` WRITE;
/*!40000 ALTER TABLE `einheit` DISABLE KEYS */;
INSERT INTO `einheit` VALUES (1,'Prise'),(2,'dag'),(3,'St├╝ck'),(4,'kg');
/*!40000 ALTER TABLE `einheit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezeptname`
--

DROP TABLE IF EXISTS `rezeptname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezeptname` (
  `rez_id` int(11) NOT NULL AUTO_INCREMENT,
  `rez_name` varchar(45) NOT NULL,
  PRIMARY KEY (`rez_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezeptname`
--

LOCK TABLES `rezeptname` WRITE;
/*!40000 ALTER TABLE `rezeptname` DISABLE KEYS */;
INSERT INTO `rezeptname` VALUES (1,'Marmorkuchen'),(2,'Schnitzerl'),(3,'Wiener Schnitzerl');
/*!40000 ALTER TABLE `rezeptname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zubereitung`
--

DROP TABLE IF EXISTS `zubereitung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zubereitung` (
  `zub_id` int(11) NOT NULL,
  `zub_beschreibung` mediumtext NOT NULL,
  `rez_id` int(11) NOT NULL,
  `zub_bereitgestellt_am` datetime NOT NULL,
  PRIMARY KEY (`zub_id`),
  KEY `fk_zubereitung_rezeptname_idx` (`rez_id`),
  CONSTRAINT `fk_zubereitung_rezeptname` FOREIGN KEY (`rez_id`) REFERENCES `rezeptname` (`rez_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zubereitung`
--

LOCK TABLES `zubereitung` WRITE;
/*!40000 ALTER TABLE `zubereitung` DISABLE KEYS */;
INSERT INTO `zubereitung` VALUES (1,'Mischen Sie alle Zutaten zu einem Teig',1,'2021-05-14 12:10:25'),(2,'Salzen, nicht Klopfen sondern dr├╝cken',2,'2021-10-22 23:40:22'),(3,'verwenden Sie extra d├╝nn geschnittene Filetschnitten',3,'2022-01-10 16:15:05'),(4,'Zuerst Eiklar steif schlagen, dann Mehl langsam untermischen usw',1,'2022-05-06 10:05:01');
/*!40000 ALTER TABLE `zubereitung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zubereitung_einheit`
--

DROP TABLE IF EXISTS `zubereitung_einheit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zubereitung_einheit` (
  `zuei_id` int(11) NOT NULL AUTO_INCREMENT,
  `zub_id` int(11) NOT NULL,
  `zubein_menge` double NOT NULL,
  `zueii_id` int(11) NOT NULL,
  PRIMARY KEY (`zuei_id`),
  KEY `fk_zubereitung_einheit_zubereitung1_idx` (`zub_id`),
  KEY `fk_zubereitung_einheit_zutat_einheit1_idx` (`zueii_id`),
  CONSTRAINT `fk_zubereitung_einheit_zubereitung1` FOREIGN KEY (`zub_id`) REFERENCES `zubereitung` (`zub_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_zubereitung_einheit_zutat_einheit1` FOREIGN KEY (`zueii_id`) REFERENCES `zutat_einheit` (`zueii_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zubereitung_einheit`
--

LOCK TABLES `zubereitung_einheit` WRITE;
/*!40000 ALTER TABLE `zubereitung_einheit` DISABLE KEYS */;
INSERT INTO `zubereitung_einheit` VALUES (1,1,50,1),(2,1,4,3),(3,1,1,4),(4,1,20,5),(5,2,20,1),(6,2,2,3),(7,2,3,4),(8,3,20,1),(9,4,1,4),(10,4,25,5),(11,4,75,1);
/*!40000 ALTER TABLE `zubereitung_einheit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zutat`
--

DROP TABLE IF EXISTS `zutat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zutat` (
  `zut_id` int(11) NOT NULL,
  `zut_name` varchar(45) NOT NULL,
  PRIMARY KEY (`zut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zutat`
--

LOCK TABLES `zutat` WRITE;
/*!40000 ALTER TABLE `zutat` DISABLE KEYS */;
INSERT INTO `zutat` VALUES (1,'Mehl'),(2,'Eier'),(3,'Salz'),(4,'Kakaopulver');
/*!40000 ALTER TABLE `zutat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zutat_einheit`
--

DROP TABLE IF EXISTS `zutat_einheit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zutat_einheit` (
  `zueii_id` int(11) NOT NULL AUTO_INCREMENT,
  `zut_id` int(11) NOT NULL,
  `ein_id` int(11) NOT NULL,
  PRIMARY KEY (`zueii_id`),
  KEY `fk_zutat_has_einheit_einheit1_idx` (`ein_id`),
  KEY `fk_zutat_has_einheit_zutat1_idx` (`zut_id`),
  CONSTRAINT `fk_zutat_has_einheit_einheit1` FOREIGN KEY (`ein_id`) REFERENCES `einheit` (`ein_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_zutat_has_einheit_zutat1` FOREIGN KEY (`zut_id`) REFERENCES `zutat` (`zut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zutat_einheit`
--

LOCK TABLES `zutat_einheit` WRITE;
/*!40000 ALTER TABLE `zutat_einheit` DISABLE KEYS */;
INSERT INTO `zutat_einheit` VALUES (1,1,2),(2,1,4),(3,2,3),(4,3,1),(5,4,2);
/*!40000 ALTER TABLE `zutat_einheit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-13  8:04:00
