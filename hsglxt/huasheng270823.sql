/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.17 : Database - huasheng
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`huasheng` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `huasheng`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `aid` INT(11) NOT NULL AUTO_INCREMENT,
  `aname` VARCHAR(20) NOT NULL,
  `apwd` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

INSERT  INTO `t_admin`(`aid`,`aname`,`apwd`) VALUES (1,'admin','123456');

/*Table structure for table `t_partner` */

DROP TABLE IF EXISTS `t_partner`;

CREATE TABLE `t_partner` (
  `pid` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_name` VARCHAR(50) NOT NULL,
  `organization` VARCHAR(50) NOT NULL,
  `business_license` VARCHAR(50) NOT NULL,
  `regist_capital` INT(11) DEFAULT NULL,
  `company_phone` VARCHAR(20) DEFAULT NULL,
  `company_address` VARCHAR(50) DEFAULT NULL,
  `contact_phone` VARCHAR(20) DEFAULT NULL,
  `contact_email` VARCHAR(30) DEFAULT NULL,
  `password` VARCHAR(20) DEFAULT NULL,
  `logo` VARCHAR(100) DEFAULT NULL,
  `company_profile` VARCHAR(300) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_partner` */

INSERT  INTO `t_partner`(`pid`,`contact_name`,`organization`,`business_license`,`regist_capital`,`company_phone`,`company_address`,`contact_phone`,`contact_email`,`password`,`logo`,`company_profile`) VALUES (6,'asdfasdf','asdfasdf','asdfasdf',111111,'asdfasdfa','asdfasdf','asdfasdf','asdfasfd','asdfasdf','../../img/person.png','阿斯顿发士大夫撒打发打发');

/*Table structure for table `t_partner_pj` */

DROP TABLE IF EXISTS `t_partner_pj`;

CREATE TABLE `t_partner_pj` (
  `pjid` INT(11) NOT NULL,
  `pid` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `t_partner_pj` */

INSERT  INTO `t_partner_pj`(`pjid`,`pid`) VALUES (11,6);

/*Table structure for table `t_project` */

DROP TABLE IF EXISTS `t_project`;

CREATE TABLE `t_project` (
  `pjid` INT(11) NOT NULL AUTO_INCREMENT,
  `pjname` VARCHAR(50) NOT NULL,
  `customname` VARCHAR(50) NOT NULL,
  `pjaddress` VARCHAR(80) NOT NULL,
  `pjvolume` INT(11) NOT NULL,
  `developer` VARCHAR(50) NOT NULL,
  `contractor` VARCHAR(50) NOT NULL,
  `designer` VARCHAR(50) NOT NULL,
  `supervisor` VARCHAR(50) NOT NULL,
  `construction` VARCHAR(50) NOT NULL,
  `constract` VARCHAR(50) NOT NULL,
  `tec_sche_demo` VARCHAR(50) NOT NULL,
  `entrancedate` VARCHAR(50) NOT NULL,
  `meterial_ton` INT(11) DEFAULT NULL,
  `steel_content` DECIMAL(6,4) DEFAULT NULL,
  PRIMARY KEY (`pjid`)
) ENGINE=INNODB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `t_project` */

INSERT  INTO `t_project`(`pjid`,`pjname`,`customname`,`pjaddress`,`pjvolume`,`developer`,`contractor`,`designer`,`supervisor`,`construction`,`constract`,`tec_sche_demo`,`entrancedate`,`meterial_ton`,`steel_content`) VALUES (11,'地铁一号线','索为科技','中山路',1000,'索为科技','索为科技','索为科技','索为科技','索为科技','654646','通过','2017-01-01',200000,'56.3000');

/*Table structure for table `t_projectschedule` */

DROP TABLE IF EXISTS `t_projectschedule`;

CREATE TABLE `t_projectschedule` (
  `pjid` INT(11) NOT NULL DEFAULT '0',
  `sid` INT(11) NOT NULL DEFAULT '0',
  `status` INT(1) DEFAULT NULL,
  PRIMARY KEY (`pjid`,`sid`),
  KEY `fk_sid` (`sid`),
  CONSTRAINT `fk_pjid` FOREIGN KEY (`pjid`) REFERENCES `t_project` (`pjid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sid` FOREIGN KEY (`sid`) REFERENCES `t_schedule` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `t_projectschedule` */

INSERT  INTO `t_projectschedule`(`pjid`,`sid`,`status`) VALUES (11,1,1),(11,2,1),(11,3,1),(11,4,1),(11,5,0),(11,6,0),(11,7,0),(11,8,0),(11,9,0),(11,10,0),(11,11,0);

/*Table structure for table `t_projectstatus` */

DROP TABLE IF EXISTS `t_projectstatus`;

CREATE TABLE `t_projectstatus` (
  `pjsid` INT(11) NOT NULL AUTO_INCREMENT,
  `pjid` INT(11) NOT NULL DEFAULT '0',
  `addtime` VARCHAR(50) NOT NULL,
  `pjstatus` VARCHAR(300) DEFAULT NULL,
  PRIMARY KEY (`pjsid`,`pjid`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_projectstatus` */

INSERT  INTO `t_projectstatus`(`pjsid`,`pjid`,`addtime`,`pjstatus`) VALUES (1,11,'2017-05-11','asdfasdfasdfasdf'),(2,11,'2017-05-11','asdfasdfasdfasdf');

/*Table structure for table `t_schedule` */

DROP TABLE IF EXISTS `t_schedule`;

CREATE TABLE `t_schedule` (
  `sid` INT(11) NOT NULL AUTO_INCREMENT,
  `sname` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=INNODB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_schedule` */

INSERT  INTO `t_schedule`(`sid`,`sname`) VALUES (1,'合同立项'),(2,'甲方论证'),(3,'物料进场'),(4,'劳务施工'),(5,'架体验收'),(6,'甲方施工-支模'),(7,'甲方施工-绑筋'),(8,'甲方施工-灌浆'),(9,'甲方施工-胀拉'),(10,'折架撤场'),(11,'后期维护');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `usertype` VARCHAR(20) DEFAULT NULL,
  `password` VARCHAR(20) NOT NULL,
  `tel` VARCHAR(20) DEFAULT NULL,
  `email` VARCHAR(30) DEFAULT NULL,
  `icon` VARCHAR(200) DEFAULT NULL,
  `level` INT(1) DEFAULT NULL,
  `flag` INT(1) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

/*Table structure for table `t_user_pj` */

DROP TABLE IF EXISTS `t_user_pj`;

CREATE TABLE `t_user_pj` (
  `pjid` INT(11) NOT NULL,
  `uid` INT(11) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_pj` */

/*Table structure for table `t_website` */

DROP TABLE IF EXISTS `t_website`;

CREATE TABLE `t_website` (
  `wid` INT(11) NOT NULL,
  `wname` VARCHAR(30) NOT NULL,
  `wurl` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`wid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `t_website` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
