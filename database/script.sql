-- MySQL dump 10.13  Distrib 5.5.28, for Linux (x86_64)
--
-- Host: localhost    Database: vostberg
-- ------------------------------------------------------
-- Server version	5.5.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division` (
  `div_id` int(11) NOT NULL AUTO_INCREMENT,
  `div_name` varchar(45) NOT NULL,
  PRIMARY KEY (`div_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (2,'Damer'),(3,'Herrar 1'),(4,'Herrar 2');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchresult`
--

DROP TABLE IF EXISTS `matchresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchresult` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_oneID` int(11) NOT NULL,
  `team_twoID` int(11) NOT NULL,
  `teamonescore` int(11) NOT NULL,
  `teamtwoscore` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `team_id_One_idx` (`team_oneID`),
  KEY `team_id_Two_idx` (`team_twoID`),
  CONSTRAINT `team_id_One` FOREIGN KEY (`team_oneID`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `team_id_Two` FOREIGN KEY (`team_twoID`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchresult`
--

LOCK TABLES `matchresult` WRITE;
/*!40000 ALTER TABLE `matchresult` DISABLE KEYS */;
INSERT INTO `matchresult` VALUES (1,14,16,4,2,NULL),(2,17,18,1,3,NULL),(3,16,14,4,1,NULL),(4,18,17,1,1,NULL),(5,14,18,5,0,NULL),(6,17,14,6,3,NULL);
/*!40000 ALTER TABLE `matchresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `player_name` varchar(45) NOT NULL,
  `captain` tinyint(1) DEFAULT NULL,
  `born` year(4) DEFAULT NULL,
  `playerSeason` int(11) DEFAULT NULL,
  `scoredGoals` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `div_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`position_id`),
  KEY `teamname_ID_idx` (`team_id`),
  KEY `division_ID_idx` (`div_id`),
  CONSTRAINT `division_ID` FOREIGN KEY (`div_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teamname_ID` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `div_id` int(11) NOT NULL,
  `teamname` varchar(45) NOT NULL,
  `home_turf` varchar(45) DEFAULT NULL,
  `team_seasons` varchar(45) DEFAULT NULL,
  `jerseycolor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `div_id_idx` (`div_id`),
  CONSTRAINT `div_id` FOREIGN KEY (`div_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (14,2,'Logitech',NULL,NULL,NULL),(16,2,'Morgans Heroes',NULL,NULL,NULL),(17,2,'Tuxinator Flyers',NULL,NULL,NULL),(18,2,'iOS Hunters',NULL,NULL,NULL),(19,3,'Dell Warriors',NULL,NULL,NULL),(20,3,'Android Droids',NULL,NULL,NULL),(21,2,'Post IT',NULL,NULL,NULL),(22,3,'Intel Outside',NULL,NULL,NULL),(23,3,'Lightsabers',NULL,NULL,NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamadmin`
--

DROP TABLE IF EXISTS `teamadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teamadmin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `team_id_admin` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamadmin`
--

LOCK TABLES `teamadmin` WRITE;
/*!40000 ALTER TABLE `teamadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `teamadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `phonenr` varchar(20) NOT NULL,
  `teamadmin` int(11) DEFAULT '0',
  `active` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `userteam_idx` (`team_id`),
  CONSTRAINT `userteam` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,14,'logitech','e484c7843b4d1a4bc3c6c6851cb4ed40','Logi','Tech','tech@logi.com','12345',0,1),(3,16,'morganheroes','e9356560cdc2043c1285239db086003d','Morgan','Hero','hero@morgan.com','123891',0,1),(4,17,'tuxinators','2c43200547552e12a8720d49ebfa5d09','Tux','Inator','inator@tux.fi','9185215',0,0),(5,18,'ioshunters','f9fb236ad8f637a0b04584bb6ebe045d','iOS','Hunter','ios@hunter.com','1293812',0,0),(6,19,'dellwarriors','2f2bd9c9c663df30aa40908aaa3c70a8','Dell','Warrior','dell@warrior.com','1418242',0,0),(7,20,'android','c31b32364ce19ca8fcd150a417ecce58','And','Roid','and@roid.com','1941924',0,0),(8,21,'postit','28bbb797485d8394d9851595bc0d7628','Post','It','post@it.com','9429424',0,0),(9,22,'intel','eac9a09b3705186cfc6f53265cfd036d','Intel','Xeon','xeon@intel.com','4924924',0,0),(10,23,'lightsabers','2df12436ab71298739d5c8a0917846d7','Ligth','Saber','ligth@saber.com','942924',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-28 22:04:48
