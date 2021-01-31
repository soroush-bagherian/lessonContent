-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 06:50 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sadaf`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `g2j` (`_edate` DATE) RETURNS VARCHAR(10) CHARSET utf8 BEGIN
declare gy,gm,gd    int ;
declare  g_day_no   int ;
declare  i  int;

declare j_day_no ,  j_np ,  jy , jm , jd  int ;
set gy  = year(_edate)-1600;
set gm = month(_edate)-1;
set gd  = day(_edate)-1;

if  (year(_edate) < 1900  or year(_edate) > 2100  )  or (month(_edate) <1  or month(_edate)  > 12 )   or  (day(_edate) < 1 or day(_edate) > 31 )  then
return 'date-error';
end if;

set g_day_no = 365 * gy + floor((gy+3) /  4) - floor((gy+99) / 100) + floor((gy+399)/ 400);

set i=0;
while i < gm do
  set g_day_no=g_day_no+(select  emon from EMonArray  where _id=i+1);
  set i = i + 1;
end while;
if  gm >1  and ((gy % 4 =0 and gy % 100 !=0)  or  (gy%400=0))   then
  set g_day_no = g_day_no + 1 ;
end if;
set  g_day_no = g_day_no + gd;
set  j_day_no =  g_day_no-79;
set  j_np = floor(j_day_no /  12053);
set  j_day_no = j_day_no % 12053;
set  jy = 979+33 *  j_np + 4  *  floor(j_day_no /  1461);
set j_day_no = j_day_no % 1461;

if   j_day_no >= 366  then
  set jy = jy + floor((j_day_no-1) /  365);
  set j_day_no = (j_day_no-1) % 365;
end if;

set  i=0;
while  i < 11  and j_day_no >=  ( select fmon from FMonArray  where _id= i + 1)  do
  set j_day_no = j_day_no - ( select fmon from FMonArray  where _id = i + 1);
  set  i = i + 1;
end while;

set jm = i+1;
set jd = j_day_no+1;

return  concat_ws('/',jy,if(jm < 10 , concat('0',jm) , jm)    ,if(jd < 10 , concat('0',jd) , jd ));
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `j2g` (`j_y` INT, `j_m` INT, `j_d` INT) RETURNS VARCHAR(10) CHARSET utf8 BEGIN

declare  jy,jm,jd  int ;
declare  j_day_no , g_day_no   , gy,gm,gd  int ;
declare  i int ;
declare  leap  bool;

if  (j_y < 1300  or  j_y > 1450  )  or (j_m <1  or j_m  > 12 )   or  (j_d < 1 or j_d > 31 )  then
return 'date-error';
end if;


set  jy = j_y-979;
set  jm = j_m-1;
set  jd = j_d-1;

set j_day_no = 365 * jy + floor(jy/33) * 8 + floor(((jy%33)+3) /  4);
set i  = 0;
while  i < jm  do
  set j_day_no = j_day_no + (select fmon from FMonArray  where  _id=i+1);
  set i = i+1;
end while;
set  j_day_no = j_day_no + jd;
set  g_day_no = j_day_no+79;
set  gy = 1600 + 400 *  floor(g_day_no /  146097);
set  g_day_no = g_day_no % 146097;
set  leap = true;
if  g_day_no >= 36525  then   
  set g_day_no = g_day_no - 1;
  set gy = gy + 100 * floor(g_day_no /  36524);
  set g_day_no = g_day_no % 36524;
  if  g_day_no >= 365  then
    set g_day_no  =  g_day_no + 1;
  else
    set leap = false;
  end if;
end if;
set gy = gy + 4 *  floor(g_day_no / 1461);
set g_day_no = g_day_no % 1461;
if  g_day_no >= 366  then
  set leap = false;
  set g_day_no = g_day_no - 1 ;
  set gy = gy + floor(g_day_no /  365);
  set g_day_no = g_day_no % 365;
end if;
set  i = 0;
while  g_day_no >= ( select  emon from EMonArray  where _id = i + 1 ) + ( select if(i = 1 and  leap = true , 1 , 0) )   do
  set g_day_no = g_day_no - (( select  emon from EMonArray  where _id = i + 1)  + ( select if ( i = 1 and  leap= true ,1,0)));
  set i = i + 1;
end while;
set gm = i+1;
set gd = g_day_no+1;
return  concat_ws('-',gy , gm , gd );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accountspecs`
--

