DROP database IF EXISTS sadaf;

create database sadaf char set utf8 collate utf8_persian_ci;

use sadaf;

DROP TABLE IF EXISTS `sadaf`.`AccountSpecs`;
CREATE TABLE  `sadaf`.`AccountSpecs` (
  `AccountSpecID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `UserPassword` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PersonID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccountSpecID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`EMonArray`;
CREATE TABLE  `sadaf`.`EMonArray` (
  `_id` int(11) NOT NULL,
  `emon` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`FacilityPages`;
CREATE TABLE  `sadaf`.`FacilityPages` (
  `FacilityPageID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityID` int(11) DEFAULT NULL,
  `PageName` varchar(145) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`FacilityPageID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`FMonArray`;
CREATE TABLE  `sadaf`.`FMonArray` (
  `_id` int(11) NOT NULL,
  `fmon` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`persons`;
CREATE TABLE  `sadaf`.`persons` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `pfname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `plname` varchar(45) COLLATE utf8_persian_ci DEFAULT NULL,
  `CardNumber` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`SysAudit`;
CREATE TABLE  `sadaf`.`SysAudit` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`SystemDBLog`;
CREATE TABLE  `sadaf`.`SystemDBLog` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`SpecialPages`;
CREATE TABLE  `sadaf`.`SpecialPages` (
  `SpecialPageID` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(245) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`SpecialPageID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`SystemFacilities`;
CREATE TABLE  `sadaf`.`SystemFacilities` (
  `FacilityID` int(11) NOT NULL AUTO_INCREMENT,
  `FacilityName` varchar(245) COLLATE utf8_persian_ci DEFAULT NULL,
  `GroupID` int(11) DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL,
  `PageAddress` varchar(345) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`SystemFacilityGroups`;
CREATE TABLE  `sadaf`.`SystemFacilityGroups` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(145) COLLATE utf8_persian_ci DEFAULT NULL,
  `OrderNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `sadaf`.`UserFacilities`;
CREATE TABLE  `sadaf`.`UserFacilities` (
  `FacilityPageID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FacilityPageID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `attachment`;
CREATE TABLE IF NOT EXISTS `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `attachment` text COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `src` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


DROP TABLE IF EXISTS `folder`;
CREATE TABLE IF NOT EXISTS `folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `lesson`;
CREATE TABLE IF NOT EXISTS `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `code`, `title`) VALUES
(1, 105, 'مبانی برنامه نویسی');


DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `description` text COLLATE utf8_persian_ci NOT NULL,
  `content` text COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


DROP TABLE IF EXISTS `person_lesson`;
CREATE TABLE IF NOT EXISTS `person_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personid` int(11) NOT NULL,
  `lessonid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personid` (`personid`),
  UNIQUE KEY `lessonid` (`lessonid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `person_lesson`
--

INSERT INTO `person_lesson` (`id`, `personid`, `lessonid`) VALUES
(1, 1, 1);


DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;



DROP TABLE IF EXISTS `subject_attachmebt`;
CREATE TABLE IF NOT EXISTS `subject_attachmebt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `attachmentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `attachmentId` (`attachmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


DROP TABLE IF EXISTS `subject_file`;
CREATE TABLE IF NOT EXISTS `subject_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `fileId` (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `subject_folder`;
CREATE TABLE IF NOT EXISTS `subject_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `folderId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `folderId` (`folderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `subject_lesson`;
CREATE TABLE IF NOT EXISTS `subject_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `lessonId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `lessonId` (`lessonId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

DROP TABLE IF EXISTS `subject_page`;
CREATE TABLE IF NOT EXISTS `subject_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `pageId` (`pageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;



DROP TABLE IF EXISTS `subject_tag`;
CREATE TABLE IF NOT EXISTS `subject_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjectId` (`subjectId`),
  KEY `tagId` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;


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
-- Constraints for table `subject_lesson`
--
ALTER TABLE `subject_lesson`
  ADD CONSTRAINT `subject_lesson_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `subject_lesson_ibfk_2` FOREIGN KEY (`lessonId`) REFERENCES `lesson` (`id`);

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



<<<<<<< HEAD
=======






>>>>>>> 98268fd43699196de5af570d5d83c0cfa105e79f
INSERT INTO sadaf.SpecialPages VALUES (1,'main.php'),(2,'/main.php'),(3,'/Menu.php'),(4,'/MainContent.php'),(5,'/ChangePassword.php'),(6,'/MyActions.php'),(7,'/SelectPersonel.php'),(8,'/SelectCustomer.php'),(9,'/SelectStaff.php'),(10,'/GetExamItemPrice.php');


insert into sadaf.persons (pfname, plname, CardNumber) values ('اميد', 'ميلاني فرد', '0');

insert into sadaf.AccountSpecs (UserID, UserPassword, PersonID) values ('omid', 'omid3000', 1);

INSERT INTO sadaf.SystemFacilityGroups VALUES (1,'مدیریت',1),(2,'عملیات کاری',3),(3,'گزارشات',4);

INSERT INTO sadaf.SystemFacilities VALUES (1,'مدیریت افراد',1,3,'Managepersons.php'),(3,'مدیریت امکانات',1,2,'ManageSystemFacilities.php'),(4,'مدیریت گروه های منو',1,1,'ManageSystemFacilityGroups.php'),(5,'مدیریت کاربران',1,4,'ManageAccountSpecs.php');

INSERT INTO sadaf.UserFacilities VALUES (1,'omid',1),(2,'omid',3),(3,'omid',4),(4,'omid',5);

INSERT INTO sadaf.EMonArray VALUES (1,31),(2,28),(3,31),(4,30),(5,31),(6,30),(7,31),(8,31),(9,30),(10,31),(11,30),(12,31);

INSERT INTO sadaf.FMonArray VALUES (1,31),(2,31),(3,31),(4,31),(5,31),(6,31),(7,30),(8,30),(9,30),(10,30),(11,30),(12,29);

INSERT INTO sadaf.FacilityPages VALUES (9,5,'/ManageAccountSpecs.php'),(3,3,'/ManageSystemFacilities.php'),(4,3,'/ManageFacilityPages.php'),(5,3,'/ManageSystemFacilities.php'),(6,3,'/ManageUserFacilities.php'),(7,4,'/ManageSystemFacilityGroups.php'),(8,1,'/Managepersons.php'),(48,12,'/GetJasonData.php'),(25,5,'/ManageUserPermissions.php');

DELIMITER $$

DROP FUNCTION IF EXISTS `sadaf`.`g2j`$$
CREATE FUNCTION  `sadaf`.`g2j`(_edate  date) RETURNS varchar(10) CHARSET utf8
    DETERMINISTIC
BEGIN
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
END;

 $$

DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS `sadaf`.`j2g`$$
CREATE FUNCTION  `sadaf`.`j2g`(j_y int , j_m int , j_d  int ) RETURNS varchar(10) CHARSET utf8
    DETERMINISTIC
BEGIN

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
END;

 $$

DELIMITER ;

