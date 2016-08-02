CREATE DATABASE  IF NOT EXISTS `travel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `travel`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: travel
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participants_users_idx` (`user_id`),
  KEY `fk_participants_trips1_idx` (`trip_id`),
  CONSTRAINT `fk_participants_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participants_trips1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,'2016-08-01 21:13:40','2016-08-01 21:13:40',1,3),(3,'2016-08-01 21:14:19','2016-08-01 21:14:19',4,1);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'Pacific Northwest','Visit Olympia','Seatle WA','2016-08-11','2016-08-27','2016-08-01 20:58:35','2016-08-01 20:58:35',4),(3,'Denali Trip','Visit Denali Park','Anchorage AK','2016-09-17','2016-10-19','2016-08-01 21:08:13','2016-08-01 21:08:13',1),(4,'Trip Down South','Visit Sidney','Sidney Australia','2016-11-29','2016-12-25','2016-08-01 21:10:22','2016-08-01 21:10:22',NULL),(6,NULL,'Stay at park','Grand Canyon AZ','2016-08-09','2016-08-23','2016-08-01 23:21:42','2016-08-01 23:21:42',NULL),(7,NULL,'Visit Elvis home','Memphis TN','2016-08-20','2016-08-30','2016-08-01 23:24:34','2016-08-01 23:24:34',NULL);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Stephen King','sking@gmail.com','$2b$12$zVL6xKZKIKF.EYV.raw1quqyduldO9MW0EaNrehmtsixhj9UkwDVq','2016-08-01 20:29:46','2016-08-01 20:29:46'),(2,'Shello Fisher','sfisher@codingdojo.com','$2b$12$xInQaAu/.s6mtBJmFDijOOS9QoAZ7JkdXAxYBlllA8gzWNx8Mcsz6','2016-08-01 21:00:22','2016-08-01 21:00:22'),(3,'Tristan Lestat','tlestat@gmail.com','$2b$12$APPJOy3Ob2O7JjRdxtSQ7up9lPkZiSAx2CE4vClJf1UEMniHyKcmO','2016-08-01 21:01:06','2016-08-01 21:01:06'),(4,'George Cooney','gcooney@gmail.com','$2b$12$MU9PIfvokc2hr0bnRmH.FeDdElLa284UJGFoknkRbTekBwBS7jxl2','2016-08-01 21:01:55','2016-08-01 21:01:55'),(5,'Liz Taylor','ltaylor@gmail.com','$2b$12$tkOSycOd6mm1x8xDSIg8DOOWYCu6oALALtMi0Li5yq..zYVZ0sY.q','2016-08-01 21:02:48','2016-08-01 21:02:48'),(6,'Kate Winslet','kwinslet@gmail.com','$2b$12$w2pPLY9r2Mckr.93jOBkJeFHwIkxoPuHnBcmZ.AiMD2EcF/My267a','2016-08-01 21:04:39','2016-08-01 21:04:39'),(7,'Jodie Foster','jfoster@gmail.com','$2b$12$iqGXryUjvkB3KHzdlSF3Ku2WJ/y0Jj8HRlXvpbEI94aOTVOcfamLS','2016-08-01 21:05:08','2016-08-01 21:05:08');
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

-- Dump completed on 2016-08-02  0:30:52
