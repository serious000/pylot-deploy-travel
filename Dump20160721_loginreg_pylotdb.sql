CREATE DATABASE  IF NOT EXISTS `loginreg_pylotdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `loginreg_pylotdb`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: loginreg_pylotdb
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ben','Carson','bcarson@gmail.com','$2b$12$r/7JfdubUlLoLBZcou3D5OIn2qslJnn3QQRYN31CFtyJVUW1V0gk2','2016-07-18 19:34:19','2016-07-18 19:34:19'),(3,'George','Cooney','gcooney@gmail.com','$2b$12$19x2ulXAv6rdtEc1ToEItecHwdusk92sA29qhZ080noUL49YWdVtG','2016-07-18 22:00:30','2016-07-18 22:00:30'),(4,'Charlie','Brown','cbrown@cd.com','$2b$12$svnRYiWStHnbI0ObO4Gv1Ok1/Mo.6EFCom9gK4LtpHl0sj35FQZ0O','2016-07-18 22:20:04','2016-07-18 22:20:04'),(5,'Dan','White','dwhite@gmail.com','$2b$12$6ziAaNyAqCeJ4VJYzbfmzO9SSB2y41rexA0D6hHrsrNAoP4Bef/t2','2016-07-18 22:30:11','2016-07-18 22:30:11'),(6,'Edward','Sur','esur@gmail.com','$2b$12$wiJHvyeuW/z63AHfbSrBye7RpxUJRg1Z/ekvHxcfn/1yYeZNoy2AG','2016-07-18 22:31:49','2016-07-18 22:31:49'),(7,'Frank','Sinatra','fsinatra@gmail.com','$2b$12$ZNWLGEwFGbUHVI8m.TiyQ.xscZ3RoColp8kBBLp7qR6/xzrVrcnte','2016-07-18 23:01:56','2016-07-18 23:01:56'),(8,'Harry','Truman','htruman@gmail.com','$2b$12$N9UFTTAKM44AGmvBH0RMquk1dHrO5B2kU4Q7N0OSxmn7NEEXvQ9NC','2016-07-18 23:03:21','2016-07-18 23:03:21'),(9,'Emma','Smith','esmith@gmail.com','$2b$12$3BuC/xGBPLyi5UCWB0kLduZbqDHIvKR.Skn268iw1fZk6E0X6ZHVW','2016-07-18 23:08:36','2016-07-18 23:08:36'),(10,'Jack','Ken','jken@gmail.com','$2b$12$9CAdy68nWf7fIxXvkOUciuZfVy6PJVjsUQ8apMuqfSGAYie.q4Jdi','2016-07-18 23:18:25','2016-07-18 23:18:25'),(11,'Ann','Young','ayoung@gmail.com','$2b$12$tMxkxmuwyAZ1SIhek6QwHOn9kyHk6v09S9x7wABN7PebkYh1Uwrgy','2016-07-18 23:19:47','2016-07-18 23:19:47'),(12,'Manny','Oss','moss@gmail.com','$2b$12$rTTf2ENhbpMmZQ5HEn4YGOP19X1nGd.rMWKrIoP4U/6L7Pz8kPDXy','2016-07-18 23:25:02','2016-07-18 23:25:02'),(13,'Chaz','Mez','cmez@gmail.com','$2b$12$KIGPq7hXFoV881DIP765bua4aJQxc.qkQ82iMPKsQPvxeAwuOziBe','2016-07-18 23:28:22','2016-07-18 23:28:22'),(14,'Jeff','Jay','jjay@gmail.com','$2b$12$Um6oZMh9/leIc4d5STKR1.A/f6ICrSBUcukNphyRRbqbMSYD23es6','2016-07-19 10:50:42','2016-07-19 10:50:42'),(15,'Ida','Dezz','idezz@gmail.com','$2b$12$gjvSFDqn9tnh1szBRtsFjuAUg5NyTzLIPj0aSpgoTz59oVG6JSe/O','2016-07-19 10:55:53','2016-07-19 10:55:53');
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

-- Dump completed on 2016-07-21 15:48:01
