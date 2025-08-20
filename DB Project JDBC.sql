-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oopjavaproject
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointmentId` int NOT NULL,
  `vehicleId` varchar(255) DEFAULT NULL,
  `customerId` int DEFAULT NULL,
  `appointmentDate` date NOT NULL DEFAULT (curdate()),
  `serviceType` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`appointmentId`),
  KEY `vehicleId` (`vehicleId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`vehicleId`) REFERENCES `vehicles` (`vehicleId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_positive_cost` CHECK ((`cost` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (223,'AYV2025',109,'2019-02-23','TireReplacement',5000.00),(224,'SMK6209',107,'2014-12-20','TireReplacement',5000.00),(225,'AYV114',108,'2020-11-04','OilChange',1500.00),(226,'XYZ123',110,'2005-04-02','OilChange',1500.00);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerId` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `cnic` varchar(30) NOT NULL,
  PRIMARY KEY (`customerId`),
  CONSTRAINT `customers_chk_1` CHECK (((length(`contact`) = 12) and regexp_like(`contact`,_utf8mb4'^[0-9]{4}-[0-9]{7}$'))),
  CONSTRAINT `customers_chk_2` CHECK (((length(`cnic`) = 15) and regexp_like(`cnic`,_utf8mb4'^[0-9]{5}-[0-9]{7}-[0-9]$')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (102,'Ahmed','5342-4213486','45103-5345500-5'),(103,'Ali','0345-6253638','45103-5357320-2'),(104,'Talha','0346-3645737','45204-6367300-3'),(105,'Nafees','0435-3454587','45104-6323356-6'),(106,'Hasnain','0424-5223868','45246-4532300-3'),(107,'Babar','0324-3242286','45253-6632450-5'),(108,'Sheeraz','0345-2352278','42356-3673300-3'),(109,'Moiz','0342-5235466','45256-7366600-6'),(110,'Reehan','0313-3452421','45255-7324540-4'),(111,'Junaid','0352-5646327','35673-2467320-2'),(112,'ALi','0524-5243325','35721-4523355-2');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `vehicleId` varchar(30) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `reg_city` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('AFR2025','Toyota Grande','2025','karachi','Black','Car'),('AGA081','Honda Civic','2024','Karachi','Black','Car'),('ASA011','Toyota','2020','Lahore','Red','Car'),('ATU032','Toyota','2022','Karachi','Black','Car'),('AYV114','Honda','2019','Karachi','White','Car'),('AYV2025','Kia Sportage','2025','Islamabad','White','Car'),('SMK6209','Honda','2018','Sukkur','Red','Bike'),('XYZ123','BMW','2022','Islamabad','Black','Car');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-21 22:24:26
