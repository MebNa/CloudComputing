CREATE DATABASE  IF NOT EXISTS `tresflight` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tresflight`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: php-database.cownduljo9z3.us-east-1.rds.amazonaws.com    Database: tresflight
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;

--
-- GTID state at the beginning of the backup 
--


--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_uname` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pwd` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin@mail.com','$2y$10$AFMhdlwEaWjjBzoCfdq62uNQqopNGW4vk8GXrDBNGKPAgB0mON0TC'),(2,'an','an@mail.com','Anvip2003');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airline_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `seats` int NOT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'Biman Bangladesh',72),(2,'US-Bangla',72),(3,'Novoair',72),(4,'Air Astra',72),(5,'Vietnam Airlines',180),(6,'VietJet Air',180),(7,'Bamboo Airways',180);
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('Hanoi'),('Ho Chi Minh City'),('Da Nang'),('Nha Trang'),('Phu Quoc'),('Can Tho'),('Vung Tau'),('Hoi An'),('Ha Long'),('Buon Ma Thuot'),('Phan Thiet'),('Long Xuyen'),('Da Lat'),('Barisal'),('Chittagong'),('Cox\'s Bazar'),('Dhaka'),('Rajshahi'),('Sylhet');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feed_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `q1` varchar(250) NOT NULL,
  `q2` varchar(20) NOT NULL,
  `q3` varchar(250) NOT NULL,
  `rate` int NOT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'oishee@gmail.com','There is an issue with round trip booking. Please fix it.','Friend/Relative','',4),(2,'an6668888@gmail.com','dep','Television','',4);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `source` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `departure` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  `duration` varchar(20) NOT NULL,
  `airline` varchar(20) NOT NULL,
  `seats` varchar(110) NOT NULL,
  `price` int NOT NULL,
  `status` varchar(6) DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,1,'Dhaka','Sylhet','2024-04-27 08:00:00','2024-04-27 09:00:00','1 hour','Biman Bangladesh','72',3200,'',''),(2,1,'Dhaka','Sylhet','2024-04-27 10:00:00','2024-04-27 11:00:00','1 hour','US-Bangla','72',3400,'',''),(3,1,'Dhaka','Chittagong','2024-04-27 08:30:00','2024-04-27 09:30:00','1 hour','Novoair','72',3500,'',''),(4,1,'Dhaka','Chittagong','2024-04-27 11:00:00','2024-04-27 12:00:00','1 hour','US-Bangla','72',3450,'',''),(5,1,'Dhaka','Cox\'s Bazar','2024-04-27 08:00:00','2024-04-27 09:00:00','2 hour','Biman Bangladesh','72',4000,'',''),(6,1,'Dhaka','Cox\'s Bazar','2024-04-27 10:00:00','2024-04-27 12:00:00','2 hour','US-Bangla','72',4200,'',''),(7,1,'Dhaka','Rajshahi','2024-04-27 09:30:00','2024-04-27 10:30:00','1 hour','Air Astra','72',3400,'',''),(8,1,'Dhaka','Barisal','2024-04-27 11:00:00','2024-04-27 11:40:00','40 mins','Novoair','72',2500,'',''),(9,1,'Sylhet','Dhaka','2024-04-27 08:00:00','2024-04-27 09:00:00','1 hour','Biman Bangladesh','72',3200,'',''),(10,1,'Sylhet','Dhaka','2024-04-27 10:00:00','2024-04-27 11:00:00','1 hour','US-Bangla','72',3400,'',''),(11,1,'Chittagong','Dhaka','2024-04-27 08:30:00','2024-04-27 09:30:00','1 hour','Novoair','72',3500,'',''),(12,1,'Chittagong','Dhaka','2024-04-27 11:00:00','2024-04-27 12:00:00','1 hour','US-Bangla','72',3450,'',''),(13,1,'Cox\'s Bazar','Dhaka','2024-04-27 08:00:00','2024-04-27 09:00:00','2 hour','Biman Bangladesh','72',4000,'',''),(14,1,'Cox\'s Bazar','Dhaka','2024-04-27 10:00:00','2024-04-27 12:00:00','2 hour','US-Bangla','72',4200,'',''),(15,1,'Rajshahi','Dhaka','2024-04-27 09:30:00','2024-04-27 10:30:00','1 hour','Air Astra','72',3400,'',''),(16,1,'Barisal','Dhaka','2024-04-27 11:00:00','2024-04-27 11:40:00','40 mins','Novoair','72',2500,'',''),(17,1,'Sylhet','Chittagong','2024-04-27 09:00:00','2024-04-27 10:00:00','1 hour','US-Bangla','72',3600,'',''),(18,1,'Sylhet','Cox\'s Bazar','2024-04-27 10:30:00','2024-04-27 13:30:00','3 hour','Biman Bangladesh','72',4500,'',''),(19,1,'Sylhet','Rajshahi','2024-04-27 09:00:00','2024-04-27 11:00:00','2 hour','Air Astra','72',3800,'',''),(20,1,'Sylhet','Barisal','2024-04-27 08:00:00','2024-04-27 10:00:00','2 hour','Air Astra','72',3500,'',''),(21,1,'Chittagong','Sylhet','2024-04-27 09:00:00','2024-04-27 10:00:00','1 hour','US-Bangla','72',3600,'',''),(22,1,'Cox\'s Bazar','Sylhet','2024-04-27 10:30:00','2024-04-27 13:30:00','3 hour','Biman Bangladesh','72',4500,'',''),(23,1,'Rajshahi','Sylhet','2024-04-27 09:00:00','2024-04-27 11:00:00','2 hour','Air Astra','72',3800,'',''),(24,1,'Barisal','Sylhet','2024-04-27 08:00:00','2024-04-27 10:00:00','2 hour','Air Astra','72',3500,'',''),(26,1,'Chittagong','Cox\'s Bazar','2024-04-27 10:00:00','2024-04-27 10:40:00','40 mins','Novoair','72',4500,'',''),(27,1,'Chittagong','Rajshahi','2024-04-27 09:00:00','2024-04-27 12:00:00','3 hour','US-Bangla','72',4600,'',''),(28,1,'Cox\'s Bazar','Chittagong','2024-04-27 10:00:00','2024-04-27 10:40:00','40 mins','Novoair','72',4500,'',''),(29,1,'Rajshahi','Chittagong','2024-04-27 09:00:00','2024-04-27 12:00:00','3 hour','US-Bangla','72',4600,'',''),(30,1,'Dhaka','Sylhet','2024-04-28 08:00:00','2024-04-28 09:00:00','1 hour','Biman Bangladesh','72',3200,'',''),(31,1,'Dhaka','Sylhet','2024-04-28 10:00:00','2024-04-28 11:00:00','1 hour','US-Bangla','72',3400,'',''),(32,1,'Dhaka','Chittagong','2024-04-28 08:30:00','2024-04-28 09:30:00','1 hour','Novoair','72',3500,'',''),(33,1,'Dhaka','Chittagong','2024-04-28 11:00:00','2024-04-28 12:00:00','1 hour','US-Bangla','72',3450,'',''),(34,1,'Dhaka','Cox\'s Bazar','2024-04-28 08:00:00','2024-04-28 09:00:00','2 hour','Biman Bangladesh','72',4000,'',''),(35,1,'Dhaka','Cox\'s Bazar','2024-04-28 10:00:00','2024-04-28 12:00:00','2 hour','US-Bangla','72',4200,'',''),(36,1,'Dhaka','Rajshahi','2024-04-28 09:30:00','2024-04-28 10:30:00','1 hour','Air Astra','72',3400,'',''),(37,1,'Dhaka','Barisal','2024-04-28 11:00:00','2024-04-28 11:40:00','40 mins','Novoair','72',2500,'',''),(38,1,'Sylhet','Dhaka','2024-04-28 08:00:00','2024-04-28 09:00:00','1 hour','Biman Bangladesh','72',3200,'',''),(39,1,'Sylhet','Dhaka','2024-04-28 10:00:00','2024-04-28 11:00:00','1 hour','US-Bangla','72',3400,'',''),(40,1,'Chittagong','Dhaka','2024-04-28 08:30:00','2024-04-28 09:30:00','1 hour','Novoair','72',3500,'',''),(41,1,'Chittagong','Dhaka','2024-04-28 11:00:00','2024-04-28 12:00:00','1 hour','US-Bangla','72',3450,'',''),(42,1,'Cox\'s Bazar','Dhaka','2024-04-28 08:00:00','2024-04-28 09:00:00','2 hour','Biman Bangladesh','72',4000,'',''),(43,1,'Cox\'s Bazar','Dhaka','2024-04-28 10:00:00','2024-04-28 12:00:00','2 hour','US-Bangla','72',4200,'',''),(44,1,'Rajshahi','Dhaka','2024-04-28 09:30:00','2024-04-28 10:30:00','1 hour','Air Astra','72',3400,'',''),(45,1,'Barisal','Dhaka','2024-04-28 11:00:00','2024-04-28 11:40:00','40 mins','Novoair','72',2500,'',''),(46,1,'Sylhet','Chittagong','2024-04-28 09:00:00','2024-04-28 10:00:00','1 hour','US-Bangla','72',3600,'',''),(47,1,'Sylhet','Cox\'s Bazar','2024-04-28 10:30:00','2024-04-28 13:30:00','3 hour','Biman Bangladesh','72',4500,'',''),(48,1,'Sylhet','Rajshahi','2024-04-28 09:00:00','2024-04-28 11:00:00','2 hour','Air Astra','72',3800,'',''),(49,1,'Sylhet','Barisal','2024-04-28 08:00:00','2024-04-28 10:00:00','2 hour','Air Astra','72',3500,'',''),(50,1,'Chittagong','Sylhet','2024-04-28 09:00:00','2024-04-28 10:00:00','1 hour','US-Bangla','72',3600,'',''),(51,1,'Cox\'s Bazar','Sylhet','2024-04-28 10:30:00','2024-04-28 13:30:00','3 hour','Biman Bangladesh','72',4500,'',''),(52,1,'Rajshahi','Sylhet','2024-04-28 09:00:00','2024-04-28 11:00:00','2 hour','Air Astra','72',3800,'',''),(53,1,'Barisal','Sylhet','2024-04-28 08:00:00','2024-04-28 10:00:00','2 hour','Air Astra','72',3500,'',''),(54,1,'Chittagong','Cox\'s Bazar','2024-04-28 10:00:00','2024-04-28 10:40:00','40 mins','Novoair','72',4500,'',''),(55,1,'Chittagong','Rajshahi','2024-04-28 09:00:00','2024-04-28 12:00:00','3 hour','US-Bangla','72',4600,'',''),(56,1,'Cox\'s Bazar','Chittagong','2024-04-28 10:00:00','2024-04-28 10:40:00','40 mins','Novoair','72',4500,'',''),(57,1,'Rajshahi','Chittagong','2024-04-28 09:00:00','2024-04-28 12:00:00','3 hour','US-Bangla','72',4600,'',''),(58,1,'Rajshahi','Cox\'s Bazar','2024-04-28 10:00:00','2024-04-28 14:00:00','4 hour','US-Bangla','72',5200,'',''),(59,1,'Hanoi','Ho Chi Minh City','2024-06-02 08:00:00','2024-06-02 10:00:00','2 hours','Vietnam Airlines','110',4500,'',''),(60,1,'Ho Chi Minh City','Da Nang','2024-06-02 12:00:00','2024-06-02 13:30:00','1.5 hours','VietJet Air','100',3200,'',''),(61,1,'Ho Chi Minh City','Nha Trang','2024-06-02 14:00:00','2024-06-02 15:30:00','1.5 hours','Vietnam Airlines','120',3800,'',''),(62,1,'Da Nang','Hanoi','2024-06-02 16:00:00','2024-06-02 17:30:00','1.5 hours','Bamboo Airways','130',3600,'',''),(63,1,'Nha Trang','Ho Chi Minh City','2024-06-02 18:00:00','2024-06-02 19:30:00','1.5 hours','VietJet Air','90',3000,'',''),(64,1,'Phu Quoc','Ho Chi Minh City','2024-06-02 20:00:00','2024-06-02 21:30:00','1.5 hours','Vietnam Airlines','100',4000,'',''),(70,1,'Hanoi','Ho Chi Minh City','2024-06-01 08:00:00','2024-06-01 10:00:00','2 hours','Vietnam Airlines','180',1500000,'',''),(71,1,'Ho Chi Minh City','Da Nang','2024-06-01 12:00:00','2024-06-01 14:00:00','2 hours','Vietnam Airlines','180',1200000,'',''),(72,1,'Da Nang','Nha Trang','2024-06-01 16:00:00','2024-06-01 18:00:00','2 hours','Bamboo Airways','180',1000000,'',''),(73,1,'Nha Trang','Phu Quoc','2024-06-02 08:00:00','2024-06-02 10:00:00','2 hours','Bamboo Airways','180',1300000,'',''),(74,1,'Phu Quoc','Can Tho','2024-06-02 12:00:00','2024-06-02 13:00:00','1 hour','VietJet Air','180',900000,'',''),(75,1,'Can Tho','Vung Tau','2024-06-02 15:00:00','2024-06-02 16:00:00','1 hour','VietJet Air','180',850000,'',''),(76,1,'Vung Tau','Hoi An','2024-06-03 08:00:00','2024-06-03 10:00:00','2 hours','Vietnam Airlines','180',1100000,'',''),(77,1,'Hoi An','Ha Long','2024-06-03 12:00:00','2024-06-03 14:00:00','2 hours','Vietnam Airlines','180',1250000,'',''),(78,1,'Ha Long','Buon Ma Thuot','2024-06-03 16:00:00','2024-06-03 18:00:00','2 hours','Bamboo Airways','180',1050000,'',''),(79,1,'Buon Ma Thuot','Phan Thiet','2024-06-04 08:00:00','2024-06-04 09:30:00','1.5 hours','Bamboo Airways','180',950000,'',''),(80,1,'Phan Thiet','Long Xuyen','2024-06-04 12:00:00','2024-06-04 13:00:00','1 hour','VietJet Air','180',800000,'',''),(81,1,'Long Xuyen','Tam Dao','2024-06-04 15:00:00','2024-06-04 16:00:00','1 hour','VietJet Air','180',750000,'',''),(82,1,'Tam Dao','Bien Hoa','2024-06-05 08:00:00','2024-06-05 09:00:00','1 hour','Vietnam Airlines','180',700000,'',''),(83,1,'Bien Hoa','Da Lat','2024-06-05 12:00:00','2024-06-05 13:00:00','1 hour','Vietnam Airlines','180',850000,'',''),(84,1,'Da Lat','Hanoi','2024-06-05 16:00:00','2024-06-05 18:00:00','2 hours','Bamboo','180',700000,'',''),(85,1,'Hanoi','Ho Chi Minh City','2024-06-06 08:00:00','2024-06-06 10:00:00','2 hours','Vietnam Airlines','180',1500000,'',''),(86,1,'Ho Chi Minh City','Da Nang','2024-06-06 12:00:00','2024-06-06 14:00:00','2 hours','Vietnam Airlines','180',1200000,'',''),(87,1,'Da Nang','Nha Trang','2024-06-06 16:00:00','2024-06-06 18:00:00','2 hours','Bamboo Airways','180',1000000,'',''),(88,1,'Nha Trang','Phu Quoc','2024-06-07 08:00:00','2024-06-07 10:00:00','2 hours','Bamboo Airways','180',1300000,'',''),(89,1,'Phu Quoc','Can Tho','2024-06-07 12:00:00','2024-06-07 13:00:00','1 hour','VietJet Air','180',900000,'',''),(90,1,'Can Tho','Vung Tau','2024-06-07 15:00:00','2024-06-07 16:00:00','1 hour','VietJet Air','180',850000,'',''),(91,1,'Vung Tau','Hoi An','2024-06-08 08:00:00','2024-06-08 10:00:00','2 hours','Vietnam Airlines','180',1100000,'',''),(92,1,'Hoi An','Ha Long','2024-06-08 12:00:00','2024-06-08 14:00:00','2 hours','Vietnam Airlines','180',1250000,'',''),(93,1,'Ha Long','Buon Ma Thuot','2024-06-08 16:00:00','2024-06-08 18:00:00','2 hours','Bamboo Airways','180',1050000,'',''),(94,1,'Buon Ma Thuot','Phan Thiet','2024-06-09 08:00:00','2024-06-09 09:30:00','1.5 hours','Bamboo Airways','180',950000,'',''),(95,1,'Phan Thiet','Long Xuyen','2024-06-09 12:00:00','2024-06-09 13:00:00','1 hour','VietJet Air','180',800000,'',''),(96,1,'Long Xuyen','Tam Dao','2024-06-09 15:00:00','2024-06-09 16:00:00','1 hour','VietJet Air','180',750000,'',''),(97,1,'Tam Dao','Bien Hoa','2024-06-10 08:00:00','2024-06-10 09:00:00','1 hour','Vietnam Airlines','180',700000,'',''),(98,1,'Bien Hoa','Da Lat','2024-06-10 12:00:00','2024-06-10 13:00:00','1 hour','Vietnam Airlines','180',850000,'',''),(99,1,'Da Lat','Hanoi','2024-06-10 16:00:00','2024-06-10 18:00:00','2 hours','Bamboo Airways','180',1050000,'','');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_profile`
