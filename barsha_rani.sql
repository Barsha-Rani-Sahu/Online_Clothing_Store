-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: clothingstore
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admininfo`
--

DROP TABLE IF EXISTS `admininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admininfo` (
  `adminname` varchar(50) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admininfo`
--

LOCK TABLES `admininfo` WRITE;
/*!40000 ALTER TABLE `admininfo` DISABLE KEYS */;
INSERT INTO `admininfo` VALUES ('admin1','admin@123','admin@123gmail.com'),('admin2','admin@456','admin@456gmail.com'),('admin3','admin@789','admin@789gmail.com');
/*!40000 ALTER TABLE `admininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cart_view`
--

DROP TABLE IF EXISTS `cart_view`;
/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_view` AS SELECT 
 1 AS `clothingid`,
 1 AS `clothingname`,
 1 AS `price`,
 1 AS `image_url`,
 1 AS `qty`,
 1 AS `subtotal`,
 1 AS `username`,
 1 AS `cart_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Tops','Tops.png'),(2,'Jeans','Jeans.png'),(3,'Sarees','Sarees.png'),(4,'Dresses','Dresses.png'),(5,'Kurtis','Kurtis.png'),(6,'Kurta Sets','kurtaset.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cloth_cat_view`
--

DROP TABLE IF EXISTS `cloth_cat_view`;
/*!50001 DROP VIEW IF EXISTS `cloth_cat_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cloth_cat_view` AS SELECT 
 1 AS `clothingid`,
 1 AS `clothingname`,
 1 AS `price`,
 1 AS `description`,
 1 AS `image_url`,
 1 AS `categoryid`,
 1 AS `categoryname`,
 1 AS `quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clothing`
--

DROP TABLE IF EXISTS `clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothing` (
  `ClothingID` int NOT NULL AUTO_INCREMENT,
  `ClothingName` varchar(50) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Description` varchar(150) DEFAULT NULL,
  `Image_url` varchar(150) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClothingID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `clothing_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing`
--

LOCK TABLES `clothing` WRITE;
/*!40000 ALTER TABLE `clothing` DISABLE KEYS */;
INSERT INTO `clothing` VALUES (1,'Top',500,'Floral Print Top','images/Top1.jpeg',1,31),(2,'White Top',450,'Floral Print Square Neck Top','images/top2.jpeg',1,25),(3,'Striped Top',499,'Striped V-Neck Top','images/Top3.jpg',1,50),(4,'Casual Top',399,'Casual Regular Sleeves Top','images/Top4.webp',1,35),(5,'Crop Top',450,'Blue Cotton Solid Denim Crop Top','images/Top5.webp',1,20),(6,'Wide Leg Jeans',900,'Wide Leg Straight Fit Charcol Jeans','images/jeans1.jpg',2,17),(7,'Light Blue Jeans',899,'Light Blue High Rise Straight Fit Jeans','images/Jeans2.webp',2,20),(8,'Cargo jeans',999,'Wide Leg jeans Black Cargo','images/Jeans3.webp',2,15),(9,'Silk Saree',700,'Banarasi Soft Silk Saree','images/Saree1.jpeg',3,1),(10,'Light Green Saree',999,'Fashion Booms Banarasi Soft Silk Saree ','images/saree2.avif',3,13),(11,'Grey Saree',899,'Anchor Grey Tussar Saree','images/saree3.webp',3,10),(12,'Zari Saree',650,'Royal Silk Cotton Zari Saree Festive Wear','images/saree4.jpg',3,10),(13,'Red Zari Saree',999,'Enchanting Silk Zari Saree Festive Wear','images/saree5.jpg',3,10),(14,'Maxi Dress',700,'Estonished Printed Balloon Sleeves Smocked Maxi Dress','images/dress1.webp',4,5),(15,'Floral Dress',800,'Margaret Green Floral Maxi Dress ','images/dress2.webp',4,15),(16,'Blue Floral Dress',900,'Scoop Neck Maxi Dress Blue Floral','images/dresse3.jpg',4,20),(17,'V Neck Dress',900,'Women Spring Summer Floral V Neck Dress','images/dress4.jpg',4,10),(18,'Red Floral Dress',800,'Red Floral Print Maxi Dress','images/dress5.jpg',4,10),(19,'Chikankari Kurtii',400,'Chikankari Kurti for Women With Pocket ','images/kurtii1.webp',5,20),(20,'Printed Kurtii',300,'White Voile Printed Kurti','images/kurtii2.jpg',5,15),(21,'Lehariya Kurti',499,'Blue Lehariya Kurti','images/kurtii3.jpg',5,5),(22,'Floral Print Kurtii',500,' Floral Print Straight Kurti For Women','images/kurtii5.avif',5,10),(23,'Rayon Kurtii',400,'Rayon Floral Printed Straight Red Kurtii','images/kurti4.jpeg',5,10),(24,'Embroidered Kurta set',800,'Embroidered Straight Kurta Set with Dupatta ','images/kurtaset1.avif',6,20),(25,'Printed Kurta Set',900,'Women Block Printed Kurta set with Dupatta','images/kurtaset2.webp',6,20),(26,'kurta Set',900,'Printed kurta Set','images/kurtaset3.avif',6,10),(27,'Straight Kurta Set',1200,'Women Embroidered Straight Kurta Set with Dupatta ','images/kurata set4.avif',6,20),(28,'Black Kurta Set',900,' Mirror Work Black Kurta Set ','images/kurtaset5.webp',6,15),(29,'Blue Jeans',1100,'Denim Slim Women Blue Jeans ','images/jeans4.webp',2,20),(30,'Cargo Jeans',900,'women\'s distress cargo jeans','images/jeans5.webp',2,10);
/*!40000 ALTER TABLE `clothing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mycart`
--

DROP TABLE IF EXISTS `mycart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mycart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `clothingid` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `status` enum('cart','order') DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `clothingid` (`clothingid`),
  KEY `username` (`username`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `mycart_ibfk_1` FOREIGN KEY (`clothingid`) REFERENCES `clothing` (`ClothingID`),
  CONSTRAINT `mycart_ibfk_2` FOREIGN KEY (`username`) REFERENCES `register` (`username`),
  CONSTRAINT `mycart_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order_master` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mycart`
--

LOCK TABLES `mycart` WRITE;
/*!40000 ALTER TABLE `mycart` DISABLE KEYS */;
INSERT INTO `mycart` VALUES (1,2,2,'order','barsha',1),(3,9,2,'order','barsha',2),(4,14,3,'order','Geeta',3),(5,9,1,'cart','barsha',NULL);
/*!40000 ALTER TABLE `mycart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_master` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `date_of_order` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` VALUES (1,'2024-06-27',900,'barsha'),(2,'2024-06-27',1400,'barsha'),(3,'2024-06-27',2100,'Geeta');
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_view`
--

DROP TABLE IF EXISTS `order_view`;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_view` AS SELECT 
 1 AS `order_id`,
 1 AS `date_of_order`,
 1 AS `amount`,
 1 AS `username`,
 1 AS `ClothingID`,
 1 AS `ClothingName`,
 1 AS `Price`,
 1 AS `Image_url`,
 1 AS `qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `cardno` varchar(16) NOT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `expiry` varchar(10) DEFAULT NULL,
  `balance` float DEFAULT '10000',
  PRIMARY KEY (`cardno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('1001','111','12/2030',14400),('2002','222','12/2025',7900),('3001','333','12/2030',7700);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('','',''),('barsha','barsha2001','barshasahu873@gmail.com'),('Bicky','bicky123','bicky123@gamil.com'),('Geeta','geeta123','geeta123@gmail.com'),('Preeti','preeti123','preeti123@gmail.com');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cart_view`
--

/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_view` AS select `c`.`ClothingID` AS `clothingid`,`c`.`ClothingName` AS `clothingname`,`c`.`Price` AS `price`,`c`.`Image_url` AS `image_url`,`m`.`qty` AS `qty`,(`c`.`Price` * `m`.`qty`) AS `subtotal`,`m`.`username` AS `username`,`m`.`cart_id` AS `cart_id` from (`mycart` `m` join `clothing` `c` on(((`m`.`clothingid` = `c`.`ClothingID`) and (`m`.`status` = 'cart')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cloth_cat_view`
--

/*!50001 DROP VIEW IF EXISTS `cloth_cat_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cloth_cat_view` AS select `c`.`ClothingID` AS `clothingid`,`c`.`ClothingName` AS `clothingname`,`c`.`Price` AS `price`,`c`.`Description` AS `description`,`c`.`Image_url` AS `image_url`,`cat`.`CategoryID` AS `categoryid`,`cat`.`CategoryName` AS `categoryname`,`c`.`quantity` AS `quantity` from (`category` `cat` join `clothing` `c` on((`c`.`CategoryID` = `cat`.`CategoryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_view`
--

/*!50001 DROP VIEW IF EXISTS `order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_view` AS select `om`.`order_id` AS `order_id`,`om`.`date_of_order` AS `date_of_order`,`om`.`amount` AS `amount`,`om`.`username` AS `username`,`c`.`ClothingID` AS `ClothingID`,`c`.`ClothingName` AS `ClothingName`,`c`.`Price` AS `Price`,`c`.`Image_url` AS `Image_url`,`mc`.`qty` AS `qty` from ((`order_master` `om` join `mycart` `mc` on((`om`.`order_id` = `mc`.`order_id`))) join `clothing` `c` on((`mc`.`clothingid` = `c`.`ClothingID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-08 10:17:05
