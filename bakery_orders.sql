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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE orders
(
  order_id int NOT NULL,
  customer_id int DEFAULT NULL,
  order_name varchar(200) DEFAULT NULL,
  order_price int DEFAULT NULL,
  order_status varchar(200) DEFAULT NULL,
  payment varchar(200) DEFAULT NULL,
  PRIMARY KEY (order_id)
);
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO orders
VALUES
  (111, 101, 'cake', 599, 'out for delivery', 'UPI')
;
INSERT INTO orders
VALUES
  (112, 102, 'cookies', 249, 'out for delivery', 'COD')
;
INSERT INTO orders
VALUES
  (113, 103, 'croissant', 299, 'delivered', 'Net Banking')
;
INSERT INTO orders
VALUES
  (114, 101, 'bread', 399, 'out for delivery', 'UPI')
;
INSERT INTO orders
VALUES
  (115, 105, 'cake', 699, 'being prepared', 'COD')
;
INSERT INTO orders
VALUES(116, 104, 'cookies', 199, 'delivered', 'Net Banking')
;
INSERT INTO orders
VALUES
  (117, 107, 'croissant', 249, 'out for delivery', 'UPI')
;
INSERT INTO orders
VALUES(118, 101, 'cookies', 249, 'being prepared', 'COD')
;
INSERT INTO orders
VALUES(119, 107, 'bread', 399, 'out for delivery', 'UPI')
;
INSERT INTO orders
VALUES(120, 106, 'cake', 699, 'being prepared', 'COD')
;
INSERT INTO orders
VALUES(121, 105, 'cookies', 249, 'being prepared', 'Net Banking');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
