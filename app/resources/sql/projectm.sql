/*
Navicat MySQL Data Transfer

Source Server         : new
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : pm

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-11-16 15:05:27
*/

use pm;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `application`
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_group_application` (`groupId`),
  KEY `fk_user_application` (`from`),
  CONSTRAINT `fk_group_application` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_application` FOREIGN KEY (`from`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('4', '4', '2', '2017-11-16 12:23:03', 'finished', '3');

-- ----------------------------
-- Table structure for `event`
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `eventName` varchar(255) DEFAULT NULL,
  `eventDescription` text,
  `eventDeadline` datetime DEFAULT NULL,
  `assignedBy` int(11) NOT NULL,
  `eventStatus` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `assignedTo` int(11) DEFAULT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_user` (`assignedBy`),
  CONSTRAINT `event_user` FOREIGN KEY (`assignedBy`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1', '2', 'new task', 'new', '2017-12-17 15:15:00', '2', 'started', '2017-11-04 23:42:05', '2', '2017-11-16 14:51:20');
INSERT INTO `event` VALUES ('2', '2', 'newtitle', 'newdescription', '2017-11-05 00:00:00', '2', 'started', '2017-11-04 23:42:29', '2', '2017-11-11 18:53:13');
INSERT INTO `event` VALUES ('3', '2', 'title2', '232323', '2017-11-05 00:00:00', '2', 'started', '2017-11-05 13:05:58', '2', '2017-11-05 13:05:58');
INSERT INTO `event` VALUES ('4', '2', 'title2', '232323', '2017-11-05 00:00:00', '2', 'started', '2017-11-05 13:46:09', '2', '2017-11-05 13:46:09');
INSERT INTO `event` VALUES ('5', '2', 'title2', '232323', '2017-11-11 18:04:02', '2', 'started', '2017-11-11 18:04:02', '2', '2017-11-11 18:04:02');
INSERT INTO `event` VALUES ('6', '2', 'title2', '232323', '2017-11-11 18:05:55', '2', 'started', '2017-11-11 18:05:56', '2', '2017-11-11 18:05:56');
INSERT INTO `event` VALUES ('7', '2', 'title2', '232323', '2017-11-11 18:06:38', '2', 'started', '2017-11-11 18:06:38', '2', '2017-11-11 18:06:38');

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `cover` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) DEFAULT NULL,
  `groupDescription` text,
  `project_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_project` (`project_id`),
  CONSTRAINT `group_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (null, '1', 'personal', null, '1', '2000-01-01 00:00:00', '2000-01-01 00:00:00');
INSERT INTO `group` VALUES ('images/group/2.gif', '2', 'G8', 'description', '2', '2017-11-04 23:21:45', '2017-11-04 23:21:48');
INSERT INTO `group` VALUES (null, '3', 'Group For test service', 'desc', '3', '2017-11-14 10:44:45', '2017-11-14 10:44:45');
INSERT INTO `group` VALUES (null, '4', 'Group For test service', 'desc', '4', '2017-11-14 10:49:16', '2017-11-14 10:49:16');
INSERT INTO `group` VALUES (null, '5', 'Group For test service', 'desc', '7', '2017-11-14 10:56:34', '2017-11-14 10:56:34');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_body` text,
  `timestamp` datetime NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `message_ibfk_group` (`group_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('23', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-08 22:43:15', '2', '2');
INSERT INTO `message` VALUES ('24', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-08 22:43:16', '2', '2');
INSERT INTO `message` VALUES ('25', '{\"body\":\"444\",\"username\":\"q45hu\"}', '2017-11-08 22:44:18', '2', '2');
INSERT INTO `message` VALUES ('26', '{\"body\":\"55555\",\"username\":\"q45hu\"}', '2017-11-08 22:45:25', '2', '2');
INSERT INTO `message` VALUES ('27', '{\"body\":\"23233\",\"username\":\"q45hu\"}', '2017-11-08 23:02:39', '2', '2');
INSERT INTO `message` VALUES ('28', '{\"body\":\"3\",\"username\":\"q45hu\"}', '2017-11-08 23:02:50', '2', '2');
INSERT INTO `message` VALUES ('29', '{\"body\":\"33333333\",\"username\":\"q45hu\"}', '2017-11-08 23:03:11', '2', '2');
INSERT INTO `message` VALUES ('30', '{\"body\":\"33333\",\"username\":\"q45hu\"}', '2017-11-08 23:03:19', '2', '2');
INSERT INTO `message` VALUES ('31', '{\"body\":\"33333\",\"username\":\"q45hu\"}', '2017-11-08 23:04:17', '2', '2');
INSERT INTO `message` VALUES ('32', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-08 23:04:30', '2', '2');
INSERT INTO `message` VALUES ('33', '{\"body\":\"3333\",\"username\":\"q45hu\"}', '2017-11-08 23:04:41', '2', '2');
INSERT INTO `message` VALUES ('34', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-08 23:05:58', '2', '2');
INSERT INTO `message` VALUES ('35', '{\"body\":\"33333\",\"username\":\"q45hu\"}', '2017-11-08 23:06:08', '2', '2');
INSERT INTO `message` VALUES ('36', '{\"body\":\"44444\",\"username\":\"q45hu\"}', '2017-11-08 23:06:53', '2', '2');
INSERT INTO `message` VALUES ('37', '{\"body\":\"4444\",\"username\":\"q45hu\"}', '2017-11-08 23:06:54', '2', '2');
INSERT INTO `message` VALUES ('38', '{\"body\":\"4444\",\"username\":\"q45hu\"}', '2017-11-08 23:06:55', '2', '2');
INSERT INTO `message` VALUES ('39', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-09 09:06:08', '2', '2');
INSERT INTO `message` VALUES ('40', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-09 09:10:05', '2', '2');
INSERT INTO `message` VALUES ('41', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-09 09:10:50', '2', '2');
INSERT INTO `message` VALUES ('42', '{\"body\":\"33333\",\"username\":\"q45hu\"}', '2017-11-09 09:13:09', '2', '2');
INSERT INTO `message` VALUES ('43', '{\"body\":\"33333333\",\"username\":\"q45hu\"}', '2017-11-09 09:19:36', '2', '2');
INSERT INTO `message` VALUES ('44', '{\"body\":\"3333333\",\"username\":\"q45hu\"}', '2017-11-09 09:19:57', '2', '2');
INSERT INTO `message` VALUES ('45', '{\"body\":\"55555\",\"username\":\"q45hu\"}', '2017-11-09 09:20:51', '2', '2');
INSERT INTO `message` VALUES ('46', '{\"body\":\"66666\",\"username\":\"q45hu\"}', '2017-11-09 09:20:53', '2', '2');
INSERT INTO `message` VALUES ('47', '{\"body\":\"7777\",\"username\":\"q45hu\"}', '2017-11-09 09:20:54', '2', '2');
INSERT INTO `message` VALUES ('48', '{\"body\":\"555\",\"username\":\"q45hu\"}', '2017-11-09 09:28:39', '2', '2');
INSERT INTO `message` VALUES ('49', '{\"body\":\"555555555\",\"username\":\"q45hu\"}', '2017-11-09 09:28:54', '2', '2');
INSERT INTO `message` VALUES ('50', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-09 09:31:19', '2', '2');
INSERT INTO `message` VALUES ('51', '{\"body\":\"3333\",\"username\":\"q45hu\"}', '2017-11-09 09:33:02', '2', '2');
INSERT INTO `message` VALUES ('52', '{\"body\":\"444\",\"username\":\"q45hu\"}', '2017-11-09 09:33:10', '2', '2');
INSERT INTO `message` VALUES ('53', '{\"body\":\"444\",\"username\":\"q45hu\"}', '2017-11-09 09:33:14', '2', '2');
INSERT INTO `message` VALUES ('54', '{\"body\":\"4444\",\"username\":\"q45hu\"}', '2017-11-09 09:33:42', '2', '2');
INSERT INTO `message` VALUES ('55', '{\"body\":\"555\",\"username\":\"q45hu\"}', '2017-11-09 09:34:06', '2', '2');
INSERT INTO `message` VALUES ('56', '{\"body\":\"555555\",\"username\":\"q45hu\"}', '2017-11-09 09:44:54', '2', '2');
INSERT INTO `message` VALUES ('57', '{\"body\":\"666\",\"username\":\"q45hu\"}', '2017-11-09 09:45:31', '2', '2');
INSERT INTO `message` VALUES ('58', '{\"body\":\"3333333\",\"username\":\"q45hu\"}', '2017-11-11 15:55:47', '2', '2');
INSERT INTO `message` VALUES ('59', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-11 16:13:47', '2', '2');
INSERT INTO `message` VALUES ('60', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-11 16:17:29', '2', '2');
INSERT INTO `message` VALUES ('61', '{\"body\":\"333333\",\"username\":\"q45hu\"}', '2017-11-11 16:19:18', '2', '2');
INSERT INTO `message` VALUES ('62', '{\"body\":\"3333333\",\"username\":\"q45hu\"}', '2017-11-11 16:19:30', '2', '2');
INSERT INTO `message` VALUES ('63', '{\"body\":\"5555\",\"username\":\"q45hu\"}', '2017-11-11 16:20:01', '2', '2');
INSERT INTO `message` VALUES ('64', '{\"body\":\"333333\",\"username\":\"q45hu\"}', '2017-11-11 16:21:33', '2', '2');
INSERT INTO `message` VALUES ('65', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-11 16:23:28', '2', '2');
INSERT INTO `message` VALUES ('66', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-11 16:24:46', '2', '2');
INSERT INTO `message` VALUES ('67', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-11 16:29:20', '2', '2');
INSERT INTO `message` VALUES ('68', '{\"body\":\"3333\",\"username\":\"q45hu\"}', '2017-11-11 16:31:32', '2', '2');
INSERT INTO `message` VALUES ('69', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-11 16:34:18', '2', '2');
INSERT INTO `message` VALUES ('70', '{\"body\":\"444\",\"username\":\"q45hu\"}', '2017-11-11 16:34:20', '2', '2');
INSERT INTO `message` VALUES ('71', '{\"body\":\"333\",\"username\":\"q45hu\"}', '2017-11-12 01:41:27', '2', '2');
INSERT INTO `message` VALUES ('72', '{\"body\":\"444\",\"username\":\"q45hu\"}', '2017-11-12 01:41:31', '2', '2');
INSERT INTO `message` VALUES ('73', '{\"body\":\"55555\",\"username\":\"q45hu\"}', '2017-11-12 01:41:33', '2', '2');
INSERT INTO `message` VALUES ('74', '{\"body\":\"666\",\"username\":\"q45hu\"}', '2017-11-12 01:43:47', '2', '2');
INSERT INTO `message` VALUES ('75', '{\"body\":\"444\",\"username\":\"q45hu\"}', '2017-11-13 00:22:45', '2', '2');
INSERT INTO `message` VALUES ('76', '{\"body\":\"444\",\"username\":\"q45hu\"}', '2017-11-13 09:23:56', '2', '2');
INSERT INTO `message` VALUES ('77', '{\"body\":\"555\",\"username\":\"q45hu\"}', '2017-11-13 09:24:00', '2', '2');
INSERT INTO `message` VALUES ('78', '{\"body\":\"2222222\",\"username\":\"q45hu\"}', '2017-11-13 09:25:36', '2', '2');
INSERT INTO `message` VALUES ('79', '{\"body\":\"wwwww\",\"username\":\"q45hu\"}', '2017-11-13 09:25:55', '2', '2');
INSERT INTO `message` VALUES ('80', '{\"body\":\"wwwwwww\",\"username\":\"q45hu\"}', '2017-11-13 09:26:03', '2', '2');
INSERT INTO `message` VALUES ('81', '{\"body\":\"222\",\"username\":\"q45hu\"}', '2017-11-13 09:59:34', '2', '2');
INSERT INTO `message` VALUES ('82', '{\"body\":\"123\",\"username\":\"q45hu\"}', '2017-11-14 08:57:12', '2', '2');
INSERT INTO `message` VALUES ('83', '{\"body\":\"2222\",\"username\":\"q45hu\"}', '2017-11-15 10:25:05', '5', '2');
INSERT INTO `message` VALUES ('84', '{\"body\":\"wwwwww\",\"username\":\"q45hu\"}', '2017-11-15 10:28:59', '2', '2');
INSERT INTO `message` VALUES ('85', '{\"body\":\"wwwww\",\"username\":\"q45hu\"}', '2017-11-15 10:29:14', '2', '2');
INSERT INTO `message` VALUES ('86', '{\"body\":\"1212121212\",\"username\":\"q45hu\"}', '2017-11-15 10:29:16', '2', '2');
INSERT INTO `message` VALUES ('87', '{\"body\":\"232323\",\"username\":\"q45hu\"}', '2017-11-15 10:50:04', '2', '2');
INSERT INTO `message` VALUES ('88', '{\"body\":\"22222\",\"username\":\"q45hu\"}', '2017-11-15 15:23:49', '2', '2');
INSERT INTO `message` VALUES ('89', '{\"body\":\"33333\",\"username\":\"q45hu\"}', '2017-11-15 15:24:05', '2', '2');
INSERT INTO `message` VALUES ('90', '{\"body\":\"12323232323\",\"username\":\"q45hu\"}', '2017-11-15 15:25:08', '2', '2');
INSERT INTO `message` VALUES ('91', '{\"body\":\"1232323\",\"username\":\"q45hu\"}', '2017-11-15 15:28:07', '2', '2');
INSERT INTO `message` VALUES ('92', '{\"body\":\"3333\",\"username\":\"q45hu\"}', '2017-11-15 15:33:33', '2', '2');
INSERT INTO `message` VALUES ('93', '{\"body\":\"233232323\",\"username\":\"q45hu\"}', '2017-11-15 17:27:14', '2', '2');
INSERT INTO `message` VALUES ('94', '{\"body\":\"121212\",\"username\":\"q45hu\"}', '2017-11-15 17:27:29', '2', '2');
INSERT INTO `message` VALUES ('95', '{\"body\":\"222222\",\"username\":\"q45hu\"}', '2017-11-15 17:27:41', '2', '2');
INSERT INTO `message` VALUES ('96', '{\"body\":\"3434343434\",\"username\":\"y300fang\"}', '2017-11-15 17:35:20', '2', '3');
INSERT INTO `message` VALUES ('97', '{\"body\":\"eeeeeeeeee\",\"username\":\"q45hu\"}', '2017-11-15 17:40:06', '2', '2');
INSERT INTO `message` VALUES ('98', '{\"body\":\"1232323\",\"username\":\"q45hu\"}', '2017-11-15 17:52:50', '2', '2');
INSERT INTO `message` VALUES ('99', '{\"body\":\"222222\",\"username\":\"q45hu\"}', '2017-11-15 17:53:13', '2', '2');
INSERT INTO `message` VALUES ('100', '{\"body\":\"3333\",\"username\":\"q45hu\"}', '2017-11-15 17:54:30', '2', '2');
INSERT INTO `message` VALUES ('101', '{\"body\":\"3333333\",\"username\":\"y300fang\"}', '2017-11-15 17:55:18', '2', '3');
INSERT INTO `message` VALUES ('102', '{\"body\":\"3333333333\",\"username\":\"y300fang\"}', '2017-11-15 17:55:58', '2', '3');
INSERT INTO `message` VALUES ('103', '{\"body\":\"122323232\",\"username\":\"y300fang\"}', '2017-11-15 22:21:49', '3', '3');
INSERT INTO `message` VALUES ('104', '{\"body\":\"2323232323\",\"username\":\"y300fang\"}', '2017-11-15 22:21:59', '3', '3');
INSERT INTO `message` VALUES ('105', '{\"body\":\"4545454545\",\"username\":\"q45hu\"}', '2017-11-16 14:52:23', '2', '2');
INSERT INTO `message` VALUES ('106', '{\"body\":\"3333333\",\"username\":\"q45hu\"}', '2017-11-16 14:52:38', '5', '2');
INSERT INTO `message` VALUES ('107', '{\"body\":\"3434343434\",\"username\":\"y300fang\"}', '2017-11-16 14:53:24', '4', '3');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) DEFAULT NULL,
  `projectDescription` text,
  `projectDeadline` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user` (`creator`),
  CONSTRAINT `project_user` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'personal', null, null, '1', '2000-01-01 00:00:00', '2000-01-01 00:00:00');
INSERT INTO `project` VALUES ('2', 'pm', 'description', '2017-11-26 23:20:47', '2', '2017-11-04 23:20:55', '2017-11-04 23:21:03');
INSERT INTO `project` VALUES ('3', 'test service', 'desc', '2017-11-14 10:44:45', '2', '2017-11-14 10:44:45', '2017-11-14 10:44:45');
INSERT INTO `project` VALUES ('4', 'test service', 'desc', '2017-11-14 10:49:16', '2', '2017-11-14 10:49:16', '2017-11-14 10:49:16');
INSERT INTO `project` VALUES ('5', 'test service', 'desc', '2017-11-14 10:55:08', '2', '2017-11-14 10:55:08', '2017-11-14 10:55:08');
INSERT INTO `project` VALUES ('6', 'test service', 'desc', '2017-11-14 10:56:06', '2', '2017-11-14 10:56:06', '2017-11-14 10:56:06');
INSERT INTO `project` VALUES ('7', 'test service', 'desc', '2017-11-14 10:56:34', '2', '2017-11-14 10:56:34', '2017-11-14 10:56:34');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `accountType` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `User_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sys_admin', null, null, null, null, '2000-01-01 00:00:00', '2000-01-01 00:00:00', null);
INSERT INTO `user` VALUES ('2', 'q45hu', 'q45hu@uwaterloo.ca', '123', 'normal', 'q45hu', '2017-11-04 23:19:49', '2017-11-04 23:19:54', 'images/user/2.gif');
INSERT INTO `user` VALUES ('3', 'y300fang', 'y300fang@uwaterloo.ca', '123', 'normal', 'facebook', '2017-11-15 17:29:39', '2017-11-15 17:29:39', null);

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `user_group2` (`user_id`),
  CONSTRAINT `user_group1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_group2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('2', '2');
INSERT INTO `user_group` VALUES ('3', '2');
INSERT INTO `user_group` VALUES ('4', '2');
INSERT INTO `user_group` VALUES ('5', '2');
INSERT INTO `user_group` VALUES ('2', '3');
INSERT INTO `user_group` VALUES ('3', '3');
INSERT INTO `user_group` VALUES ('4', '3');

-- ----------------------------
-- Procedure structure for `add_application`
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_application`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_application`(
IN fromId int,
IN toId int,
IN groupId int
)
BEGIN   
DECLARE appid int;	
insert into application(application.from,application.to,groupId,application.timestamp,application.status) values(fromId,toId,groupId,NOW(),'started');
select max(id) into appid from application;
select application.*, `group`.groupName, `group`.groupDescription, `user`.username
from `group`,`user`,application
where application.`from` = `user`.id
and application.id = appid
and `group`.id = application.groupId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `add_a_project`
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_a_project`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_a_project`(
IN projectName varchar(255),
IN description varchar(255),
IN deadline datetime,
IN creatorId int,
OUT pid int
)
BEGIN   

insert into project(projectName,projectDescription,projectDeadline,creator,createdAt,updatedAt)
values(projectName,description,deadline,creatorId,NOW(),NOW());

select MAX(id) into pid from project;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `add_group`
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_group`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_group`(
IN gName VARCHAR(255),
IN description VARCHAR(255),
IN projectId INT,
IN creator INT
)
BEGIN   
declare gid int;

insert into `group`(groupName,groupDescription,project_id,createdAt,updatedAt)
values(gName,description,projectId,NOW(),NOW());


select max(id) into gid from `group`;

insert into user_group(user_id, group_id) values(creator,gid);

select `group`.*, creator
from `group`,project
where `group`.project_id = project.id
and `group`.id =gid;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `assign_event`
-- ----------------------------
DROP PROCEDURE IF EXISTS `assign_event`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_event`(
IN group_id int,
IN title varchar(255),
IN description varchar(255),
IN deadline datetime,
IN assignedBy int,
IN status varchar(255),
IN assignedTo int
)
BEGIN
DECLARE eid INT;
insert 
into event(group_id,eventName,eventDescription,eventDeadline,assignedBy,assignedTo,eventStatus,createdAt,updatedAt)
values(group_id,title,description,deadline,assignedBy,assignedTo,status,now(),now());

select MAX(id) into eid from event;

select event.*,groupName
from event,`group`
where event.id = eid;


end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delete_a_group`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_a_group`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_a_group`(
IN group_id int
)
BEGIN   
declare projectid int;

select project_id into projectid from `group`
where `group`.id = group_id;

delete from `group`
where `group`.id = group_id;

delete from project
where id = projectid;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delete_event`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_event`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_event`(
IN event_id int
)
BEGIN

delete from `event`
where `event`.id = event_id;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `drop_a_group`
-- ----------------------------
DROP PROCEDURE IF EXISTS `drop_a_group`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drop_a_group`(
IN group_id int,
IN user_id int
)
BEGIN   
delete from user_group
where user_group.user_id = user_id
and user_group.group_id = group_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `finish_application`
-- ----------------------------
DROP PROCEDURE IF EXISTS `finish_application`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `finish_application`(
IN appId int,
IN accept int
)
BEGIN   
declare groupId int;
declare toId int;
if accept = 1 THEN
select application.groupId,application.`to` into groupId,toId from application
where id = appId;
call join_a_group(groupId,toId);
END IF;

update application
set application.`status` = 'finished'
where application.id = appId;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_applications`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_applications`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_applications`(
IN user_id int
)
BEGIN   
	
select application.id,`from`,`timestamp`,`to`,groupId, `group`.groupName, `group`.groupDescription, `user`.username
from `group`,`user`,application
where application.`from` = `user`.id
and application.`to` = user_id
and `group`.id = application.groupId
and application.`status` = 'started';
  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_dates_having_events`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_dates_having_events`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dates_having_events`(
IN user_id int,
IN eventStatus varchar(255)
)
BEGIN   
	
select DISTINCT date(eventDeadline) as eventDate
from event
where event.assignedTo = user_id 
and event.eventStatus = eventStatus;
  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_event_by_date`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_event_by_date`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_by_date`(
IN userId int,
IN deadline datetime
)
BEGIN

select event.*,groupName
from event,`group`
where event.assignedTo = userId
and event.group_id = `group`.id
and date(`event`.eventDeadline) = deadline;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_event_by_group`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_event_by_group`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_by_group`(
IN groupId int,
IN userId int
)
BEGIN

select event.*,groupName
from event,`group`
where event.assignedTo = userId
and event.group_id = `group`.id
and `group`.id = groupId;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_event_by_id`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_event_by_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_by_id`(
IN eventId int
)
BEGIN

select event.*,groupName
from event,`group`
where event.id = eventId and event.group_id = `group`.id;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_groups_of_user`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_groups_of_user`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_groups_of_user`(
IN user_id int
)
BEGIN   
	SELECT  g.*,creator 
FROM `user` AS u, user_group AS ug, `group` AS g, project as p
  WHERE ug.user_id = u.id and u.id=user_id and g.id=ug.group_id and p.id = g.project_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_messages_before_time`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_messages_before_time`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_messages_before_time`(
IN gid int,
IN time datetime,
IN cnt int
)
BEGIN   
	
select message.*, `user`.avatar
from message,`user`
where group_id = gid and `user`.id = message.sender_id
and TIMEDIFF(message.`timestamp`,time)<0
order by message.`timestamp` DESC
limit 0,cnt;

  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `get_users_of_group`
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_users_of_group`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_users_of_group`(
IN group_id int
)
BEGIN   
	SELECT  u.* FROM pm.user AS u, pm.user_group AS ug, pm.group AS g
  WHERE ug.user_id = u.id and g.id = group_id and g.id=ug.group_id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `insert_a_group_chat_msg`
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_a_group_chat_msg`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_a_group_chat_msg`(
IN group_id int,
IN msg_body varchar(10000),
IN msg_datetime datetime,
IN sender_id int
)
BEGIN   
	INSERT INTO message(msg_body,timestamp,group_id,sender_id) 
	values(msg_body,msg_datetime,group_id,sender_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `join_a_group`
-- ----------------------------
DROP PROCEDURE IF EXISTS `join_a_group`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `join_a_group`(
IN group_id int,
IN user_id int
)
BEGIN   
insert into user_group(group_id,user_id) values (group_id,user_id);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `log_in_by_email`
-- ----------------------------
DROP PROCEDURE IF EXISTS `log_in_by_email`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_in_by_email`(
IN email varchar(255),
IN pwd varchar(255)
)
BEGIN   
select * 
from user 
where user.email = email 
and user.password = pwd;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `log_in_by_facebook`
-- ----------------------------
DROP PROCEDURE IF EXISTS `log_in_by_facebook`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_in_by_facebook`(
IN facebook varchar(255)
)
BEGIN   
select * 
from user 
where user.facebook = facebook;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `log_in_by_username`
-- ----------------------------
DROP PROCEDURE IF EXISTS `log_in_by_username`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_in_by_username`(
IN username varchar(255),
IN pwd varchar(255)
)
BEGIN   
	select * from user where user.username = username and user.password = pwd;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `register_new_account`
-- ----------------------------
DROP PROCEDURE IF EXISTS `register_new_account`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_new_account`(
IN username varchar(255),
IN email varchar(255),
IN pwd varchar(255),
IN accountType varchar(255),
OUT id int
)
BEGIN
IF exists(select id from user where user.email = email or user.username = username) THEN

select 0 into id;

ELSE
   
insert 
into user(username,email,password,accountType,createdAt,updatedAt,facebook)
values(username,email,pwd,accountType,now(),now(),"facebook");

select MAX(id) into id
from user;

END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `update_event`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_event`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_event`(
IN event_id int,
IN assignTo int,
IN title varchar(255),
IN description varchar(255),
IN deadline datetime
)
BEGIN

update `event`
set `event`.assignedTo = assignTo,
`event`.eventName = title,
`event`.eventDescription = description,
`event`.eventDeadline = deadline,
`event`.updatedAt = NOW()
where `event`.id = event_id;

select event.*,groupName
from event,`group`
where event.id = event_id;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `update_status_of_event`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_status_of_event`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_status_of_event`(
IN event_id int,
IN status varchar(255)
)
BEGIN

update `event`
set eventStatus = status,
`event`.updatedAt = NOW()
where `event`.id = event_id;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `update_user_info`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_user_info`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user_info`(
IN id int,
IN email varchar(255),
IN facebook varchar(255),
OUT result int
)
BEGIN
IF exists(select id from user where user.email = email) THEN

select 0 into result;

ELSE

IF facebook != "facebook" and exists(select id from user where user.facebook = facebook) THEN

select 0 into result;

ELSE

UPDATE user
set email = email,facebook = facebook
where id = id;

select 1 into result;

end if;

end if; 
END
;;
DELIMITER ;
