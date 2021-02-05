-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sadaf
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `accountspecs`
--

DROP TABLE IF EXISTS `accountspecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountspecs` (
  `AccountSpecID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `UserPassword` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PersonID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountSpecID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountspecs`
--

LOCK TABLES `accountspecs` WRITE;
/*!40000 ALTER TABLE `accountspecs` DISABLE KEYS */;
INSERT INTO `accountspecs` VALUES (1,'omid','omid3000',1);
/*!40000 ALTER TABLE `accountspecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `attachment` text COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (1,'تست','نمرات از 100','google.com'),(2,'تست','نمرات از 100','google.com'),(3,'','',''),(4,'','',''),(5,'asdasd','asdasdas','asdasd');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communicationhall`
--

DROP TABLE IF EXISTS `communicationhall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communicationhall` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` varchar(120) COLLATE utf8_persian_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communicationhall`
--

LOCK TABLES `communicationhall` WRITE;
/*!40000 ALTER TABLE `communicationhall` DISABLE KEYS */;
INSERT INTO `communicationhall` VALUES (1,'تست','نمرات از 100',1),(2,'تست','نمرات از 100',1),(3,'تست','نمرات از 100',0),(4,'تالار گسسته','گسسته',1);
/*!40000 ALTER TABLE `communicationhall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emonarray`
--

DROP TABLE IF EXISTS `emonarray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emonarray` (
  `_id` int(11) NOT NULL,
  `emon` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emonarray`
--

LOCK TABLES `emonarray` WRITE;
/*!40000 ALTER TABLE `emonarray` DISABLE KEYS */;
INSERT INTO `emonarray` VALUES (1,31),(2,28),(3,31),(4,30),(5,31),(6,30),(7,31),(8,31),(9,30),(10,31),(11,30),(12,31);
/*!40000 ALTER TABLE `emonarray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilitypages`
--

DROP TABLE IF EXISTS `facilitypages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilitypages` (
  `FacilityPageID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityID` int(11) DEFAULT NULL,
  `PageName` varchar(145) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`FacilityPageID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilitypages`
--

LOCK TABLES `facilitypages` WRITE;
/*!40000 ALTER TABLE `facilitypages` DISABLE KEYS */;
INSERT INTO `facilitypages` VALUES (3,3,'/ManageSystemFacilities.php'),(4,3,'/ManageFacilityPages.php'),(5,3,'/ManageSystemFacilities.php'),(6,3,'/ManageUserFacilities.php'),(7,4,'/ManageSystemFacilityGroups.php'),(8,1,'/Managepersons.php'),(9,5,'/ManageAccountSpecs.php'),(25,5,'/ManageUserPermissions.php'),(48,12,'/GetJasonData.php'),(49,6,'/subject.php'),(50,7,'/source.php'),(51,8,'/lessonList.php');
/*!40000 ALTER TABLE `facilitypages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `src` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'D:\\wamp64\\tmp\\phpB30C.tmp','توضیح فایل تست',''),(2,'D:\\wamp64\\tmp\\php2457.tmp','نمرات از 100','../uploads/test.txt'),(3,'D:\\wamp64\\tmp\\phpDBFB.tmp','نمرات از 100','../uploads/رزومه.pdf'),(4,'Screenshot (19).png','sadsad','../uploads/Screenshot (19).png');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmonarray`
--

DROP TABLE IF EXISTS `fmonarray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fmonarray` (
  `_id` int(11) NOT NULL,
  `fmon` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmonarray`
--

LOCK TABLES `fmonarray` WRITE;
/*!40000 ALTER TABLE `fmonarray` DISABLE KEYS */;
INSERT INTO `fmonarray` VALUES (1,31),(2,31),(3,31),(4,31),(5,31),(6,31),(7,30),(8,30),(9,30),(10,30),(11,30),(12,29);
/*!40000 ALTER TABLE `fmonarray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,'پوشه نمرات','نمره دانشجویان'),(2,'تست','sadasdsa'),(3,'تست','نمرات از 100');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,105,'مبانی برنامه نویسی'),(2,106,'گسسته');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `content` text COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'امتحان پایانترم','مدت امتحان 30 دقیقه میباشد','<p>محتوای خود را وارد کنید.</p>'),(2,'سشیشس','یشسیشسیسش','<p>محتوای خود را وارد کنید.</p>'),(3,'ضضضضض','ضضضضضضض','<p>محتوای خود را وارد کنید.</p>');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_lesson`
--

DROP TABLE IF EXISTS `person_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `lessonid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_lesson`
--

LOCK TABLES `person_lesson` WRITE;
/*!40000 ALTER TABLE `person_lesson` DISABLE KEYS */;
INSERT INTO `person_lesson` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `person_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `pfname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `plname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `CardNumber` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'اميد','ميلاني فرد','0');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialpages`
--

DROP TABLE IF EXISTS `specialpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialpages` (
  `SpecialPageID` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(245) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`SpecialPageID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialpages`
--

LOCK TABLES `specialpages` WRITE;
/*!40000 ALTER TABLE `specialpages` DISABLE KEYS */;
INSERT INTO `specialpages` VALUES (1,'main.php'),(2,'/main.php'),(3,'/Menu.php'),(4,'/MainContent.php'),(5,'/ChangePassword.php'),(6,'/MyActions.php'),(7,'/SelectPersonel.php'),(8,'/SelectCustomer.php'),(9,'/SelectStaff.php'),(10,'/GetExamItemPrice.php');
/*!40000 ALTER TABLE `specialpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'نمرات1'),(2,'تست12'),(3,'تست'),(4,'ویرایش شده'),(5,''),(6,'تست2'),(7,'تست41'),(8,'سسسس');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_attachment`
--

DROP TABLE IF EXISTS `subject_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `attachmentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `attachmentId` (`attachmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_attachment`
--

LOCK TABLES `subject_attachment` WRITE;
/*!40000 ALTER TABLE `subject_attachment` DISABLE KEYS */;
INSERT INTO `subject_attachment` VALUES (1,3,2),(2,4,2),(3,5,2);
/*!40000 ALTER TABLE `subject_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_file`
--

DROP TABLE IF EXISTS `subject_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_file`
--

LOCK TABLES `subject_file` WRITE;
/*!40000 ALTER TABLE `subject_file` DISABLE KEYS */;
INSERT INTO `subject_file` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4);
/*!40000 ALTER TABLE `subject_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_folder`
--

DROP TABLE IF EXISTS `subject_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `folderId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `folderId` (`folderId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_folder`
--

LOCK TABLES `subject_folder` WRITE;
/*!40000 ALTER TABLE `subject_folder` DISABLE KEYS */;
INSERT INTO `subject_folder` VALUES (1,3,2);
/*!40000 ALTER TABLE `subject_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_hall`
--

DROP TABLE IF EXISTS `subject_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_hall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) DEFAULT NULL,
  `hallId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_hall`
--

LOCK TABLES `subject_hall` WRITE;
/*!40000 ALTER TABLE `subject_hall` DISABLE KEYS */;
INSERT INTO `subject_hall` VALUES (1,2,0),(2,3,2),(3,4,1);
/*!40000 ALTER TABLE `subject_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_lesson`
--

DROP TABLE IF EXISTS `subject_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `lessonId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `lessonId` (`lessonId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_lesson`
--

LOCK TABLES `subject_lesson` WRITE;
/*!40000 ALTER TABLE `subject_lesson` DISABLE KEYS */;
INSERT INTO `subject_lesson` VALUES (2,2,1),(3,1,2),(4,2,3),(5,2,4),(6,1,5),(7,1,6),(8,7,1),(9,8,2);
/*!40000 ALTER TABLE `subject_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_page`
--

DROP TABLE IF EXISTS `subject_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `pageId` (`pageId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_page`
--

LOCK TABLES `subject_page` WRITE;
/*!40000 ALTER TABLE `subject_page` DISABLE KEYS */;
INSERT INTO `subject_page` VALUES (1,3,2),(2,1,2);
/*!40000 ALTER TABLE `subject_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_tag`
--

DROP TABLE IF EXISTS `subject_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `tagId` (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_tag`
--

LOCK TABLES `subject_tag` WRITE;
/*!40000 ALTER TABLE `subject_tag` DISABLE KEYS */;
INSERT INTO `subject_tag` VALUES (2,2,15),(3,1,16);
/*!40000 ALTER TABLE `subject_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysaudit`
--

DROP TABLE IF EXISTS `sysaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysaudit` (
  `RecID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` varchar(15) COLLATE utf8_persian_ci DEFAULT NULL,
  `ActionType` tinyint(3) unsigned DEFAULT NULL,
  `ActionDesc` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `IPAddress` bigint(20) DEFAULT NULL,
  `SysCode` tinyint(3) unsigned DEFAULT NULL,
  `IsSecure` tinyint(3) unsigned DEFAULT NULL,
  `ATS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RecID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysaudit`
--

LOCK TABLES `sysaudit` WRITE;
/*!40000 ALTER TABLE `sysaudit` DISABLE KEYS */;
INSERT INTO `sysaudit` VALUES (1,'omid',NULL,'ثبت داده جدید در  با کد 5',0,0,NULL,'2021-02-02 20:02:58'),(2,'omid',NULL,'ثبت داده جدید در  با کد 49',0,0,NULL,'2021-02-02 20:03:11'),(3,'omid',NULL,'ثبت داده جدید در  با کد 7',0,0,NULL,'2021-02-02 20:04:31'),(4,'omid',NULL,'ثبت داده جدید در  با کد 6',0,0,NULL,'2021-02-02 20:04:37'),(5,'omid',NULL,'ثبت داده جدید در  با کد 50',0,0,NULL,'2021-02-02 20:04:47'),(6,'omid',NULL,'ثبت داده جدید در  با کد 8',0,0,NULL,'2021-02-03 22:40:01'),(7,'omid',NULL,'ثبت داده جدید در  با کد 7',0,0,NULL,'2021-02-03 22:40:08'),(8,'omid',NULL,'ثبت داده جدید در  با کد 51',0,0,NULL,'2021-02-03 22:40:21');
/*!40000 ALTER TABLE `sysaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemdblog`
--

DROP TABLE IF EXISTS `systemdblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemdblog` (
  `RecID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'صفحه',
  `query` text COLLATE utf8_persian_ci COMMENT 'پرس و جو',
  `SerializedParam` text COLLATE utf8_persian_ci COMMENT 'پارامتر پرس و جو',
  `UserID` varchar(15) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شناسه کاربر',
  `IPAddress` bigint(20) DEFAULT NULL COMMENT 'آدرس IP',
  `SysCode` tinyint(3) unsigned DEFAULT NULL COMMENT 'کد سیستم',
  `ATS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'تاریخ اجرا',
  `ExecuteTime` float(14,10) NOT NULL COMMENT 'مدت زمان اجرا',
  `QueryStatus` enum('SUCCESS','FAILED') COLLATE utf8_persian_ci DEFAULT 'SUCCESS' COMMENT 'وضعیت پرس و جو',
  `DBName` varchar(30) COLLATE utf8_persian_ci DEFAULT '' COMMENT 'نام پایگاه داده',
  PRIMARY KEY (`RecID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemdblog`
--

LOCK TABLES `systemdblog` WRITE;
/*!40000 ALTER TABLE `systemdblog` DISABLE KEYS */;
INSERT INTO `systemdblog` VALUES (1,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.subject_tag (subjectId , tagId) values(?,?);HY000,1366,Incorrect integer value: \'\' for column \'subjectId\' at row 1','a:2:{i:0;s:0:\"\";i:1;s:2:\"13\";}','omid',0,0,'2021-02-03 20:35:43',0.0008111000,'FAILED','sadaf'),(2,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.subject_page (subjectId , folderId) values(?,?);42S22,1054,Unknown column \'folderId\' in \'field list\'','a:2:{i:0;s:1:\"2\";i:1;s:1:\"2\";}','omid',0,0,'2021-02-03 21:54:37',0.0494930744,'FAILED','sadaf'),(3,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.subject_attachment (subjectId , folderId) values(?,?);42S02,1146,Table \'sadaf.subject_attachment\' doesn\'t exist','a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}','omid',0,0,'2021-02-03 22:20:27',0.0003700256,'FAILED','sadaf'),(4,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.subject_attachment (subjectId , folderId) values(?,?);42S22,1054,Unknown column \'folderId\' in \'field list\'','a:2:{i:0;s:1:\"2\";i:1;s:1:\"2\";}','omid',0,0,'2021-02-03 22:21:18',0.0500290394,'FAILED','sadaf'),(5,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.communicationhall (id , title ,description ,status) values(?,?,?,?);HY000,3105,The value specified for generated column \'status\' in table \'communicationhall\' is not allowed.','a:4:{i:0;s:1:\"1\";i:1;s:5:\"aaaaa\";i:2;s:5:\"aaaaa\";i:3;s:0:\"\";}','omid',0,0,'2021-02-04 12:16:39',0.0001900196,'FAILED','sadaf'),(6,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.communicationhall (id , title ,description ,status) values(?,?,?,?);HY000,3105,The value specified for generated column \'status\' in table \'communicationhall\' is not allowed.','a:4:{i:0;s:1:\"1\";i:1;s:25:\"مباحث میانترم\";i:2;s:25:\"تالار میانترم\";i:3;s:1:\"1\";}','omid',0,0,'2021-02-04 12:17:44',0.0001749992,'FAILED','sadaf'),(7,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.communicationhall (id , title ,description ,status) values(?,?,?,?);HY000,3105,The value specified for generated column \'status\' in table \'communicationhall\' is not allowed.','a:4:{i:0;s:1:\"1\";i:1;s:17:\"تالار تست\";i:2;s:17:\"توضیح تست\";i:3;s:1:\"1\";}','omid',0,0,'2021-02-04 12:18:55',0.0001659393,'FAILED','sadaf'),(8,'localhost/LessonContent_fork/www/sadaf/source.php','insert into sadaf.subject_hall (subjectId , halltId) values(?,?);42S22,1054,Unknown column \'halltId\' in \'field list\'','a:2:{i:0;s:1:\"1\";i:1;s:1:\"0\";}','omid',0,0,'2021-02-04 12:21:48',0.0003869534,'FAILED','sadaf'),(9,'localhost/LessonContent_fork/www/sadaf/subject.php','select * , lesson.title as lessonTitle from lesson \r\n		join  subject_lesson on lesson.id = subject_lesson.lessonId\r\n		join  subject on subject.id = subject_lesson.subjectId\r\n		join person_lesson on lesson.id = person_lesson.lessonId \r\n		where persons.PersonID=?42S22,1054,Unknown column \'persons.PersonID\' in \'where clause\'','a:1:{i:0;s:1:\"1\";}','omid',0,0,'2021-02-04 20:32:09',0.0001809597,'FAILED','sadaf'),(10,'localhost/LessonContent_fork/www/sadaf/subject.php','select * , lesson.title as lessonTitle from lesson \r\n		join  subject_lesson on lesson.id = subject_lesson.lessonId\r\n		join  subject on subject.id = subject_lesson.subjectId\r\n		join person_lesson on lesson.id = person_lesson.lessonId \r\n		where where personid =?42000,1064,You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where personid =\'1\'\' at line 5','a:1:{i:0;s:1:\"1\";}','omid',0,0,'2021-02-04 20:32:38',0.0001800060,'FAILED','sadaf');
/*!40000 ALTER TABLE `systemdblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemfacilities`
--

DROP TABLE IF EXISTS `systemfacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemfacilities` (
  `FacilityID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityName` varchar(245) COLLATE utf8_persian_ci DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL,
  `PageAddress` varchar(345) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemfacilities`
--

LOCK TABLES `systemfacilities` WRITE;
/*!40000 ALTER TABLE `systemfacilities` DISABLE KEYS */;
INSERT INTO `systemfacilities` VALUES (1,'مدیریت افراد',1,3,'Managepersons.php'),(3,'مدیریت امکانات',1,2,'ManageSystemFacilities.php'),(4,'مدیریت گروه های منو',1,1,'ManageSystemFacilityGroups.php'),(5,'مدیریت کاربران',1,4,'ManageAccountSpecs.php'),(6,'موضوع ها',2,1,'subject.php'),(7,'منابع',2,1,'source.php'),(8,'درس ها',2,1,'lessonList.php');
/*!40000 ALTER TABLE `systemfacilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemfacilitygroups`
--

DROP TABLE IF EXISTS `systemfacilitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemfacilitygroups` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(145) COLLATE utf8_persian_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemfacilitygroups`
--

LOCK TABLES `systemfacilitygroups` WRITE;
/*!40000 ALTER TABLE `systemfacilitygroups` DISABLE KEYS */;
INSERT INTO `systemfacilitygroups` VALUES (1,'مدیریت',1),(2,'عملیات کاری',3),(3,'گزارشات',4);
/*!40000 ALTER TABLE `systemfacilitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'test'),(2,'تاریخ پروژه'),(3,'1.0.0'),(4,'سلام'),(5,'1.0.1'),(6,'asaS'),(7,'fghfhg'),(8,'sad'),(9,'aaaaaaaaaaaaaa'),(10,'11111111'),(11,'asdsad'),(12,'تاریخ پروژه'),(13,'1.0.0'),(14,'1.0.1'),(15,'1.0.0'),(16,'sad');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfacilities`
--

DROP TABLE IF EXISTS `userfacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userfacilities` (
  `FacilityPageID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FacilityPageID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfacilities`
--

LOCK TABLES `userfacilities` WRITE;
/*!40000 ALTER TABLE `userfacilities` DISABLE KEYS */;
INSERT INTO `userfacilities` VALUES (1,'omid',1),(2,'omid',3),(3,'omid',4),(4,'omid',5),(5,'omid',6),(6,'omid',7),(7,'omid',8);
/*!40000 ALTER TABLE `userfacilities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-06  0:58:24
