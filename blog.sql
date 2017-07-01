-- MySQL dump 10.13  Distrib 5.7.13, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.13-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `browser_add`
--

DROP TABLE IF EXISTS `browser_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_add` (
  `logDate` varchar(60) NOT NULL,
  `browser` varchar(60) NOT NULL,
  `addCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_add`
--

LOCK TABLES `browser_add` WRITE;
/*!40000 ALTER TABLE `browser_add` DISABLE KEYS */;
INSERT INTO `browser_add` VALUES ('2017-06-19','Android browser','1'),('2017-06-19','Chrome','3'),('2017-06-19','Firefox','15'),('2017-06-19','IE','1'),('2017-06-20','Chrome','1'),('2017-06-20','Firefox','7'),('2017-06-23','Chrome','4'),('2017-06-23','Firefox','1');
/*!40000 ALTER TABLE `browser_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_pv`
--

DROP TABLE IF EXISTS `browser_pv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_pv` (
  `logDate` varchar(60) NOT NULL,
  `browser` varchar(60) NOT NULL,
  `pvCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_pv`
--

LOCK TABLES `browser_pv` WRITE;
/*!40000 ALTER TABLE `browser_pv` DISABLE KEYS */;
INSERT INTO `browser_pv` VALUES ('2017-06-19','Android browser','2'),('2017-06-19','Chrome','66'),('2017-06-19','Firefox','1325'),('2017-06-19','IE','82'),('2017-06-20','Chrome','344'),('2017-06-20','Firefox','1604'),('2017-06-20','IE','1'),('2017-06-21','Chrome','505'),('2017-06-21','Firefox','1954'),('2017-06-21','IE','10'),('2017-06-22','Chrome','965'),('2017-06-22','Firefox','716'),('2017-06-22','IE','28'),('2017-06-23','Chrome','1264'),('2017-06-23','Firefox','508'),('2017-06-23','IE','8');
/*!40000 ALTER TABLE `browser_pv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_visit`
--

DROP TABLE IF EXISTS `browser_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_visit` (
  `logDate` varchar(60) NOT NULL,
  `browser` varchar(60) NOT NULL,
  `addCount` varchar(60) DEFAULT NULL,
  `AllCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_visit`
--

LOCK TABLES `browser_visit` WRITE;
/*!40000 ALTER TABLE `browser_visit` DISABLE KEYS */;
INSERT INTO `browser_visit` VALUES ('2017-06-19','Android browser','1','1'),('2017-06-19','Chrome','4','4'),('2017-06-19','Firefox','15','15'),('2017-06-19','IE','3','3'),('2017-06-20','Chrome','1','5'),('2017-06-20','Firefox','15','30'),('2017-06-20','IE','1','4'),('2017-06-21','Chrome','5','10'),('2017-06-21','Firefox','7','37'),('2017-06-21','IE','1','5'),('2017-06-22','Chrome','7','17'),('2017-06-22','Firefox','7','44'),('2017-06-22','IE','1','6'),('2017-06-23','Chrome','8','25'),('2017-06-23','Firefox','7','51'),('2017-06-23','IE','1','7');
/*!40000 ALTER TABLE `browser_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browsermember_add`
--

DROP TABLE IF EXISTS `browsermember_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browsermember_add` (
  `logDate` varchar(60) NOT NULL,
  `browser` varchar(60) NOT NULL,
  `addCount` varchar(60) DEFAULT NULL,
  `AllCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsermember_add`
--

LOCK TABLES `browsermember_add` WRITE;
/*!40000 ALTER TABLE `browsermember_add` DISABLE KEYS */;
INSERT INTO `browsermember_add` VALUES ('2017-06-19','Chrome','12','12'),('2017-06-19','Firefox','65','65'),('2017-06-19','IE','7','7'),('2017-06-20','Chrome','1','13'),('2017-06-20','Firefox','221','286'),('2017-06-21','Chrome','15','28'),('2017-06-21','Firefox','169','455'),('2017-06-21','IE','1','8'),('2017-06-22','Chrome','17','45'),('2017-06-22','Firefox','65','520'),('2017-06-22','IE','3','11'),('2017-06-23','Chrome','30','75'),('2017-06-23','Firefox','50','570');
/*!40000 ALTER TABLE `browsermember_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browsermember_visit`
--

DROP TABLE IF EXISTS `browsermember_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browsermember_visit` (
  `logDate` varchar(60) NOT NULL,
  `browser` varchar(60) NOT NULL,
  `addCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsermember_visit`
--

LOCK TABLES `browsermember_visit` WRITE;
/*!40000 ALTER TABLE `browsermember_visit` DISABLE KEYS */;
INSERT INTO `browsermember_visit` VALUES ('2017-06-19','-','7'),('2017-06-19','/','7'),('2017-06-19','Chrome','2'),('2017-06-19','Firefox','2'),('2017-06-19','IE','2'),('2017-06-20','Chrome','1'),('2017-06-20','Firefox','1'),('2017-06-21','Chrome','1'),('2017-06-21','Firefox','1'),('2017-06-21','IE','1'),('2017-06-22','-','2'),('2017-06-22','/','2'),('2017-06-22','Chrome','1'),('2017-06-22','Firefox','1'),('2017-06-22','IE','1'),('2017-06-23','Chrome','2'),('2017-06-23','Firefox','1'),('2017-06-23','IE','1');
/*!40000 ALTER TABLE `browsermember_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browsersession_add`
--

DROP TABLE IF EXISTS `browsersession_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browsersession_add` (
  `logDate` varchar(60) NOT NULL,
  `browser` varchar(60) NOT NULL,
  `addCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsersession_add`
--

LOCK TABLES `browsersession_add` WRITE;
/*!40000 ALTER TABLE `browsersession_add` DISABLE KEYS */;
INSERT INTO `browsersession_add` VALUES ('2017-06-19','Android browser','1'),('2017-06-19','Chrome','4'),('2017-06-19','Firefox','16'),('2017-06-19','IE','10'),('2017-06-20','Chrome','1'),('2017-06-20','Firefox','15'),('2017-06-20','IE','1'),('2017-06-21','Chrome','5'),('2017-06-21','Firefox','7'),('2017-06-21','IE','1'),('2017-06-22','Chrome','7'),('2017-06-22','Firefox','7'),('2017-06-22','IE','1'),('2017-06-23','Chrome','8'),('2017-06-23','Firefox','7'),('2017-06-23','IE','1');
/*!40000 ALTER TABLE `browsersession_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browsersession_length`
--

DROP TABLE IF EXISTS `browsersession_length`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browsersession_length` (
  `logDate` varchar(60) NOT NULL,
  `browser` varchar(60) NOT NULL,
  `sessionChaValue` varchar(60) DEFAULT NULL,
  `sessionAvgLength` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browsersession_length`
--

LOCK TABLES `browsersession_length` WRITE;
/*!40000 ALTER TABLE `browsersession_length` DISABLE KEYS */;
INSERT INTO `browsersession_length` VALUES ('2017-06-19','Android browser','18','18'),('2017-06-19','Chrome','76217','19054'),('2017-06-19','Firefox','1047918','65494'),('2017-06-19','IE','887513','88751'),('2017-06-20','Chrome','74175','74175'),('2017-06-20','Firefox','878600','58573'),('2017-06-20','IE','0','0'),('2017-06-21','Chrome','179038','35807'),('2017-06-21','Firefox','217630','31090'),('2017-06-21','IE','8894','8894'),('2017-06-22','Chrome','264297','37756'),('2017-06-22','Firefox','205359','29337'),('2017-06-22','IE','37794','37794'),('2017-06-23','Chrome','381785','47723'),('2017-06-23','Firefox','202910','28987'),('2017-06-23','IE','10407','10407');
/*!40000 ALTER TABLE `browsersession_length` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depth_num`
--

DROP TABLE IF EXISTS `depth_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depth_num` (
  `logDate` varchar(60) NOT NULL,
  `u_ud` varchar(60) NOT NULL,
  `count` varchar(60) NOT NULL,
  PRIMARY KEY (`logDate`,`u_ud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depth_num`
--

LOCK TABLES `depth_num` WRITE;
/*!40000 ALTER TABLE `depth_num` DISABLE KEYS */;
INSERT INTO `depth_num` VALUES ('2017-06-19','u_ud=0034F7C8-B331-4F23-8A6C-810F00FA469A','4'),('2017-06-19','u_ud=069C6246-4390-4FB3-890A-CCC25BE919BA','4'),('2017-06-19','u_ud=136B4123-52FD-41ED-913C-0E7C6F79FC85','4'),('2017-06-19','u_ud=24BB693C-F4A1-44A0-8B91-1F9E58F7BF63','2'),('2017-06-19','u_ud=31F1CE34-37D0-43E4-9FE9-DB2FA1E8D580','4'),('2017-06-19','u_ud=3DBE91DE-0EF0-47E9-B74F-E34811030D7F','4'),('2017-06-19','u_ud=45117046-7A6D-44F1-9BCA-4AE9BEC925A8','4'),('2017-06-19','u_ud=47E783A6-774B-46E9-951B-D4257DFEC734','1'),('2017-06-19','u_ud=5132C981-389D-431B-94CA-92F4D1D02CBA','4'),('2017-06-19','u_ud=550DE3C3-3923-4C36-BDBD-45784A6E314E','4'),('2017-06-19','u_ud=7800EE31-9FCC-4589-85CA-66C9D3177BA3','4'),('2017-06-19','u_ud=790C2B1C-22DC-43AE-96F5-16D726331974','4'),('2017-06-19','u_ud=857317C2-DE1F-44B9-BB3A-B9BEC06BC00F','4'),('2017-06-19','u_ud=8BA73999-EC79-4996-9357-10C49BD18984','4'),('2017-06-19','u_ud=9C6E6916-E4FE-43D0-9D01-34FD2DB0FDE9','4'),('2017-06-19','u_ud=AD0B0AF8-6BBA-4216-AF9D-324AB4C1AB59','4'),('2017-06-19','u_ud=BDABF45E-EF5A-4DFB-9A06-F30021617D82','4'),('2017-06-19','u_ud=E96992B4-7D62-4A5A-BC50-6B23F6D6A978','4'),('2017-06-19','u_ud=F9A4D239-73D2-492C-A135-4EA81C5F126E','4'),('2017-06-19','u_ud=F9BC0C10-E7A4-4C6F-A19D-8F30534DA38C','1'),('2017-06-19','u_ud=FB5555B0-5553-479E-A0DB-4970BFBC5A47','1'),('2017-06-19','u_ud=FC06D5B1-BE05-4A1C-860B-A043484B2EF6','4'),('2017-06-20','u_ud=069C6246-4390-4FB3-890A-CCC25BE919BA','4'),('2017-06-20','u_ud=31F1CE34-37D0-43E4-9FE9-DB2FA1E8D580','4'),('2017-06-20','u_ud=46D24E64-658D-4D79-822A-6FF72B8383FF','4'),('2017-06-20','u_ud=5132C981-389D-431B-94CA-92F4D1D02CBA','4'),('2017-06-20','u_ud=566A121E-C2A6-4B8F-9D07-B3579B027D66','4'),('2017-06-20','u_ud=59C00F61-6F72-406F-AD94-DE1C11FAC6F3','4'),('2017-06-20','u_ud=64200873-2992-42B8-9314-5377A1CC44BB','4'),('2017-06-20','u_ud=790C2B1C-22DC-43AE-96F5-16D726331974','4'),('2017-06-20','u_ud=8BA73999-EC79-4996-9357-10C49BD18984','4'),('2017-06-20','u_ud=9C6E6916-E4FE-43D0-9D01-34FD2DB0FDE9','4'),('2017-06-20','u_ud=B4B0A6A5-EF9E-4749-BCBA-28E2E8F3F151','4'),('2017-06-20','u_ud=D8330C8A-8916-4F02-BBD6-C11D8D9CE195','4'),('2017-06-20','u_ud=DC778E0F-2897-453C-A07E-15AB54A0FBDA','4'),('2017-06-20','u_ud=E96992B4-7D62-4A5A-BC50-6B23F6D6A978','4'),('2017-06-20','u_ud=F876E839-1FF1-4F0D-A51A-88A7B33007F1','1'),('2017-06-20','u_ud=F9A4D239-73D2-492C-A135-4EA81C5F126E','4'),('2017-06-20','u_ud=F9BC0C10-E7A4-4C6F-A19D-8F30534DA38C','1'),('2017-06-21','u_ud=077D20C8-815D-40C0-829C-83CCC6C9EA68','4'),('2017-06-21','u_ud=0CF33A6F-36E6-4851-9336-84A28B4370CC','4'),('2017-06-21','u_ud=136B4123-52FD-41ED-913C-0E7C6F79FC85','4'),('2017-06-21','u_ud=31F1CE34-37D0-43E4-9FE9-DB2FA1E8D580','4'),('2017-06-21','u_ud=550DE3C3-3923-4C36-BDBD-45784A6E314E','4'),('2017-06-21','u_ud=790C2B1C-22DC-43AE-96F5-16D726331974','4'),('2017-06-21','u_ud=8996C8F6-A85E-45BB-9A57-3BE90EA3131D','3'),('2017-06-21','u_ud=8AB63B0A-F555-4CDA-B5D9-85EFFD1261C3','4'),('2017-06-21','u_ud=8BA73999-EC79-4996-9357-10C49BD18984','3'),('2017-06-21','u_ud=9294D755-3C9B-4403-A725-7D777FD33237','4'),('2017-06-21','u_ud=C4D67EFC-37E6-4AF8-8AAA-847B15727D7D','4'),('2017-06-21','u_ud=E96992B4-7D62-4A5A-BC50-6B23F6D6A978','2'),('2017-06-21','u_ud=F9A4D239-73D2-492C-A135-4EA81C5F126E','4'),('2017-06-22','u_ud=077D20C8-815D-40C0-829C-83CCC6C9EA68','4'),('2017-06-22','u_ud=0CF33A6F-36E6-4851-9336-84A28B4370CC','4'),('2017-06-22','u_ud=136B4123-52FD-41ED-913C-0E7C6F79FC85','4'),('2017-06-22','u_ud=31F1CE34-37D0-43E4-9FE9-DB2FA1E8D580','4'),('2017-06-22','u_ud=550DE3C3-3923-4C36-BDBD-45784A6E314E','4'),('2017-06-22','u_ud=8996C8F6-A85E-45BB-9A57-3BE90EA3131D','4'),('2017-06-22','u_ud=8AB63B0A-F555-4CDA-B5D9-85EFFD1261C3','4'),('2017-06-22','u_ud=8BA73999-EC79-4996-9357-10C49BD18984','4'),('2017-06-22','u_ud=9294D755-3C9B-4403-A725-7D777FD33237','1'),('2017-06-22','u_ud=BB2034F0-4383-400C-BCE9-0FD3D93E450D','2'),('2017-06-22','u_ud=C4D67EFC-37E6-4AF8-8AAA-847B15727D7D','4'),('2017-06-22','u_ud=DC778E0F-2897-453C-A07E-15AB54A0FBDA','2'),('2017-06-22','u_ud=E96992B4-7D62-4A5A-BC50-6B23F6D6A978','2'),('2017-06-22','u_ud=F9A4D239-73D2-492C-A135-4EA81C5F126E','4'),('2017-06-23','u_ud=0034F7C8-B331-4F23-8A6C-810F00FA469A','3'),('2017-06-23','u_ud=077D20C8-815D-40C0-829C-83CCC6C9EA68','4'),('2017-06-23','u_ud=0CF33A6F-36E6-4851-9336-84A28B4370CC','4'),('2017-06-23','u_ud=136B4123-52FD-41ED-913C-0E7C6F79FC85','4'),('2017-06-23','u_ud=1BA076C4-259E-4553-8C47-5FA0165694F1','3'),('2017-06-23','u_ud=31F1CE34-37D0-43E4-9FE9-DB2FA1E8D580','4'),('2017-06-23','u_ud=790C2B1C-22DC-43AE-96F5-16D726331974','3'),('2017-06-23','u_ud=8996C8F6-A85E-45BB-9A57-3BE90EA3131D','3'),('2017-06-23','u_ud=8AB63B0A-F555-4CDA-B5D9-85EFFD1261C3','4'),('2017-06-23','u_ud=8BA73999-EC79-4996-9357-10C49BD18984','4'),('2017-06-23','u_ud=9294D755-3C9B-4403-A725-7D777FD33237','4'),('2017-06-23','u_ud=9C6E6916-E4FE-43D0-9D01-34FD2DB0FDE9','4'),('2017-06-23','u_ud=BB2034F0-4383-400C-BCE9-0FD3D93E450D','4'),('2017-06-23','u_ud=C4D67EFC-37E6-4AF8-8AAA-847B15727D7D','4'),('2017-06-23','u_ud=DC778E0F-2897-453C-A07E-15AB54A0FBDA','4'),('2017-06-23','u_ud=E96992B4-7D62-4A5A-BC50-6B23F6D6A978','4');
/*!40000 ALTER TABLE `depth_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dregion_ipnumber`
--

DROP TABLE IF EXISTS `dregion_ipnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dregion_ipnumber` (
  `logIP` varchar(60) NOT NULL,
  `ipNum` varchar(60) NOT NULL,
  PRIMARY KEY (`logIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dregion_ipnumber`
--

LOCK TABLES `dregion_ipnumber` WRITE;
/*!40000 ALTER TABLE `dregion_ipnumber` DISABLE KEYS */;
INSERT INTO `dregion_ipnumber` VALUES ('0:0:0:0:0:0:0:1','1'),('127.0.0.1','70'),('172.16.0.150','53'),('172.16.0.193','727'),('172.16.0.194','13'),('172.16.0.195','1398'),('172.16.0.197','154'),('172.16.0.198','378'),('172.16.0.20','383'),('172.16.0.202','39'),('172.16.0.204','819'),('172.16.0.29','1205'),('172.16.0.32','319'),('172.16.0.33','20'),('172.16.0.35','501'),('172.16.0.41','116'),('172.16.0.47','51'),('172.16.0.50','324'),('172.16.0.59','142'),('172.16.0.62','649'),('172.16.0.65','18'),('172.16.0.68','409'),('172.16.0.71','684'),('172.16.0.72','711'),('172.16.0.74','124'),('172.16.0.75','34'),('172.16.0.76','29'),('192.168.0.123','61');
/*!40000 ALTER TABLE `dregion_ipnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dregion_sessionnum`
--

DROP TABLE IF EXISTS `dregion_sessionnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dregion_sessionnum` (
  `logDate` varchar(60) NOT NULL,
  `country` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL,
  `sessionCount` varchar(60) NOT NULL,
  `sessionOutCount` varchar(60) NOT NULL,
  `rate` varchar(60) NOT NULL,
  PRIMARY KEY (`logDate`,`country`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dregion_sessionnum`
--

LOCK TABLES `dregion_sessionnum` WRITE;
/*!40000 ALTER TABLE `dregion_sessionnum` DISABLE KEYS */;
INSERT INTO `dregion_sessionnum` VALUES ('2017-06-19','中国','上海市','26','0','0'),('2017-06-20','中国','上海市','17','1','0'),('2017-06-21','中国','上海市','13','0','0'),('2017-06-22','中国','上海市','15','0','0'),('2017-06-23','中国','上海市','16','0','0');
/*!40000 ALTER TABLE `dregion_sessionnum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_add`
--

DROP TABLE IF EXISTS `member_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_add` (
  `logDate` varchar(60) NOT NULL,
  `addMember` varchar(60) DEFAULT NULL,
  `memberAllCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_add`
--

LOCK TABLES `member_add` WRITE;
/*!40000 ALTER TABLE `member_add` DISABLE KEYS */;
INSERT INTO `member_add` VALUES ('2017-06-19','103','103'),('2017-06-20','222','325'),('2017-06-21','185','510'),('2017-06-22','85','595'),('2017-06-23','80','675');
/*!40000 ALTER TABLE `member_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_visit`
--

DROP TABLE IF EXISTS `member_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_visit` (
  `logDate` varchar(60) NOT NULL,
  `memberCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_visit`
--

LOCK TABLES `member_visit` WRITE;
/*!40000 ALTER TABLE `member_visit` DISABLE KEYS */;
INSERT INTO `member_visit` VALUES ('2017-06-19','9'),('2017-06-20','1'),('2017-06-21','1'),('2017-06-22','3'),('2017-06-23','2');
/*!40000 ALTER TABLE `member_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_number_money`
--

DROP TABLE IF EXISTS `order_number_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_number_money` (
  `logDate` varchar(60) NOT NULL,
  `oid` varchar(90) NOT NULL,
  `orderCount` varchar(60) NOT NULL,
  `orderMoney` varchar(60) NOT NULL,
  PRIMARY KEY (`logDate`,`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_number_money`
--

LOCK TABLES `order_number_money` WRITE;
/*!40000 ALTER TABLE `order_number_money` DISABLE KEYS */;
INSERT INTO `order_number_money` VALUES ('2017-06-19','123456','1','159296'),('2017-06-20','123456','1','178684'),('2017-06-21','123456','1','248376'),('2017-06-22','123456','1','238944'),('2017-06-23','123456','1','229512');
/*!40000 ALTER TABLE `order_number_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_retreat`
--

DROP TABLE IF EXISTS `order_retreat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_retreat` (
  `logDate` varchar(60) NOT NULL,
  `retreatCount` varchar(60) NOT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_retreat`
--

LOCK TABLES `order_retreat` WRITE;
/*!40000 ALTER TABLE `order_retreat` DISABLE KEYS */;
INSERT INTO `order_retreat` VALUES ('2017-06-19','9'),('2017-06-22','16');
/*!40000 ALTER TABLE `order_retreat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersuccess_num`
--

DROP TABLE IF EXISTS `ordersuccess_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordersuccess_num` (
  `logDate` varchar(60) NOT NULL,
  `successCount` varchar(60) NOT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersuccess_num`
--

LOCK TABLES `ordersuccess_num` WRITE;
/*!40000 ALTER TABLE `ordersuccess_num` DISABLE KEYS */;
INSERT INTO `ordersuccess_num` VALUES ('2017-06-19','9'),('2017-06-22','16');
/*!40000 ALTER TABLE `ordersuccess_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_add`
--

DROP TABLE IF EXISTS `session_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_add` (
  `logDate` varchar(60) NOT NULL,
  `sessionCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_add`
--

LOCK TABLES `session_add` WRITE;
/*!40000 ALTER TABLE `session_add` DISABLE KEYS */;
INSERT INTO `session_add` VALUES ('2017-06-19','30'),('2017-06-20','17'),('2017-06-21','13'),('2017-06-22','15'),('2017-06-23','16');
/*!40000 ALTER TABLE `session_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_length`
--

DROP TABLE IF EXISTS `session_length`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_length` (
  `logDate` varchar(50) NOT NULL,
  `sessionChaValue` varchar(90) DEFAULT NULL,
  `sessionAvgLength` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_length`
--

LOCK TABLES `session_length` WRITE;
/*!40000 ALTER TABLE `session_length` DISABLE KEYS */;
INSERT INTO `session_length` VALUES ('2017-06-19','2012145','67071'),('2017-06-20','952775','56045'),('2017-06-21','405562','31197'),('2017-06-22','507450','33830'),('2017-06-23','595102','37193');
/*!40000 ALTER TABLE `session_length` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_add`
--

DROP TABLE IF EXISTS `user_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_add` (
  `logDate` varchar(60) NOT NULL,
  `addCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_add`
--

LOCK TABLES `user_add` WRITE;
/*!40000 ALTER TABLE `user_add` DISABLE KEYS */;
INSERT INTO `user_add` VALUES ('2017-06-19','20'),('2017-06-20','8'),('2017-06-23','5');
/*!40000 ALTER TABLE `user_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_visit`
--

DROP TABLE IF EXISTS `user_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visit` (
  `logDate` varchar(60) NOT NULL,
  `visitcount` varchar(60) DEFAULT NULL,
  `visitAllCount` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`logDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit`
--

LOCK TABLES `user_visit` WRITE;
/*!40000 ALTER TABLE `user_visit` DISABLE KEYS */;
INSERT INTO `user_visit` VALUES ('2017-06-19','22','22'),('2017-06-20','17','39'),('2017-06-21','13','52'),('2017-06-22','15','67'),('2017-06-23','16','83');
/*!40000 ALTER TABLE `user_visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-01  9:39:22
