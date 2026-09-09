-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: airportdb
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `id_airline` int NOT NULL AUTO_INCREMENT,
  `airline_name` varchar(100) NOT NULL,
  `airline_code` varchar(3) NOT NULL,
  `country` varchar(50) NOT NULL,
  `fleet_size` int NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_airline`),
  UNIQUE KEY `airline_code` (`airline_code`),
  CONSTRAINT `airline_chk_1` CHECK (((`fleet_size` >= 0) and (`fleet_size` <= 1000))),
  CONSTRAINT `airline_chk_2` CHECK (((`website` is null) or (`website` like _utf8mb4'http%://%.%') or (`website` like _utf8mb4'https%://%.%'))),
  CONSTRAINT `airline_chk_3` CHECK (((`contact_phone` is null) or (regexp_like(`contact_phone`,_utf8mb4'^\\+[0-9]{7,15}$') and (not((`contact_phone` like _utf8mb4'%[^0-9+]%'))))))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'Delta Air Lines','DAL','United States',900,'https://www.delta.com','+18002212121'),(2,'American Airlines','AAL','United States',950,'https://www.aa.com','+18004337300'),(3,'Emirates','UAE','United Arab Emirates',270,'https://www.emirates.com','+971600555555'),(4,'Lufthansa','DLH','Germany',280,'https://www.lufthansa.com','+498696799799'),(5,'Qatar Airways','QTR','Qatar',200,'https://www.qatarairways.com','+97440222000'),(6,'British Airways','BAW','United Kingdom',250,'https://www.britishairways.com','+44345800787'),(7,'Air France','AFR','France',210,'https://www.airfrance.com','+33157232323'),(8,'Japan Airlines','JAL','Japan',150,'https://www.jal.com','+81354601111'),(9,'Qantas','QFA','Australia',130,'https://www.qantas.com','+61296919691'),(10,'Singapore Airlines','SIA','Singapore',140,'https://www.singaporeair.com','+6562238888');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `id_airplane` int NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL,
  `id_airline` int NOT NULL,
  `capacity` int NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  `status` enum('Active','Maintenance','Inactive','Retired','Chartered','Storage','Damaged') NOT NULL DEFAULT 'Active',
  `last_status_change` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_airplane`),
  UNIQUE KEY `registration_number` (`registration_number`),
  KEY `id_airline` (`id_airline`),
  CONSTRAINT `airplane_ibfk_1` FOREIGN KEY (`id_airline`) REFERENCES `airline` (`id_airline`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES (1,'Boeing 737-800',1,160,'N123DA','Active','2025-04-07 17:55:55'),(2,'Boeing 777-300ER',1,300,'N456DL','Active','2025-04-07 17:55:55'),(3,'Airbus A320',2,150,'N789AA','Active','2025-04-07 17:55:55'),(4,'Boeing 787-9',2,280,'N101AA','Active','2025-04-07 17:55:55'),(5,'Airbus A380',3,500,'A6-EOS','Active','2025-04-07 17:55:55'),(6,'Boeing 777-200LR',3,320,'A6-EWA','Active','2025-04-07 17:55:55'),(7,'Airbus A350',4,300,'D-ABCA','Maintenance','2025-04-07 17:55:55'),(8,'Boeing 747-8',4,364,'D-ABYA','Active','2025-04-07 17:55:55'),(9,'Airbus A330',5,260,'A7-AFB','Active','2025-04-07 17:55:55'),(10,'Boeing 787-8',6,234,'G-ZBJC','Active','2025-04-07 17:55:55'),(11,'Airbus A380',7,516,'F-HPJI','Active','2025-04-07 17:55:55'),(12,'Boeing 777-300',8,244,'JA123J','Active','2025-04-07 17:55:55'),(13,'Boeing 737-800',9,174,'VH-XZB','Active','2025-04-07 17:55:55'),(14,'Airbus A350-900',10,253,'9V-SMA','Active','2025-04-07 17:55:55'),(15,'Boeing 777-300ER',10,264,'9V-SWB','Inactive','2025-04-07 17:55:55');
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane_crew`
--

DROP TABLE IF EXISTS `airplane_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_crew` (
  `id_assignment` int NOT NULL AUTO_INCREMENT,
  `id_airplane` int NOT NULL,
  `id_crew` int NOT NULL,
  `assignment_date` date NOT NULL,
  `role_in_flight` varchar(50) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_assignment`),
  UNIQUE KEY `id_airplane` (`id_airplane`,`id_crew`,`assignment_date`),
  KEY `id_crew` (`id_crew`),
  CONSTRAINT `airplane_crew_ibfk_1` FOREIGN KEY (`id_airplane`) REFERENCES `airplane` (`id_airplane`),
  CONSTRAINT `airplane_crew_ibfk_2` FOREIGN KEY (`id_crew`) REFERENCES `crew_member` (`id_crew`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane_crew`
--

LOCK TABLES `airplane_crew` WRITE;
/*!40000 ALTER TABLE `airplane_crew` DISABLE KEYS */;
INSERT INTO `airplane_crew` VALUES (1,1,1,'2023-11-01','Captain',1),(2,1,2,'2023-11-01','First Officer',1),(3,1,15,'2023-11-01','Flight Attendant',1),(4,2,3,'2023-11-01','Captain',1),(5,2,4,'2023-11-01','First Officer',1),(6,2,14,'2023-11-01','Flight Attendant',1),(7,2,13,'2023-11-01','Flight Attendant',1),(8,3,5,'2023-11-01','Captain',1),(9,3,6,'2023-11-01','First Officer',1),(10,3,12,'2023-11-01','Flight Attendant',1),(11,4,7,'2023-11-01','Captain',1),(12,4,8,'2023-11-01','First Officer',1),(13,4,11,'2023-11-01','Flight Attendant',1),(14,4,10,'2023-11-01','Flight Attendant',1),(15,5,9,'2023-11-01','Captain',1),(16,5,1,'2023-11-01','First Officer',1),(17,5,2,'2023-11-01','Flight Attendant',1),(18,5,3,'2023-11-01','Flight Attendant',1),(19,6,4,'2023-11-01','Captain',1),(20,6,5,'2023-11-01','First Officer',1),(21,6,6,'2023-11-01','Flight Attendant',1),(22,7,7,'2023-11-01','Captain',1),(23,7,8,'2023-11-01','First Officer',1),(24,7,9,'2023-11-01','Flight Attendant',1),(25,8,10,'2023-11-01','Captain',1),(26,8,11,'2023-11-01','First Officer',1),(27,8,12,'2023-11-01','Flight Attendant',1),(28,8,13,'2023-11-01','Flight Attendant',1),(29,9,14,'2023-11-01','Captain',1),(30,9,15,'2023-11-01','First Officer',1);
/*!40000 ALTER TABLE `airplane_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id_airport` int NOT NULL AUTO_INCREMENT,
  `airport_code` varchar(3) NOT NULL,
  `airport_name` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `number_of_terminals` int NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_airport`),
  UNIQUE KEY `airport_code` (`airport_code`),
  CONSTRAINT `airport_chk_1` CHECK ((`number_of_terminals` > 0)),
  CONSTRAINT `airport_chk_2` CHECK (((`contact_phone` is null) or (regexp_like(`contact_phone`,_utf8mb4'^\\+[0-9]{7,15}$') and (not((`contact_phone` like _utf8mb4'%[^0-9+]%')))))),
  CONSTRAINT `airport_chk_3` CHECK (((`contact_email` is null) or (regexp_like(`contact_email`,_utf8mb4'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') and (`contact_email` like _utf8mb4'%@%.%') and (not((`contact_email` like _utf8mb4'%..%'))))))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'JFK','John F. Kennedy International Airport','New York','United States',6,'+12124444444','info@jfkairport.com'),(2,'LAX','Los Angeles International Airport','Los Angeles','United States',8,'+13106464000','contact@lax.org'),(3,'LHR','Heathrow Airport','London','United Kingdom',5,'+442087599000','customer.services@heathrow.com'),(4,'DXB','Dubai International Airport','Dubai','United Arab Emirates',3,'+97142245555','feedback@dubaiairports.ae'),(5,'HND','Haneda Airport','Tokyo','Japan',3,'+81357578311','contact@tokyo-airport-bldg.co.jp'),(6,'CDG','Charles de Gaulle Airport','Paris','France',3,'+33148622222','relation.clients@adp.fr'),(7,'SYD','Sydney Kingsford Smith Airport','Sydney','Australia',3,'+61296679111','feedback@sydneyairport.com.au'),(8,'PEK','Beijing Capital International Airport','Beijing','China',3,'+861096100','customerservice@bcia.com.cn'),(9,'FRA','Frankfurt Airport','Frankfurt','Germany',2,'+49696900','info@fraport.de'),(10,'AMS','Amsterdam Airport Schiphol','Amsterdam','Netherlands',1,'+31207948000','info@schiphol.nl');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport_staff`
--

DROP TABLE IF EXISTS `airport_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport_staff` (
  `id_staff` int NOT NULL AUTO_INCREMENT,
  `id_airport` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `position` enum('Security','Administration','Ground Staff','Manager','Maintenance') NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_staff`),
  KEY `id_airport` (`id_airport`),
  CONSTRAINT `airport_staff_ibfk_1` FOREIGN KEY (`id_airport`) REFERENCES `airport` (`id_airport`),
  CONSTRAINT `airport_staff_chk_1` CHECK (((`contact_phone` is null) or (regexp_like(`contact_phone`,_utf8mb4'^\\+[0-9]{7,15}$') and (not((`contact_phone` like _utf8mb4'%[^0-9+]%')))))),
  CONSTRAINT `airport_staff_chk_2` CHECK (((`contact_email` is null) or (regexp_like(`contact_email`,_utf8mb4'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') and (`contact_email` like _utf8mb4'%@%.%') and (not((`contact_email` like _utf8mb4'%..%'))))))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport_staff`
--

LOCK TABLES `airport_staff` WRITE;
/*!40000 ALTER TABLE `airport_staff` DISABLE KEYS */;
INSERT INTO `airport_staff` VALUES (1,1,'William','Johnson','1980-05-12','Security','+12125551111','w.johnson@jfk.com'),(2,1,'Emily','Davis','1985-08-23','Ground Staff','+12125552222','e.davis@jfk.com'),(3,1,'Richard','Miller','1975-11-15','Manager','+12125553333','r.miller@jfk.com'),(4,2,'Patricia','Wilson','1982-03-18','Security','+13105551111','p.wilson@lax.org'),(5,2,'Daniel','Moore','1988-07-29','Ground Staff','+13105552222','d.moore@lax.org'),(6,2,'Jennifer','Taylor','1978-01-05','Administration','+13105553333','j.taylor@lax.org'),(7,3,'Charles','Anderson','1983-09-20','Security','+44205551111','c.anderson@lhr.com'),(8,3,'Jessica','Thomas','1990-04-12','Ground Staff','+44205552222','j.thomas@lhr.com'),(9,3,'Matthew','Jackson','1976-12-08','Maintenance','+44205553333','m.jackson@lhr.com'),(10,4,'Elizabeth','White','1981-06-25','Security','+971501111111','e.white@dxb.ae'),(11,4,'Christopher','Harris','1987-02-14','Ground Staff','+971502222222','c.harris@dxb.ae'),(12,4,'Amanda','Martin','1979-10-30','Manager','+971503333333','a.martin@dxb.ae'),(13,5,'Joshua','Thompson','1984-08-17','Security','+81311112222','j.thompson@hnd.jp'),(14,5,'Sarah','Garcia','1991-05-22','Ground Staff','+81322223333','s.garcia@hnd.jp'),(15,5,'David','Martinez','1977-11-11','Administration','+81333334444','d.martinez@hnd.jp'),(16,6,'Ashley','Robinson','1986-07-19','Security','+33111112222','a.robinson@cdg.fr'),(17,6,'James','Clark','1992-03-25','Ground Staff','+33122223333','j.clark@cdg.fr'),(18,6,'Nicole','Rodriguez','1980-09-15','Maintenance','+33133334444','n.rodriguez@cdg.fr'),(19,7,'Andrew','Lewis','1985-04-28','Security','+61211112222','a.lewis@syd.com.au'),(20,7,'Megan','Lee','1993-01-08','Ground Staff','+61222223333','m.lee@syd.com.au'),(21,7,'Ryan','Walker','1978-12-20','Manager','+61233334444','r.walker@syd.com.au'),(22,8,'Lauren','Hall','1989-10-05','Security','+861011112222','l.hall@pek.cn'),(23,8,'Kevin','Allen','1983-06-15','Ground Staff','+861022223333','k.allen@pek.cn'),(24,8,'Stephanie','Young','1979-02-28','Administration','+861033334444','s.young@pek.cn'),(25,9,'Brandon','Hernandez','1987-09-12','Security','+496911112222','b.hernandez@fra.de'),(26,9,'Rachel','King','1994-07-18','Ground Staff','+496922223333','r.king@fra.de'),(27,9,'Justin','Wright','1981-03-30','Maintenance','+496933334444','j.wright@fra.de'),(28,10,'Kayla','Lopez','1990-12-10','Security','+312011112222','k.lopez@ams.nl'),(29,10,'Tyler','Hill','1984-05-22','Ground Staff','+312022223333','t.hill@ams.nl'),(30,10,'Hannah','Scott','1977-08-15','Manager','+312033334444','h.scott@ams.nl');
/*!40000 ALTER TABLE `airport_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baggage` (
  `id_baggage` int NOT NULL AUTO_INCREMENT,
  `id_passenger` int NOT NULL,
  `id_flight` int NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `tag_number` varchar(20) NOT NULL,
  `status` enum('Checked','Loaded','Transferred','Arrived','Lost') DEFAULT 'Checked',
  `baggage_type` enum('Carry-on','Checked') NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_baggage`),
  UNIQUE KEY `tag_number` (`tag_number`),
  KEY `id_passenger` (`id_passenger`),
  KEY `id_flight` (`id_flight`),
  CONSTRAINT `baggage_ibfk_1` FOREIGN KEY (`id_passenger`) REFERENCES `passenger` (`id_passenger`),
  CONSTRAINT `baggage_ibfk_2` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`),
  CONSTRAINT `baggage_chk_1` CHECK (((`weight` > 0) and (`weight` <= 50)))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baggage`
