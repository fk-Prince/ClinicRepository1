-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: clinicdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DoctorID` bigint NOT NULL DEFAULT '1000',
  `OperationCode` bigint NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `ContactNumber` bigint NOT NULL,
  `Date-Hired` date NOT NULL,
  `PIN` varchar(45) NOT NULL,
  PRIMARY KEY (`DoctorID`,`OperationCode`),
  KEY `fk_Doctors_Operations1_idx` (`OperationCode`),
  CONSTRAINT `fk_Doctors_Operations1` FOREIGN KEY (`OperationCode`) REFERENCES `operations` (`OperationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (123,5000,'Prince','I','Sestoso',10,'roxas','Male',9771171913,'1970-10-10','977');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frontdesk`
--

DROP TABLE IF EXISTS `frontdesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frontdesk` (
  `FrontDeskID` bigint NOT NULL DEFAULT '1000',
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Age` varchar(45) DEFAULT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`FrontDeskID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frontdesk`
--

LOCK TABLES `frontdesk` WRITE;
/*!40000 ALTER TABLE `frontdesk` DISABLE KEYS */;
INSERT INTO `frontdesk` VALUES (1,'admin','admin',NULL,NULL,NULL,NULL,'Admin'),(2,'a','a',NULL,NULL,NULL,NULL,'Staff'),(3,'43','asd',NULL,NULL,NULL,NULL,'Admin'),(4,'21','dasd',NULL,NULL,NULL,NULL,'Staff'),(5,'12','as',NULL,NULL,NULL,NULL,'Staff');
/*!40000 ALTER TABLE `frontdesk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalhistory`
--

DROP TABLE IF EXISTS `medicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalhistory` (
  `PatientID` bigint NOT NULL,
  `DoctorID` bigint NOT NULL,
  `OperationCode` bigint NOT NULL,
  `FrontDeskID` bigint NOT NULL,
  PRIMARY KEY (`PatientID`,`DoctorID`,`OperationCode`,`FrontDeskID`),
  KEY `fk_MedicalHistory_Doctors1_idx` (`DoctorID`),
  KEY `fk_MedicalHistory_Operations1_idx` (`OperationCode`),
  KEY `fk_MedicalHistory_FrontDesk1_idx` (`FrontDeskID`),
  CONSTRAINT `fk_MedicalHistory_Doctors1` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_MedicalHistory_FrontDesk1` FOREIGN KEY (`FrontDeskID`) REFERENCES `frontdesk` (`FrontDeskID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_MedicalHistory_Operations1` FOREIGN KEY (`OperationCode`) REFERENCES `operations` (`OperationCode`) ON UPDATE CASCADE,
  CONSTRAINT `fk_MedicalHistory_Patients` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalhistory`
--

LOCK TABLES `medicalhistory` WRITE;
/*!40000 ALTER TABLE `medicalhistory` DISABLE KEYS */;
INSERT INTO `medicalhistory` VALUES (6,123,5000,5),(13,123,5000,1),(14,123,5000,1);
/*!40000 ALTER TABLE `medicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations` (
  `OperationCode` bigint NOT NULL DEFAULT '1',
  `FrontDeskID` bigint NOT NULL,
  `OperationName` varchar(45) NOT NULL,
  `DateAdded` date NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` varchar(100) NOT NULL,
  PRIMARY KEY (`OperationCode`,`FrontDeskID`),
  KEY `fk_Operations_FrontDesk1_idx` (`FrontDeskID`),
  CONSTRAINT `fk_Operations_FrontDesk1` FOREIGN KEY (`FrontDeskID`) REFERENCES `frontdesk` (`FrontDeskID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (5000,1,'Surgery','2011-11-11',1200.00,'abc'),(5001,1,'544','2025-02-28',54.00,'54');
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `PatientID` bigint NOT NULL AUTO_INCREMENT,
  `RoomNo` bigint NOT NULL,
  `FrontDeskID` bigint NOT NULL,
  `DoctorID` bigint NOT NULL,
  `OperationCode` bigint NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Age` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `PatientCondition` varchar(100) NOT NULL,
  `BirthDate` date NOT NULL,
  `DateAdmitted` date NOT NULL,
  `ContactNumber` bigint DEFAULT NULL,
  `Bill` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PatientID`,`RoomNo`,`FrontDeskID`,`DoctorID`,`OperationCode`),
  KEY `fk_Patients_Rooms_idx` (`RoomNo`),
  KEY `fk_Patients_FrontDesk1_idx` (`FrontDeskID`),
  KEY `fk_Patients_Doctors1_idx` (`DoctorID`),
  KEY `fk_Patients_Operations1_idx` (`OperationCode`),
  CONSTRAINT `fk_Patients_Doctors1` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  CONSTRAINT `fk_Patients_FrontDesk1` FOREIGN KEY (`FrontDeskID`) REFERENCES `frontdesk` (`FrontDeskID`),
  CONSTRAINT `fk_Patients_Operations1` FOREIGN KEY (`OperationCode`) REFERENCES `operations` (`OperationCode`),
  CONSTRAINT `fk_Patients_Rooms` FOREIGN KEY (`RoomNo`) REFERENCES `rooms` (`RoomNo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,402,1,123,5000,'dfg','dfg','dfg','43','dfgdf','Male','sdfvsdf','2001-11-11','2025-02-28',345345345,1200.00),(2,403,1,123,5000,'asd','dasd','asd','34','345343','Male','dfgbdfg','2001-11-12','2025-02-28',35345,1200.00),(6,401,5,123,5000,'asd','asd','asd','54','54','male','sdfs','2001-11-11','2001-11-11',5435456546,1200.00),(7,405,1,123,5000,'sdfsd','sdf','sdfsdf','43','sdfsdf','Male','sdfvsd','2001-11-11','2025-02-28',34534,1200.00),(8,402,1,123,5000,'34534','345','3453','34','34534','Male','','2001-11-11','2025-02-28',345345,1200.00),(9,403,1,123,5000,'dfgdf','dfgdf','dfgdf','23','5345','Male','534b534','2001-11-11','2025-02-28',2345345,1200.00),(10,403,1,123,5000,'34534','5345','345','34','34534','Male','','2001-11-12','2025-02-28',345345,1200.00),(11,404,1,123,5000,'dfgdf','gdfg','dfg','54','dfgdfg','Male','dfgdf','2001-11-11','2025-02-28',45645,1200.00),(12,401,1,123,5000,'345','345','34534','54','5454','Male','345345','2001-11-11','2025-02-28',345345,1200.00),(13,401,1,123,5000,'34534','345','35','34','34534','Male','345b345','2001-11-11','2025-02-28',345345,1200.00),(14,402,1,123,5000,'54','54','54','23','123','Male','','2001-11-12','2025-02-28',345,1200.00);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `RoomNo` bigint NOT NULL,
  `Occupation` varchar(30) DEFAULT 'Not Occupied',
  PRIMARY KEY (`RoomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (401,'Occupied'),(402,'Occupied'),(403,'Not Occupied'),(404,'Not Occupied'),(405,'Not Occupied');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-28 19:16:38
