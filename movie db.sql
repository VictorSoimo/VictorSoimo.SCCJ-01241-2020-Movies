/*
SQLyog Trial v13.2.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - movie
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movie` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `movie`;

/*Table structure for table `actors` */

DROP TABLE IF EXISTS `actors`;

CREATE TABLE `actors` (
  `actorid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `stagename` varchar(50) NOT NULL,
  `adddedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`actorid`),
  KEY `adddedby` (`adddedby`),
  CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`adddedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `actors` */

insert  into `actors`(`actorid`,`firstname`,`lastname`,`stagename`,`adddedby`) values 
(5,'andre','andreas','vivaldi',2),
(6,'john','stones','winrar',2),
(7,'melanin','diva','alicia',3),
(8,'masaa','kuset','maryjane',3),
(9,'breeder','lw','gotha',5),
(10,'vera','sidik','nyash',3),
(11,'fool','ish','stoopid',2),
(12,'thomas','shelby','blinder',1),
(13,'thomas','sankara','president',2),
(14,'muamar','gadaff','statesman',3),
(15,'malcom','x','brothremalcom',4),
(16,'robert','nesta ','marley',4),
(17,'martin','lawrence','fatboy',5),
(18,'larry','madowo','news',1),
(20,'victor','miranji','miranji',NULL);

/*Table structure for table `genre` */

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `genreid` int(11) NOT NULL AUTO_INCREMENT,
  `genrename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  PRIMARY KEY (`genreid`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `genre` */

insert  into `genre`(`genreid`,`genrename`,`dateadded`,`addedby`) values 
(1,'adventure','2024-07-24 10:47:59',1),
(2,'action','2024-07-08 10:48:13',2),
(3,'bollywood','2024-07-31 10:51:45',2),
(4,'drama','2024-08-08 10:52:17',4),
(5,'documentary','2024-08-10 10:52:35',1),
(6,'fiction','2024-06-30 10:52:46',3);

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `release date` datetime NOT NULL,
  `costid` float DEFAULT NULL,
  `ratingid` int(11) NOT NULL,
  `genreid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `addedby` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `castid` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `languageid` (`languageid`),
  KEY `addedby` (`addedby`),
  KEY `rating` (`ratingid`),
  KEY `genre` (`genreid`),
  KEY `castid` (`castid`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`ratingid`) REFERENCES `rating` (`ratingid`),
  CONSTRAINT `movie_ibfk_4` FOREIGN KEY (`genreid`) REFERENCES `genre` (`genreid`),
  CONSTRAINT `movie_ibfk_5` FOREIGN KEY (`castid`) REFERENCES `moviecast` (`castid`),
  CONSTRAINT `movie_ibfk_6` FOREIGN KEY (`languageid`) REFERENCES `movielanguage` (`languageid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `movie` */

insert  into `movie`(`movieid`,`title`,`release date`,`costid`,`ratingid`,`genreid`,`languageid`,`addedby`,`dateadded`,`castid`) values 
(3,'peakyblinders','2024-07-07 11:53:45',0,2,2,2,2,'2024-07-11 11:57:46',0),
(4,'parliament of owls','2024-06-30 12:04:44',0,3,2,1,2,'2024-06-30 12:04:55',0),
(5,'genz','2024-07-04 12:05:24',0,4,3,4,1,'2024-07-18 12:05:39',0),
(6,'the godfather','1989-07-07 12:34:05',NULL,3,2,12,1,'2009-07-07 12:34:19',0),
(7,'zootopia','2024-07-01 12:34:38',NULL,5,1,6,2,'2024-07-07 12:35:00',0),
(8,'the lighthouse','2024-07-17 12:40:40',NULL,6,2,12,1,'2024-07-11 12:41:12',0),
(9,'power','2024-08-01 14:14:19',NULL,3,4,2,5,'2024-08-10 14:14:44',0),
(11,'book II Ghost','2024-08-07 14:14:55',NULL,7,4,9,3,'2024-08-03 14:15:40',0),
(13,'mr robot','2024-07-30 14:49:14',NULL,4,6,10,4,'2024-08-09 14:49:54',0),
(17,'game of thrones','2024-07-23 14:50:18',NULL,5,1,11,5,'2024-08-09 14:51:02',0);

/*Table structure for table `moviecast` */

DROP TABLE IF EXISTS `moviecast`;

CREATE TABLE `moviecast` (
  `castid` int(11) NOT NULL AUTO_INCREMENT,
  `addedby` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`castid`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `moviecast_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `moviecast` */

insert  into `moviecast`(`castid`,`addedby`,`dateadded`) values 
(0,3,'2024-08-03 19:16:22');

/*Table structure for table `movielanguage` */

DROP TABLE IF EXISTS `movielanguage`;

CREATE TABLE `movielanguage` (
  `languageid` int(11) NOT NULL AUTO_INCREMENT,
  `languagename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  PRIMARY KEY (`languageid`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `movielanguage_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `movielanguage` */

insert  into `movielanguage`(`languageid`,`languagename`,`dateadded`,`addedby`) values 
(1,'english','2024-07-15 11:22:02',1),
(2,'espanol','0000-00-00 00:00:00',2),
(4,'italiano','2024-07-02 11:22:36',3),
(5,'swahili','2024-08-08 11:22:53',3),
(6,'borana','2024-07-21 11:23:04',4),
(7,'nandi','2024-07-16 11:23:18',5),
(8,'gusii','2024-06-30 11:23:32',4),
(9,'giriama','2024-05-12 11:23:45',3),
(10,'bukusu','2024-07-14 11:24:01',4),
(11,'akamba','2024-08-09 11:24:20',3),
(12,'latino','2024-07-22 11:24:36',3);

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `ratingid` int(11) NOT NULL AUTO_INCREMENT,
  `ratingvalue` float NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  PRIMARY KEY (`ratingid`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rating` */

insert  into `rating`(`ratingid`,`ratingvalue`,`dateadded`,`addedby`) values 
(2,4.5,'2024-07-28 10:55:12',1),
(3,5.5,'2024-08-02 10:55:36',2),
(4,9,'2024-02-13 10:55:56',2),
(5,7,'2024-12-06 10:56:17',3),
(6,7.9,'2024-06-30 10:56:32',4),
(7,3,'2024-10-01 10:56:46',5);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `roledescription` varchar(1000) NOT NULL,
  `addedby` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`roleid`),
  KEY `addedby` (`addedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`userid`,`username`,`password`,`firstname`,`lastname`) values 
(1,'admin','admin','system','admin'),
(2,'user1','user1','dog ','user'),
(3,'user2','user2','tree','user'),
(4,'user3','user3','cloud','user'),
(5,'user4','user4','fire','user');

/* Procedure structure for procedure `sp_addactor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_addactor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addactor`(
	$firstname varchar(50),
	$lastname  VARCHAR(50),
	$stagename VARCHAR(50),
	$addedby int(11)
)
insert into `movie`.`actors` (`firstname`,`lastname`,`stagename`,`adddedby`)
values ($firstname, $lastname, $stagename, $addedby) */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmovielingo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmovielingo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmovielingo`()
select* from userview1 */$$
DELIMITER ;

/*Table structure for table `userview1` */

DROP TABLE IF EXISTS `userview1`;

/*!50001 DROP VIEW IF EXISTS `userview1` */;
/*!50001 DROP TABLE IF EXISTS `userview1` */;

/*!50001 CREATE TABLE  `userview1`(
 `movieid` int(11) ,
 `title` varchar(50) ,
 `release date` datetime ,
 `costid` float ,
 `ratingid` int(11) ,
 `genreid` int(11) ,
 `languageid` int(11) ,
 `addedby` int(11) ,
 `dateadded` datetime ,
 `castid` int(11) ,
 `movielingo` varchar(50) 
)*/;

/*View structure for view userview1 */

/*!50001 DROP TABLE IF EXISTS `userview1` */;
/*!50001 DROP VIEW IF EXISTS `userview1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userview1` AS select `movie`.`movieid` AS `movieid`,`movie`.`title` AS `title`,`movie`.`release date` AS `release date`,`movie`.`costid` AS `costid`,`movie`.`ratingid` AS `ratingid`,`movie`.`genreid` AS `genreid`,`movie`.`languageid` AS `languageid`,`movie`.`addedby` AS `addedby`,`movie`.`dateadded` AS `dateadded`,`movie`.`castid` AS `castid`,(select `movielanguage`.`languagename` from `movielanguage` where `movielanguage`.`languageid` = `movie`.`languageid`) AS `movielingo` from `movie` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
