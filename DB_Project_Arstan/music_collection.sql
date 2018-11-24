-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: music_collection
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `Album_Covers`
--

DROP TABLE IF EXISTS `Album_Covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Album_Covers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album_Covers`
--

LOCK TABLES `Album_Covers` WRITE;
/*!40000 ALTER TABLE `Album_Covers` DISABLE KEYS */;
INSERT INTO `Album_Covers` VALUES (1,'/home/arstan/Desktop/Database Principles/Album_Covers/a-ha.jpg'),(2,'/home/arstan/Desktop/Database Principles/Album_Covers/europop.jpg'),(3,'/home/arstan/Desktop/Database Principles/Album_Covers/hotel-california.jpg'),(4,'/home/arstan/Desktop/Database Principles/Album_Covers/pablo-honey.jpeg');
/*!40000 ALTER TABLE `Album_Covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `artist_id` int(11) NOT NULL,
  `subgenre_id` int(11) NOT NULL,
  `cover_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Albums_fk0` (`artist_id`),
  KEY `Albums_fk1` (`subgenre_id`),
  KEY `Albums_fk2` (`cover_id`),
  CONSTRAINT `Albums_fk0` FOREIGN KEY (`artist_id`) REFERENCES `Artists` (`id`),
  CONSTRAINT `Albums_fk1` FOREIGN KEY (`subgenre_id`) REFERENCES `Subgenres` (`id`),
  CONSTRAINT `Albums_fk2` FOREIGN KEY (`cover_id`) REFERENCES `Album_Covers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,'Pablo Honey',8,'1993-02-22',1,4,4),(2,'Hotel California',9,'1976-12-08',2,3,3),(3,'Hunting High and Low',7,'1985-06-01',3,1,1),(4,'Europop',6,'1998-02-01',4,2,2);
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artist_Bios`
--

DROP TABLE IF EXISTS `Artist_Bios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artist_Bios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artist_Bios`
--

LOCK TABLES `Artist_Bios` WRITE;
/*!40000 ALTER TABLE `Artist_Bios` DISABLE KEYS */;
INSERT INTO `Artist_Bios` VALUES (1,'/home/arstan/Desktop/Database Principles/Artist_Bios/radiohead.txt'),(2,'/home/arstan/Desktop/Database Principles/Artist_Bios/a-ha.txt'),(3,'/home/arstan/Desktop/Database Principles/Artist_Bios/eagles.txt'),(4,'/home/arstan/Desktop/Database Principles/Artist_Bios/eiffel65.txt');
/*!40000 ALTER TABLE `Artist_Bios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artists`
--

DROP TABLE IF EXISTS `Artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `bio_id` int(11) NOT NULL,
  `logo_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artists_fk0` (`bio_id`),
  KEY `Artists_fk1` (`logo_id`),
  KEY `Artists_fk2` (`city_id`),
  CONSTRAINT `Artists_fk0` FOREIGN KEY (`bio_id`) REFERENCES `Artist_Bios` (`id`),
  CONSTRAINT `Artists_fk1` FOREIGN KEY (`logo_id`) REFERENCES `Logos` (`id`),
  CONSTRAINT `Artists_fk2` FOREIGN KEY (`city_id`) REFERENCES `Cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artists`
--

LOCK TABLES `Artists` WRITE;
/*!40000 ALTER TABLE `Artists` DISABLE KEYS */;
INSERT INTO `Artists` VALUES (1,'Radiohead',10,1,1,1),(2,'Eagles',9,3,2,2),(3,'A-Ha',8,2,3,4),(4,'Eiffel 65',6,4,4,3);
/*!40000 ALTER TABLE `Artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cities`
--

DROP TABLE IF EXISTS `Cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cities_fk0` (`country_id`),
  CONSTRAINT `Cities_fk0` FOREIGN KEY (`country_id`) REFERENCES `Countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cities`
--

LOCK TABLES `Cities` WRITE;
/*!40000 ALTER TABLE `Cities` DISABLE KEYS */;
INSERT INTO `Cities` VALUES (1,'Oxfordshire',1),(2,'Los Angeles',2),(3,'Paris',3),(4,'Oslo',4);
/*!40000 ALTER TABLE `Cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `flag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Countries_fk0` (`flag_id`),
  CONSTRAINT `Countries_fk0` FOREIGN KEY (`flag_id`) REFERENCES `Flags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'United Kingdom',1),(2,'USA',2),(3,'France',3),(4,'Norway',4);
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flags`
--

DROP TABLE IF EXISTS `Flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flags`
--

LOCK TABLES `Flags` WRITE;
/*!40000 ALTER TABLE `Flags` DISABLE KEYS */;
INSERT INTO `Flags` VALUES (1,'/home/arstan/Desktop/Database Principles/Flags/united_kingdom.svg.png'),(2,'/home/arstan/Desktop/Database Principles/usa.jpg'),(3,'/home/arstan/Desktop/Database Principles/france.png'),(4,'/home/arstan/Desktop/Database Principles/norway.png');
/*!40000 ALTER TABLE `Flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genres`
--

DROP TABLE IF EXISTS `Genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genres`
--

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
INSERT INTO `Genres` VALUES (1,'Rock'),(2,'Pop'),(3,'Dance');
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Logos`
--

DROP TABLE IF EXISTS `Logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Logos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Logos`
--

LOCK TABLES `Logos` WRITE;
/*!40000 ALTER TABLE `Logos` DISABLE KEYS */;
INSERT INTO `Logos` VALUES (1,'/home/arstan/Desktop/Database Principles/Logos/radiohead.jpg'),(2,'/home/arstan/Desktop/Database Principles/Logos/eagles.jpg'),(3,'/home/arstan/Desktop/Database Principles/Logos/a-ha.png'),(4,'/home/arstan/Desktop/Database Principles/Logos/eiffel65.png');
/*!40000 ALTER TABLE `Logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lyrics`
--

DROP TABLE IF EXISTS `Lyrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lyrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lyrics`
--

LOCK TABLES `Lyrics` WRITE;
/*!40000 ALTER TABLE `Lyrics` DISABLE KEYS */;
INSERT INTO `Lyrics` VALUES (1,'/home/arstan/Desktop/Database Principles/Lyrics/Blue.txt'),(2,'/home/arstan/Desktop/Database Principles/Lyrics/Creep.txt'),(3,'/home/arstan/Desktop/Database Principles/Lyrics/Hotel California.txt'),(4,'/home/arstan/Desktop/Database Principles/Lyrics/Take On Me.txt');
/*!40000 ALTER TABLE `Lyrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person_Images`
--

DROP TABLE IF EXISTS `Person_Images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_Images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person_Images`
--

LOCK TABLES `Person_Images` WRITE;
/*!40000 ALTER TABLE `Person_Images` DISABLE KEYS */;
INSERT INTO `Person_Images` VALUES (1,'/home/arstan/Desktop/Database Principles/Person_Images/thom_yorke.jpg'),(2,'/home/arstan/Desktop/Database Principles/Person_Images/eagles-1.jpg'),(3,'/home/arstan/Desktop/Database Principles/Person_Images/a-ha-1.jpg'),(4,'/home/arstan/Desktop/Database Principles/Person_Images/Eiffel-1.jpeg');
/*!40000 ALTER TABLE `Person_Images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persons`
--

DROP TABLE IF EXISTS `Persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Persons_fk0` (`artist_id`),
  KEY `Persons_fk1` (`image_id`),
  CONSTRAINT `Persons_fk0` FOREIGN KEY (`artist_id`) REFERENCES `Artists` (`id`),
  CONSTRAINT `Persons_fk1` FOREIGN KEY (`image_id`) REFERENCES `Person_Images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persons`
--

LOCK TABLES `Persons` WRITE;
/*!40000 ALTER TABLE `Persons` DISABLE KEYS */;
INSERT INTO `Persons` VALUES (1,'Thom Yorke',1,1),(2,'Don Henley',2,2),(3,'Morten Harket',3,3),(4,'Gabry Ponte',4,4);
/*!40000 ALTER TABLE `Persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Song_Files`
--

DROP TABLE IF EXISTS `Song_Files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Song_Files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Song_Files`
--

LOCK TABLES `Song_Files` WRITE;
/*!40000 ALTER TABLE `Song_Files` DISABLE KEYS */;
INSERT INTO `Song_Files` VALUES (1,'/home/arstan/Desktop/Database Principles/Songs_For_Project/A-Ha - Take On Me.mp3'),(2,'/home/arstan/Desktop/Database Principles/Songs_For_Project/Eiffel 65 - Blue (Da Ba Dee).mp3'),(3,'/home/arstan/Desktop/Database Principles/Songs_For_Project/Eagles - Hotel California.mp3'),(4,'/home/arstan/Desktop/Database Principles/Songs_For_Project/Radiohead - Creep.m4a');
/*!40000 ALTER TABLE `Song_Files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `duration` int(11) NOT NULL,
  `written_by` varchar(1024) NOT NULL,
  `album_id` int(11) NOT NULL,
  `lyrics_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Songs_fk0` (`file_id`),
  KEY `Songs_fk1` (`album_id`),
  KEY `Songs_fk2` (`lyrics_id`),
  CONSTRAINT `Songs_fk0` FOREIGN KEY (`file_id`) REFERENCES `Song_Files` (`id`),
  CONSTRAINT `Songs_fk1` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`id`),
  CONSTRAINT `Songs_fk2` FOREIGN KEY (`lyrics_id`) REFERENCES `Lyrics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES (1,'Creep',4,8,'1993-01-01',240,'Thom Yorke',1,2),(2,'Hotel California',3,10,'1976-01-01',400,'Don Felder, Don Henley, Glenn Frey',2,3),(3,'Take On Me',1,10,'1985-01-01',230,'Harket Morten',3,4),(4,'Blue (Da Ba Dee)',2,7,'1997-01-01',260,'Jeffrey Jey',4,1);
/*!40000 ALTER TABLE `Songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subgenres`
--

DROP TABLE IF EXISTS `Subgenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subgenres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Subgenres_fk0` (`genre_id`),
  CONSTRAINT `Subgenres_fk0` FOREIGN KEY (`genre_id`) REFERENCES `Genres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subgenres`
--

LOCK TABLES `Subgenres` WRITE;
/*!40000 ALTER TABLE `Subgenres` DISABLE KEYS */;
INSERT INTO `Subgenres` VALUES (1,'Synth-pop',2),(2,'Euro-dance',3),(3,'Classic-rock',1),(4,'Alternative-rock',1);
/*!40000 ALTER TABLE `Subgenres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-31 21:31:50
