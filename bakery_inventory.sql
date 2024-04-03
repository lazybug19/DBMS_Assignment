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
-- Table structure for table inventory
--

DROP TABLE IF EXISTS inventory;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE inventory
(
  inv_id int NOT NULL,
  inv_name varchar(200) DEFAULT NULL,
  inv_price int DEFAULT NULL,
  quantity int DEFAULT NULL,
  utility varchar(200) DEFAULT NULL,
  PRIMARY KEY (inv_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table inventory
--

LOCK TABLES inventory WRITE;
/*!40000 ALTER TABLE inventory DISABLE KEYS */;
INSERT INTO inventory
VALUES
  (1, 'wheat', 599, 100, 'bread');
INSERT INTO inventory
VALUES
  (2, 'sugar', 249, 200, 'cake');
INSERT INTO inventory
VALUES
  (3, 'chocolate', 399, 150, 'croissant');
INSERT INTO inventory
VALUES
  (4, 'nuts', 449, 120, 'cookies');
INSERT INTO inventory
VALUES
  (5, 'cream', 329, 180, 'bread');
INSERT INTO inventory
VALUES
  (6, 'wheat', 599, 90, 'cake');
INSERT INTO inventory
VALUES
  (7, 'sugar', 249, 220, 'croissant');
INSERT INTO inventory
VALUES
  (8, 'chocolate', 399, 160, 'cookies');
INSERT INTO inventory
VALUES
  (9, 'nuts', 449, 130, 'bread');
INSERT INTO inventory
VALUES
  (10, 'cream', 329, 210, 'cake');
/*!40000 ALTER TABLE inventory ENABLE KEYS */;
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
