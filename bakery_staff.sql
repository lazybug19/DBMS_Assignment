-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bakery
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS staff;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE staff
(
  staff_id int NOT NULL,
  staff_name varchar(200) DEFAULT NULL,
  work_hours int DEFAULT NULL,
  staff_phone varchar(200) DEFAULT NULL,
  profession varchar(200) DEFAULT NULL,
  PRIMARY KEY (staff_id)
);
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO staff
VALUES
  (1, 'John Baker', 40, '5551234567', 'baker');
INSERT INTO staff
VALUES
  (2, 'Jane Delivery', 35, '5559876543', 'delivery');
INSERT INTO staff
VALUES
  (3, 'Bob Support', 38, '5555555555', 'support');
INSERT INTO staff
VALUES
  (4, 'Alice Baker', 42, '5557891234', 'baker');
INSERT INTO staff
VALUES
  (5, 'Eve Delivery', 30, '5554443333', 'delivery');
INSERT INTO staff
VALUES
  (6, 'Charlie Support', 37, '5552221111', 'support');
INSERT INTO staff
VALUES
  (7, 'Grace Baker', 45, '5553334444', 'baker');
INSERT INTO staff
VALUES
  (8, 'David Delivery', 33, '5557778888', 'delivery');
INSERT INTO staff
VALUES
  (9, 'Emily Support', 40, '5559990000', 'support');
INSERT INTO staff
VALUES
  (10, 'Frank Baker', 39, '5556669999', 'baker');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01 11:47:02