CREATE TABLE `accountspecs` (
  `AccountSpecID` int(11) NOT NULL,
  `UserID` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `UserPassword` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PersonID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `accountspecs`
--

INSERT INTO `accountspecs` (`AccountSpecID`, `UserID`, `UserPassword`, `PersonID`) VALUES
(1, 'omid', 'omid3000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `attachment` text COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emonarray`
--

CREATE TABLE `emonarray` (
  `_id` int(11) NOT NULL,
  `emon` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `emonarray`
--

INSERT INTO `emonarray` (`_id`, `emon`) VALUES
(1, 31),
(2, 28),
(3, 31),
(4, 30),
(5, 31),
(6, 30),
(7, 31),
(8, 31),
(9, 30),
(10, 31),
(11, 30),
(12, 31);

-- --------------------------------------------------------

--
-- Table structure for table `facilitypages`
--

CREATE TABLE `facilitypages` (
  `FacilityPageID` int(11) NOT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `PageName` varchar(145) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `facilitypages`
--

INSERT INTO `facilitypages` (`FacilityPageID`, `FacilityID`, `PageName`) VALUES
(9, 5, '/ManageAccountSpecs.php'),
(3, 3, '/ManageSystemFacilities.php'),
(4, 3, '/ManageFacilityPages.php'),
(5, 3, '/ManageSystemFacilities.php'),
(6, 3, '/ManageUserFacilities.php'),
(7, 4, '/ManageSystemFacilityGroups.php'),
(8, 1, '/Managepersons.php'),
(48, 12, '/GetJasonData.php'),
(25, 5, '/ManageUserPermissions.php');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `src` varchar(255) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fmonarray`
--

CREATE TABLE `fmonarray` (
  `_id` int(11) NOT NULL,
  `fmon` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `fmonarray`
--

INSERT INTO `fmonarray` (`_id`, `fmon`) VALUES
(1, 31),
(2, 31),
(3, 31),
(4, 31),
(5, 31),
(6, 31),
(7, 30),
(8, 30),
(9, 30),
(10, 30),
(11, 30),
(12, 29);

-- --------------------------------------------------------

--
-- Table structure for table `folder`
--

CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `code`, `title`) VALUES
(1, 105, 'مبانی برنامه نویسی');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `content` text COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `PersonID` int(11) NOT NULL,
  `pfname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `plname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `CardNumber` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`PersonID`, `pfname`, `plname`, `CardNumber`) VALUES
(1, 'اميد', 'ميلاني فرد', '0');

-- --------------------------------------------------------

--
-- Table structure for table `person_lesson`
--

CREATE TABLE `person_lesson` (
  `id` int(11) NOT NULL,
  `personid` int(11) NOT NULL,
  `lessonid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `person_lesson`
--

INSERT INTO `person_lesson` (`id`, `personid`, `lessonid`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialpages`
--

CREATE TABLE `specialpages` (
  `SpecialPageID` int(11) NOT NULL,
  `PageName` varchar(245) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `specialpages`
--

INSERT INTO `specialpages` (`SpecialPageID`, `PageName`) VALUES
(1, 'main.php'),
(2, '/main.php'),
(3, '/Menu.php'),
(4, '/MainContent.php'),
(5, '/ChangePassword.php'),
(6, '/MyActions.php'),
(7, '/SelectPersonel.php'),
(8, '/SelectCustomer.php'),
(9, '/SelectStaff.php'),
(10, '/GetExamItemPrice.php');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_attachmebt`
--

CREATE TABLE `subject_attachmebt` (
  `id` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `attachmentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_file`
--

CREATE TABLE `subject_file` (
  `id` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_folder`
--

CREATE TABLE `subject_folder` (
  `id` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `folderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_page`
--

CREATE TABLE `subject_page` (
  `id` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_tag`
--

CREATE TABLE `subject_tag` (
  `id` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sysaudit`
--

CREATE TABLE `sysaudit` (
  `RecID` bigint(20) UNSIGNED NOT NULL,
  `UserID` varchar(15) COLLATE utf8_persian_ci DEFAULT NULL,
  `ActionType` tinyint(3) UNSIGNED DEFAULT NULL,
  `ActionDesc` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `IPAddress` bigint(20) DEFAULT NULL,
  `SysCode` tinyint(3) UNSIGNED DEFAULT NULL,
  `IsSecure` tinyint(3) UNSIGNED DEFAULT NULL,
  `ATS` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemdblog`
--

CREATE TABLE `systemdblog` (
  `RecID` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'صفحه',
  `query` text COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'پرس و جو',
  `SerializedParam` text COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'پارامتر پرس و جو',
  `UserID` varchar(15) COLLATE utf8_persian_ci DEFAULT NULL COMMENT 'شناسه کاربر',
  `IPAddress` bigint(20) DEFAULT NULL COMMENT 'آدرس IP',
  `SysCode` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'کد سیستم',
  `ATS` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'تاریخ اجرا',
  `ExecuteTime` float(14,10) NOT NULL COMMENT 'مدت زمان اجرا',
  `QueryStatus` enum('SUCCESS','FAILED') COLLATE utf8_persian_ci DEFAULT 'SUCCESS' COMMENT 'وضعیت پرس و جو',
  `DBName` varchar(30) COLLATE utf8_persian_ci DEFAULT '' COMMENT 'نام پایگاه داده'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemfacilities`
--

CREATE TABLE `systemfacilities` (
  `FacilityID` int(11) NOT NULL,
  `FacilityName` varchar(245) COLLATE utf8_persian_ci DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL,
  `PageAddress` varchar(345) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `systemfacilities`
--

INSERT INTO `systemfacilities` (`FacilityID`, `FacilityName`, `GroupID`, `OrderNo`, `PageAddress`) VALUES
(1, 'مدیریت افراد', 1, 3, 'Managepersons.php'),
(3, 'مدیریت امکانات', 1, 2, 'ManageSystemFacilities.php'),
(4, 'مدیریت گروه های منو', 1, 1, 'ManageSystemFacilityGroups.php'),
(5, 'مدیریت کاربران', 1, 4, 'ManageAccountSpecs.php');

-- --------------------------------------------------------

--
-- Table structure for table `systemfacilitygroups`
--

CREATE TABLE `systemfacilitygroups` (
  `GroupID` int(11) NOT NULL,
  `GroupName` varchar(145) COLLATE utf8_persian_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `systemfacilitygroups`
--

INSERT INTO `systemfacilitygroups` (`GroupID`, `GroupName`, `OrderNo`) VALUES
(1, 'مدیریت', 1),
(2, 'عملیات کاری', 3),
(3, 'گزارشات', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userfacilities`
--

CREATE TABLE `userfacilities` (
  `FacilityPageID` int(11) NOT NULL,
  `UserID` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `userfacilities`
--

INSERT INTO `userfacilities` (`FacilityPageID`, `UserID`, `FacilityID`) VALUES
(1, 'omid', 1),
(2, 'omid', 3),
(3, 'omid', 4),
(4, 'omid', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountspecs`
--
ALTER TABLE `accountspecs`
  ADD PRIMARY KEY (`AccountSpecID`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emonarray`
--
ALTER TABLE `emonarray`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `facilitypages`
--
ALTER TABLE `facilitypages`
  ADD PRIMARY KEY (`FacilityPageID`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fmonarray`
--
ALTER TABLE `fmonarray`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`PersonID`);

--
-- Indexes for table `person_lesson`
--
ALTER TABLE `person_lesson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personid` (`personid`),
  ADD UNIQUE KEY `lessonid` (`lessonid`);

--
-- Indexes for table `specialpages`
--
ALTER TABLE `specialpages`
  ADD PRIMARY KEY (`SpecialPageID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_attachmebt`
--
ALTER TABLE `subject_attachmebt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjectId` (`subjectId`),
  ADD KEY `attachmentId` (`attachmentId`);

--
-- Indexes for table `subject_file`
--
ALTER TABLE `subject_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjectId` (`subjectId`),
  ADD KEY `fileId` (`fileId`);

--
-- Indexes for table `subject_folder`
--
ALTER TABLE `subject_folder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjectId` (`subjectId`),
  ADD KEY `folderId` (`folderId`);

--
-- Indexes for table `subject_page`
--
ALTER TABLE `subject_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjectId` (`subjectId`),
  ADD KEY `pageId` (`pageId`);

--
-- Indexes for table `subject_tag`
--
ALTER TABLE `subject_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjectId` (`subjectId`),
  ADD KEY `tagId` (`tagId`);

--
-- Indexes for table `sysaudit`
--
ALTER TABLE `sysaudit`
  ADD PRIMARY KEY (`RecID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `systemdblog`
--
ALTER TABLE `systemdblog`
  ADD PRIMARY KEY (`RecID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `systemfacilities`
--
ALTER TABLE `systemfacilities`
  ADD PRIMARY KEY (`FacilityID`);

--
-- Indexes for table `systemfacilitygroups`
--
ALTER TABLE `systemfacilitygroups`
  ADD PRIMARY KEY (`GroupID`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userfacilities`
--
ALTER TABLE `userfacilities`
  ADD PRIMARY KEY (`FacilityPageID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountspecs`
--
ALTER TABLE `accountspecs`
  MODIFY `AccountSpecID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facilitypages`
--
ALTER TABLE `facilitypages`
  MODIFY `FacilityPageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `folder`
--
ALTER TABLE `folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person_lesson`
--
ALTER TABLE `person_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `specialpages`
--
ALTER TABLE `specialpages`
  MODIFY `SpecialPageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_attachmebt`
--
ALTER TABLE `subject_attachmebt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_file`
--
ALTER TABLE `subject_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_folder`
--
ALTER TABLE `subject_folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_page`
--
ALTER TABLE `subject_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_tag`
--
ALTER TABLE `subject_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sysaudit`
--
ALTER TABLE `sysaudit`
  MODIFY `RecID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemdblog`
--
ALTER TABLE `systemdblog`
  MODIFY `RecID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemfacilities`
--
ALTER TABLE `systemfacilities`
  MODIFY `FacilityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `systemfacilitygroups`
--
ALTER TABLE `systemfacilitygroups`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userfacilities`
--
ALTER TABLE `userfacilities`
  MODIFY `FacilityPageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `person_lesson`
--
ALTER TABLE `person_lesson`
  ADD CONSTRAINT `person_lesson_ibfk_1` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`),
  ADD CONSTRAINT `person_lesson_ibfk_2` FOREIGN KEY (`personid`) REFERENCES `persons` (`PersonID`);

--
-- Constraints for table `subject_attachmebt`
--
ALTER TABLE `subject_attachmebt`
  ADD CONSTRAINT `subject_attachmebt_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `subject_attachmebt_ibfk_2` FOREIGN KEY (`attachmentId`) REFERENCES `attachment` (`id`);

--
-- Constraints for table `subject_file`
--
ALTER TABLE `subject_file`
  ADD CONSTRAINT `subject_file_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `subject_file_ibfk_2` FOREIGN KEY (`fileId`) REFERENCES `file` (`id`);

--
-- Constraints for table `subject_folder`
--
ALTER TABLE `subject_folder`
  ADD CONSTRAINT `subject_folder_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `subject_folder_ibfk_2` FOREIGN KEY (`folderId`) REFERENCES `folder` (`id`);

--
-- Constraints for table `subject_page`
--
ALTER TABLE `subject_page`
  ADD CONSTRAINT `subject_page_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `subject_page_ibfk_2` FOREIGN KEY (`pageId`) REFERENCES `page` (`id`);

--
-- Constraints for table `subject_tag`
--
ALTER TABLE `subject_tag`
  ADD CONSTRAINT `subject_tag_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `subject_tag_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
