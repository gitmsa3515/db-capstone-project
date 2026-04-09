CREATE DATABASE  IF NOT EXISTS `littlelemondb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `littlelemondb`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.45

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

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` date NOT NULL,
  `TableNumber` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `StaffID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `CustomerID_idx` (`CustomerID`),
  KEY `StaffID_idx` (`StaffID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customerdetails` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StaffID` FOREIGN KEY (`StaffID`) REFERENCES `staffinformation` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerdetails` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerFirstName` varchar(255) NOT NULL,
  `CustomerLastName` varchar(255) NOT NULL,
  `ContactNumber` varchar(15) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdetails`
--

LOCK TABLES `customerdetails` WRITE;
/*!40000 ALTER TABLE `customerdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(255) NOT NULL,
  `Cuisine` varchar(255) NOT NULL,
  `StarterName` varchar(255) NOT NULL,
  `CourseName` varchar(255) NOT NULL,
  `DrinkName` varchar(255) NOT NULL,
  `DessertName` varchar(255) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverystatus`
--

DROP TABLE IF EXISTS `orderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystatus` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `DeliveryDate` date NOT NULL,
  `Status` varchar(45) NOT NULL,
  `OrderID` int DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  CONSTRAINT `OrderID` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverystatus`
--

LOCK TABLES `orderdeliverystatus` WRITE;
/*!40000 ALTER TABLE `orderdeliverystatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,0) NOT NULL,
  `BookingID` int NOT NULL,
  `MenuID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `BookingID_idx` (`BookingID`),
  KEY `MenuID_idx` (`MenuID`),
  CONSTRAINT `BookingID` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MenuID` FOREIGN KEY (`MenuID`) REFERENCES `menus` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffinformation`
--

DROP TABLE IF EXISTS `staffinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffinformation` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `StaffFirstName` varchar(255) NOT NULL,
  `StaffLastName` varchar(255) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` decimal(10,0) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffinformation`
--

LOCK TABLES `staffinformation` WRITE;
/*!40000 ALTER TABLE `staffinformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffinformation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-01 17:10:16
