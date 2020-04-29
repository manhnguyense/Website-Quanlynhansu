-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: job
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (88),(88);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `Idmember` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sex` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Idmember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Hang','AG','0943043284','manhnguyen130399@gmail.com','Female','hangag',''),(3,'manh nguyen','BT','0931238481','manhnguyen130399@gmail.com','Male','manhnguyen','c4ca4238a0b923820dcc509a6f75849b'),(4,'manh nguyen 1','BT','0931238481','manhnguyen130399@gmail.com','Male','manhnguyen1','6512bd43d9caa6e02c990b0a82652dca'),(5,'Jeans','US',NULL,NULL,'Femail',NULL,NULL),(6,'Tris','UK',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `Idtask` int(11) NOT NULL,
  `Title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Duedatetime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Duedatehour` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0',
  `Duedateminute` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0',
  `State` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DueNotify` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0',
  `DueNotifyHour` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Idtask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (2,'Job','I don\'t know this ','04/29/2020','11','08','Success',NULL,NULL),(4,'Taks1','Let go','04/15/2020','21','15','  Working','54','20'),(5,'Task2','4','04/21/2020','21','18','Notaccept','0','21'),(7,'ACR','adasd','04/07/2020/','50','16','  Notaccept','0',NULL),(8,'ERP','ads','04/27/2020','12','47','Notaccept','45','11'),(10,'CRM','adsd','04/27/2020','08','59','Notaccept','0',NULL),(12,'ACE','312','04/27/2020','08','32','Notaccept','0',NULL),(13,'Final Task 21/4','final','04/21/2020','17','1','Notaccept','0',NULL),(18,'TaskTonigth','xfhdjak','04/21/2020','18','4','Notaccept','0',NULL),(19,'ODOO','e2','04/01/2020','18','5','Notaccept','0',NULL),(20,'Super test','Test final','04/09/2020','18','8','Notaccept','0',NULL),(21,'Bug','ad','03/31/2020','20','12','Notaccept','0',NULL),(22,'R laguage','','04/08/2020','07','58','Notaccept','0',NULL),(29,'Taks4','Let go','04/15/2020','15','15','Notaccept','0',NULL),(30,'Taks4','Let go','04/15/2020','15','15','Notaccept','0',NULL),(31,'123','rewr','04/07/2020','17','17','Notaccept','0',NULL),(37,'axxx','','04/01/2020','17','51','Notaccept','0',NULL),(39,'test','qưe','04/08/2020','16','25','Notaccept','0',NULL),(46,'TASK ACCE','aAd','04/08/2020','57','16','Working','0',NULL),(51,'manh','213','04/01/2020','19','5','Working','0',NULL),(52,'Title','adAD','04/08/2020','17','25','Notaccept','0',NULL),(53,'Title','adAD','04/08/2020','17','25','Notaccept','0',NULL),(56,'GET','','04/01/2020','19','42','Notaccept','0',NULL),(57,'GET','','04/01/2020','19','42','Notaccept','0',NULL),(58,'TASK','eqwe','04/22/2020','22','43','Notaccept','0',NULL),(64,'Job1','every bug','04/03/2020','20','21','Notaccept','0',NULL),(65,'Tuseq','','04/23/2020','20','46','Notaccept','0',NULL),(70,'PUCMS','importtant task','04/27/2020','10','03','Notaccept',NULL,NULL),(71,'PUC','ax1','04/27/2020','10','02','Notaccept',NULL,NULL),(72,'PUIJCL','123','04/27/2020','10','03','Notaccept','8',NULL),(73,'Yassou','','04/27/2020','10','02','Notaccept','7',NULL),(74,'Takssx','','04/27/2020','00','00','Notaccept',NULL,NULL),(75,'LE','','04/27/2020','10','00','Notaccept',NULL,NULL),(76,'AXC','','04/27/2020','00','03','Notaccept','08',NULL),(77,'AXC1','','04/27/2020','10','01','Notaccept','06',NULL),(78,'AXC@','','04/27/2020','10','02','Notaccept','22',NULL),(79,'AWS','','04/27/2020','09','05','Notaccept','',NULL),(80,'JELASTIC','','04/27/2020','09','00','Notaccept','49',NULL),(81,'AXCAD','','04/27/2020','11','00','Notaccept','50','10'),(82,'Final t','','04/27/2020','13','46','Notaccept','34','13'),(83,'ROPCI','','04/27/2020','07','47','Notaccept','07','07'),(84,'ADX!','','04/27/2020','06','49','Notaccept','37','06');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_detail`
--

DROP TABLE IF EXISTS `task_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_detail` (
  `Id` int(11) NOT NULL,
  `Idtask` int(11) DEFAULT NULL,
  `Document` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `State` tinyint(4) DEFAULT NULL,
  `Taskname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PK_Tasks_idx` (`Idtask`),
  CONSTRAINT `FKrxm464uwaolgrewqicjqo2d81` FOREIGN KEY (`Idtask`) REFERENCES `task` (`Idtask`),
  CONSTRAINT `PK_Tasks` FOREIGN KEY (`Idtask`) REFERENCES `task` (`Idtask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_detail`
--

LOCK TABLES `task_detail` WRITE;
/*!40000 ALTER TABLE `task_detail` DISABLE KEYS */;
INSERT INTO `task_detail` VALUES (1,2,'txt',1,'HMLT'),(2,2,'image',1,'CSS'),(3,4,'pic',1,'JS'),(4,4,'pic',1,'Boostrap'),(5,4,'pic',1,'Jquery'),(85,2,'diemdanh.txt',0,'MySQL'),(86,7,'.Rhistory',1,'MariDB'),(87,2,'Workspace.sws',0,'MariDBBS2');
/*!40000 ALTER TABLE `task_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_member`
--

DROP TABLE IF EXISTS `task_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_member` (
  `Idtask` int(11) NOT NULL,
  `Idmember` int(11) NOT NULL,
  PRIMARY KEY (`Idtask`,`Idmember`),
  KEY `PK_members_idx` (`Idmember`),
  CONSTRAINT `FK7fve8rq0dvm14kj77wcjbk4mt` FOREIGN KEY (`Idmember`) REFERENCES `members` (`Idmember`),
  CONSTRAINT `FKo2q0c3wwrsbmx56uo04112hsi` FOREIGN KEY (`Idtask`) REFERENCES `task` (`Idtask`),
  CONSTRAINT `PK_members` FOREIGN KEY (`Idmember`) REFERENCES `members` (`Idmember`),
  CONSTRAINT `PK_task` FOREIGN KEY (`Idtask`) REFERENCES `task` (`Idtask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_member`
--

LOCK TABLES `task_member` WRITE;
/*!40000 ALTER TABLE `task_member` DISABLE KEYS */;
INSERT INTO `task_member` VALUES (5,1),(7,1),(8,1),(10,1),(12,1),(46,1),(51,1),(77,1),(78,1),(79,1),(80,1),(81,1),(2,3),(4,3),(5,3),(7,3),(82,3),(37,24),(53,24),(57,24),(31,25),(37,25),(39,25),(58,26),(39,27),(58,27),(64,27),(18,40),(53,40),(64,40),(82,69),(83,69),(84,69);
/*!40000 ALTER TABLE `task_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'job'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-29 10:27:53