--

DROP TABLE IF EXISTS `passenger_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_profile` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `mobile` varchar(110) NOT NULL,
  `dob` datetime NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `m_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `user_id` (`user_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `passenger_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `passenger_profile_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_profile`
--

LOCK TABLES `passenger_profile` WRITE;
/*!40000 ALTER TABLE `passenger_profile` DISABLE KEYS */;
INSERT INTO `passenger_profile` VALUES (2,1,4,'1673123456','2001-01-07 00:00:00','Abeda','Zahin','Chandrica'),(3,7,2,'1234567231','2011-05-17 00:00:00','Thanh','An','Khuong'),(4,7,59,'3843419741','2000-06-07 00:00:00','an','An','Khuong'),(5,7,59,'3843419741','2002-02-05 00:00:00','an','thanh','khuong'),(6,9,59,'1236728911','2024-06-29 00:00:00','nguyen','van ','thanh');
/*!40000 ALTER TABLE `passenger_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `card_no` varchar(16) NOT NULL,
  `passenger_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `expire_date` varchar(5) DEFAULT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`passenger_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (9,'0978124354768976',1,4,'12/30',13800),(10,'12312312312312',7,2,'11/23',3400),(11,'123123123123',7,59,'10/20',4500),(12,'123123123132',7,59,'10/20',4500),(13,'123123112311123',9,59,'10/20',6750);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pwdreset`
--

DROP TABLE IF EXISTS `pwdreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pwdreset` (
  `pwd_reset_id` int NOT NULL AUTO_INCREMENT,
  `pwd_reset_email` varchar(50) NOT NULL,
  `pwd_reset_selector` varchar(80) NOT NULL,
  `pwd_reset_token` varchar(120) NOT NULL,
  `pwd_reset_expires` varchar(20) NOT NULL,
  PRIMARY KEY (`pwd_reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pwdreset`
--

LOCK TABLES `pwdreset` WRITE;
/*!40000 ALTER TABLE `pwdreset` DISABLE KEYS */;
/*!40000 ALTER TABLE `pwdreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int NOT NULL,
  `flight_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cost` int NOT NULL,
  `class` varchar(3) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  KEY `flight_id` (`flight_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,4,1,13800,'E'),(2,2,4,1,13800,'E'),(14,1,59,7,4500,'E'),(15,5,59,7,4500,'E'),(16,1,59,9,6750,'B');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'oisheefatima','oishee@gmail.com','$2y$10$MyKI/Qg.dVjMc3eADrkPGuE9fi8d/Am3FB6XroX7uKe.gWt5I5Hzu'),(7,'hungnt','hungnt@gmail.com','$2y$10$ACZcSaxQmgACmWSs2GfqYOQOgh.xKGEJUG1X4rCNVd6neQHssedRK'),(8,'khanh','khanhdqhe171671@fpt.edu.vn','$2y$10$eMwknjzs4ftklN0MHAqJg.5w4yeNxNlHsGOX/ajiUeAjIEl/htMEO'),(9,'thanh','thanh@gmail.com','$2y$10$Sd/5CcoAnK5mhN9RQSK72uSApI372BpVENesRvgpzLKIIgaWobB0a');
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

-- Dump completed on 2024-06-02 19:01:20
