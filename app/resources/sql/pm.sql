DROP DATABASE pm;

CREATE DATABASE  IF NOT EXISTS pm;
use pm;

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `id`  int(11)  NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `accountType` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `avatar` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `User_username_unique` (`username`)
) ;
DROP TABLE IF EXISTS `Project`;
CREATE TABLE `Project` (
  id  int(11)  NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) DEFAULT NULL,
  `projectDescription` text,

  `projectDeadline` datetime DEFAULT NULL,
`creator`  int(11)  NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  CONSTRAINT `project_user` FOREIGN KEY (`creator`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ;
DROP TABLE IF EXISTS `Event`;

CREATE TABLE `Event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventName` varchar(255) DEFAULT NULL,
  `eventDescription` text,
  `eventDeadline`  datetime DEFAULT NULL,
  `assignedBy`  int(11)  NOT NULL,
  `eventStatus` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
   CONSTRAINT `event_user` FOREIGN KEY (`assignedBy`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ;


DROP TABLE IF EXISTS `Message`;


CREATE TABLE `Message` (
  id  int(11)  NOT NULL AUTO_INCREMENT,
  `msg_body` text,
  `timestamp` datetime NOT NULL,
  `sender_id`  int(11)  NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
  id  int(11)  NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) DEFAULT NULL,
  `groupDescription` text,

  `project_id`   int(11)  NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  CONSTRAINT `group_project` FOREIGN KEY (`project_id`) REFERENCES `Project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (`id`)
) ;
DROP TABLE IF EXISTS `User_Group`;
CREATE TABLE User_Group (
    group_id int(11)  NOT NULL,
    user_id int(11)  NOT NULL,
     CONSTRAINT `user_group1` FOREIGN KEY (`group_id`) REFERENCES `Group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
      CONSTRAINT `user_group2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (group_id, user_id)
) 