--

LOCK TABLES `baggage` WRITE;
/*!40000 ALTER TABLE `baggage` DISABLE KEYS */;
INSERT INTO `baggage` VALUES (22,1,52,23.50,'DL101001','Arrived','Checked','Black'),(23,1,52,8.00,'DL101002','Arrived','Carry-on','Red'),(24,2,52,18.00,'DL101003','Arrived','Checked','Blue'),(25,3,52,25.00,'DL101004','Arrived','Checked','Green'),(26,4,53,30.00,'DL202001','Checked','Checked','Black'),(27,4,53,7.50,'DL202002','Checked','Carry-on','Silver'),(28,5,53,22.00,'DL202003','Checked','Checked','Brown'),(29,6,54,19.50,'AA303001','Checked','Checked','Blue'),(30,6,54,6.00,'AA303002','Checked','Carry-on','Black'),(31,7,54,17.00,'AA303003','Checked','Checked','Red'),(32,8,54,24.00,'AA303004','Checked','Checked','Green'),(33,9,55,28.00,'AA404001','Checked','Checked','Black'),(34,9,55,9.00,'AA404002','Checked','Carry-on','Silver'),(35,10,55,20.50,'AA404003','Checked','Checked','Blue'),(36,11,56,32.00,'EK505001','Loaded','Checked','Black'),(37,11,56,10.00,'EK505002','Loaded','Carry-on','Gold'),(38,12,56,26.00,'EK505003','Loaded','Checked','Brown'),(39,13,57,21.00,'EK606001','Checked','Checked','Red'),(40,13,57,7.00,'EK606002','Checked','Carry-on','Black'),(41,14,57,18.50,'EK606003','Checked','Checked','Blue'),(42,15,58,23.00,'LH707001','Checked','Checked','Green');
/*!40000 ALTER TABLE `baggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_member`
--

DROP TABLE IF EXISTS `crew_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_member` (
  `id_crew` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `license_number` varchar(20) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(200) DEFAULT NULL,
  `position` enum('Pilot','Co-Pilot','Flight Attendant','Captain','First Officer') NOT NULL,
  PRIMARY KEY (`id_crew`),
  UNIQUE KEY `license_number` (`license_number`),
  CONSTRAINT `crew_member_chk_1` CHECK (((`contact_phone` is null) or (regexp_like(`contact_phone`,_utf8mb4'^\\+[0-9]{7,15}$') and (not((`contact_phone` like _utf8mb4'%[^0-9+]%')))))),
  CONSTRAINT `crew_member_chk_2` CHECK (((`contact_email` is null) or (regexp_like(`contact_email`,_utf8mb4'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') and (`contact_email` like _utf8mb4'%@%.%') and (not((`contact_email` like _utf8mb4'%..%'))))))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_member`
--

LOCK TABLES `crew_member` WRITE;
/*!40000 ALTER TABLE `crew_member` DISABLE KEYS */;
INSERT INTO `crew_member` VALUES (1,'Robert','Taylor','1975-03-12','PIL123456','+12025554321','r.taylor@airline.com','Captain'),(2,'Sarah','Williams','1980-07-25','PIL234567','+12025554322','s.williams@airline.com','First Officer'),(3,'David','Lee','1982-11-08','PIL345678','+12025554323','d.lee@airline.com','Captain'),(4,'Jennifer','Clark','1985-05-30','PIL456789','+12025554324','j.clark@airline.com','First Officer'),(5,'Thomas','Rodriguez','1978-09-17','PIL567890','+12025554325','t.rodriguez@airline.com','Captain'),(6,'Lisa','Martinez','1983-02-14','PIL678901','+12025554326','l.martinez@airline.com','First Officer'),(7,'Christopher','Hernandez','1970-12-05','PIL789012','+12025554327','c.hernandez@airline.com','Captain'),(8,'Amanda','Young','1987-04-22','PIL890123','+12025554328','a.young@airline.com','First Officer'),(9,'Daniel','King','1973-08-19','PIL901234','+12025554329','d.king@airline.com','Captain'),(10,'Michelle','Wright','1984-01-31','PIL012345','+12025554330','m.wright@airline.com','First Officer'),(11,'Kevin','Lopez','1976-06-27','PIL123450','+12025554331','k.lopez@airline.com','Captain'),(12,'Rachel','Hill','1981-10-11','PIL234561','+12025554332','r.hill@airline.com','First Officer'),(13,'Jason','Scott','1979-03-24','PIL345672','+12025554333','j.scott@airline.com','Captain'),(14,'Melissa','Green','1986-07-08','PIL456783','+12025554334','m.green@airline.com','First Officer'),(15,'Steven','Adams','1974-05-16','PIL567894','+12025554335','s.adams@airline.com','Captain');
/*!40000 ALTER TABLE `crew_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `id_flight` int NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(6) NOT NULL,
  `id_departure_gate` int NOT NULL,
  `id_arrival_gate` int NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `departure_airport` varchar(3) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `id_airplane` int NOT NULL,
  `status` enum('Scheduled','Boarding','Departed','In Air','Landed','Cancelled','Delayed') DEFAULT 'Scheduled',
  `actual_departure_time` datetime DEFAULT NULL,
  `actual_arrival_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_flight`),
  UNIQUE KEY `flight_number` (`flight_number`,`departure_time`),
  KEY `id_airplane` (`id_airplane`),
  KEY `id_departure_gate` (`id_departure_gate`),
  KEY `id_arrival_gate` (`id_arrival_gate`),
  KEY `departure_airport` (`departure_airport`),
  KEY `arrival_airport` (`arrival_airport`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`id_airplane`) REFERENCES `airplane` (`id_airplane`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`id_departure_gate`) REFERENCES `gate` (`id_gate`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`id_arrival_gate`) REFERENCES `gate` (`id_gate`),
  CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`departure_airport`) REFERENCES `airport` (`airport_code`),
  CONSTRAINT `flight_ibfk_5` FOREIGN KEY (`arrival_airport`) REFERENCES `airport` (`airport_code`),
  CONSTRAINT `chk_flight_number_format` CHECK (regexp_like(`flight_number`,_utf8mb4'^[A-Za-z]{2,3}[0-9]{1,4}$'))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (41,'DL101',1,4,'2023-12-01 08:00:00','2023-12-01 11:00:00','JFK','LAX',1,'Landed','2023-12-01 08:05:00','2023-12-01 11:10:00'),(42,'DL202',4,10,'2023-12-01 14:00:00','2023-12-01 22:00:00','LAX','DXB',2,'Scheduled',NULL,NULL),(43,'AA303',3,7,'2023-12-02 09:30:00','2023-12-02 16:30:00','JFK','LHR',3,'Boarding',NULL,NULL),(44,'AA404',7,2,'2023-12-03 11:00:00','2023-12-03 14:30:00','LHR','LAX',4,'Scheduled',NULL,NULL),(45,'EK505',10,13,'2023-12-01 23:00:00','2023-12-02 10:00:00','DXB','HND',5,'In Air','2023-12-01 23:15:00',NULL),(46,'EK606',13,16,'2023-12-03 12:00:00','2023-12-03 19:00:00','HND','CDG',6,'Scheduled',NULL,NULL),(47,'LH707',19,22,'2023-12-02 07:00:00','2023-12-02 09:30:00','FRA','AMS',7,'Cancelled',NULL,NULL),(48,'LH808',22,25,'2023-12-04 15:00:00','2023-12-04 18:00:00','AMS','FRA',8,'Scheduled',NULL,NULL),(49,'QR909',16,19,'2023-12-01 10:00:00','2023-12-01 16:00:00','CDG','FRA',9,'Departed','2023-12-01 10:20:00',NULL),(50,'QR010',25,28,'2023-12-05 08:00:00','2023-12-05 20:00:00','FRA','SYD',10,'Scheduled',NULL,NULL),(51,'BA111',7,1,'2023-12-02 13:00:00','2023-12-02 18:00:00','LHR','JFK',11,'Scheduled',NULL,NULL),(52,'BA212',28,31,'2023-12-03 09:00:00','2023-12-03 11:00:00','SYD','PEK',12,'Delayed',NULL,NULL),(53,'AF313',16,4,'2023-12-04 16:00:00','2023-12-04 19:00:00','CDG','LAX',13,'Scheduled',NULL,NULL),(54,'AF414',31,34,'2023-12-05 14:00:00','2023-12-05 17:00:00','PEK','HND',14,'Scheduled',NULL,NULL),(55,'JL515',13,16,'2023-12-06 11:00:00','2023-12-06 14:00:00','HND','CDG',15,'Scheduled',NULL,NULL),(56,'QF616',34,37,'2023-12-04 10:00:00','2023-12-04 12:30:00','SYD','PEK',1,'Scheduled',NULL,NULL),(57,'SQ717',37,40,'2023-12-05 09:00:00','2023-12-05 15:00:00','PEK','AMS',2,'Scheduled',NULL,NULL),(58,'SQ818',40,1,'2023-12-06 17:00:00','2023-12-06 20:00:00','AMS','JFK',3,'Scheduled',NULL,NULL),(59,'SQ919',4,7,'2023-12-07 08:00:00','2023-12-07 11:00:00','LAX','LHR',4,'Scheduled',NULL,NULL),(60,'SQ020',10,13,'2023-12-08 22:00:00','2023-12-09 08:00:00','DXB','HND',5,'Scheduled',NULL,NULL);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gate`
--

DROP TABLE IF EXISTS `gate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gate` (
  `id_gate` int NOT NULL AUTO_INCREMENT,
  `gate_number` varchar(10) NOT NULL,
  `id_airport` int NOT NULL,
  `terminal` varchar(10) NOT NULL,
  `status` enum('Available','Occupied','Maintenance') DEFAULT 'Available',
  PRIMARY KEY (`id_gate`),
  UNIQUE KEY `id_airport` (`id_airport`,`gate_number`,`terminal`),
  CONSTRAINT `gate_ibfk_1` FOREIGN KEY (`id_airport`) REFERENCES `airport` (`id_airport`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gate`
--

LOCK TABLES `gate` WRITE;
/*!40000 ALTER TABLE `gate` DISABLE KEYS */;
INSERT INTO `gate` VALUES (1,'A1',1,'T1','Available'),(2,'B2',1,'T1','Occupied'),(3,'C3',1,'T2','Available'),(4,'12',2,'TBIT','Available'),(5,'34A',2,'T3','Maintenance'),(6,'51B',2,'T5','Available'),(7,'A10',3,'T5','Available'),(8,'B15',3,'T5','Occupied'),(9,'C22',3,'T3','Available'),(10,'F12',4,'T3','Available'),(11,'G45',4,'T1','Available'),(12,'H67',4,'T1','Occupied'),(13,'21',5,'T1','Available'),(14,'35',5,'T2','Available'),(15,'48',5,'T3','Maintenance'),(16,'K12',6,'T2E','Available'),(17,'L34',6,'T2F','Available'),(18,'M56',6,'T1','Occupied'),(19,'31',7,'T1','Available'),(20,'42',7,'T2','Available'),(21,'58',7,'T3','Available'),(22,'C10',8,'T3','Available'),(23,'D20',8,'T2','Occupied'),(24,'E35',8,'T1','Available'),(25,'B12',9,'T1','Available'),(26,'C24',9,'T2','Available'),(27,'D36',9,'T1','Maintenance'),(28,'D12',10,'T1','Available'),(29,'E24',10,'T2','Occupied'),(30,'F36',10,'T3','Available'),(31,'G31',8,'T2','Available'),(34,'G34',8,'T3','Available'),(37,'G37',7,'T1','Available'),(40,'G40',10,'T2','Available');
/*!40000 ALTER TABLE `gate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_record`
--

DROP TABLE IF EXISTS `maintenance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_record` (
  `id_record` int NOT NULL AUTO_INCREMENT,
  `id_airplane` int NOT NULL,
  `last_maintenance_date` date NOT NULL,
  `next_maintenance_date` date NOT NULL,
  `maintenance_notes` text,
  `total_maintenance_hours` decimal(10,2) DEFAULT '0.00',
  `maintenance_type` enum('Routine Inspection','Minor Repair','Major Overhaul','Engine Service','Avionics Update','Structural Repair','Safety System Check') NOT NULL,
  PRIMARY KEY (`id_record`),
  KEY `id_airplane` (`id_airplane`),
  CONSTRAINT `maintenance_record_ibfk_1` FOREIGN KEY (`id_airplane`) REFERENCES `airplane` (`id_airplane`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_record`
--

LOCK TABLES `maintenance_record` WRITE;
/*!40000 ALTER TABLE `maintenance_record` DISABLE KEYS */;
INSERT INTO `maintenance_record` VALUES (1,1,'2023-11-15','2024-02-15','Routine inspection and oil change',4.50,'Routine Inspection'),(2,2,'2023-11-20','2024-02-20','Complete engine check',8.00,'Engine Service'),(3,3,'2023-11-10','2024-01-10','Avionics software update',3.00,'Avionics Update'),(4,4,'2023-11-25','2024-02-25','Minor repair to landing gear',6.50,'Minor Repair'),(5,5,'2023-11-05','2024-05-05','Major overhaul completed',48.00,'Major Overhaul'),(6,6,'2023-11-18','2024-01-18','Safety systems checked',5.00,'Safety System Check'),(7,7,'2023-11-30','2023-12-15','Structural repair in progress',12.00,'Structural Repair'),(8,8,'2023-11-22','2024-02-22','Routine inspection',4.00,'Routine Inspection'),(9,9,'2023-11-12','2024-01-12','Engine service',7.50,'Engine Service'),(10,10,'2023-11-08','2024-02-08','Avionics update',3.50,'Avionics Update'),(11,11,'2023-11-28','2024-02-28','Minor repairs',5.50,'Minor Repair'),(12,12,'2023-11-14','2024-05-14','Major overhaul scheduled',0.00,'Major Overhaul'),(13,13,'2023-11-17','2024-01-17','Safety check completed',4.50,'Safety System Check'),(14,14,'2023-11-23','2024-02-23','Routine inspection',3.50,'Routine Inspection'),(15,15,'2023-11-19','2024-01-19','Engine diagnostics',6.00,'Engine Service');
/*!40000 ALTER TABLE `maintenance_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id_passenger` int NOT NULL AUTO_INCREMENT,
  `passport_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_passenger`),
  UNIQUE KEY `passport_number` (`passport_number`),
  CONSTRAINT `passenger_chk_1` CHECK (((`contact_phone` is null) or (regexp_like(`contact_phone`,_utf8mb4'^\\+[0-9]{7,15}$') and (not((`contact_phone` like _utf8mb4'%[^0-9+]%')))))),
  CONSTRAINT `passenger_chk_2` CHECK (((`contact_email` is null) or (regexp_like(`contact_email`,_utf8mb4'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') and (`contact_email` like _utf8mb4'%@%.%') and (not((`contact_email` like _utf8mb4'%..%'))))))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'P12345678','John','Smith','1985-05-15','American','+12025551234','john.smith@email.com'),(2,'A98765432','Emma','Johnson','1990-08-22','Australian','+61400111222','emma.j@email.com'),(3,'UK8765432','Michael','Brown','1978-03-10','British','+442071234567','m.brown@email.co.uk'),(4,'D34567890','Sophia','Müller','1995-11-25','German','+491701234567','s.mueller@email.de'),(5,'F23456789','Lucas','Martin','1982-07-18','French','+33612345678','l.martin@email.fr'),(6,'J12345678','Yuki','Tanaka','1992-09-30','Japanese','+819012345678','y.tanaka@email.jp'),(7,'U7654321','Fatima','Al-Mansoori','1988-12-05','Emirati','+971501234567','f.almansoori@email.ae'),(8,'C23456789','Wei','Chen','1980-04-12','Chinese','+8613812345678','w.chen@email.cn'),(9,'S34567890','Olivia','Davis','1993-06-20','Singaporean','+6581234567','o.davis@email.sg'),(10,'Q12345678','James','Wilson','1975-02-28','Canadian','+14165551234','j.wilson@email.ca'),(11,'R23456789','Elena','Petrova','1987-10-15','Russian','+79161234567','e.petrova@email.ru'),(12,'I34567890','Marco','Rossi','1991-01-22','Italian','+393331234567','m.rossi@email.it'),(13,'B12345678','Mohamed','Khan','1983-07-08','Bangladeshi','+8801812345678','m.khan@email.bd'),(14,'M23456789','Aisha','Okafor','1994-04-17','Nigerian','+2348012345678','a.okafor@email.ng'),(15,'K34567890','Jin','Kim','1989-09-05','South Korean','+821012345678','j.kim@email.kr'),(16,'US12345678','John','Doe','1985-07-20','American','+12025551234','john.doe@example.com');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id_ticket` int NOT NULL AUTO_INCREMENT,
  `id_flight` int NOT NULL,
  `id_passenger` int NOT NULL,
  `class` enum('Economy','Premium Economy','Business','First') NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ticket_status` enum('Confirmed','Cancelled','Used') DEFAULT 'Confirmed',
  PRIMARY KEY (`id_ticket`),
  UNIQUE KEY `id_flight` (`id_flight`,`seat_number`),
  KEY `id_passenger` (`id_passenger`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_passenger`) REFERENCES `passenger` (`id_passenger`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_flight`) REFERENCES `flight` (`id_flight`),
  CONSTRAINT `ticket_chk_1` CHECK (regexp_like(`seat_number`,_utf8mb4'^([1-9]|[1-9][0-9])([A-Ka-k]{1,2})$'))
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (31,52,1,'Business','1A',1200.00,'Used'),(32,52,2,'Economy','10B',400.00,'Used'),(33,52,3,'Premium Economy','5C',800.00,'Used'),(34,53,4,'First','2A',2500.00,'Confirmed'),(35,53,5,'Business','3B',1800.00,'Confirmed'),(36,54,6,'Economy','15D',350.00,'Confirmed'),(37,54,7,'Economy','15E',350.00,'Confirmed'),(38,54,8,'Premium Economy','7F',750.00,'Confirmed'),(39,55,9,'Business','4A',1600.00,'Confirmed'),(40,55,10,'Economy','12C',450.00,'Confirmed'),(41,56,11,'First','1A',3000.00,'Confirmed'),(42,56,12,'Business','3D',2200.00,'Confirmed'),(43,57,13,'Premium Economy','8F',900.00,'Confirmed'),(44,57,14,'Economy','20A',500.00,'Confirmed'),(45,58,15,'Business','2B',1400.00,'Cancelled'),(46,59,1,'Economy','14C',300.00,'Confirmed'),(47,59,2,'Economy','14D',300.00,'Confirmed'),(48,60,3,'Premium Economy','6E',850.00,'Confirmed'),(49,60,4,'Economy','16F',400.00,'Confirmed');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-11 12:41:08
