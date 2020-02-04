-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: zrlog
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `commTime` datetime DEFAULT NULL,
  `hide` bit(1) DEFAULT NULL,
  `have_read` bit(1) DEFAULT b'0' COMMENT '评论是否已读',
  `td` datetime DEFAULT NULL,
  `userComment` varchar(2048) DEFAULT NULL,
  `userHome` varchar(64) DEFAULT NULL,
  `userIp` varchar(64) DEFAULT NULL,
  `userMail` varchar(64) DEFAULT NULL,
  `userName` varchar(64) DEFAULT NULL,
  `logId` int(11) DEFAULT NULL,
  `postId` varchar(128) DEFAULT NULL COMMENT '多说评论使用',
  `header` varchar(1024) DEFAULT NULL COMMENT '评论者头像',
  `user_agent` varchar(1024) DEFAULT NULL COMMENT '浏览器信息',
  `reply_id` int(11) DEFAULT NULL COMMENT '回复评论的ID',
  PRIMARY KEY (`commentId`),
  UNIQUE KEY `postId` (`postId`),
  KEY `logId` (`logId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`logId`) REFERENCES `log` (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `linkId` int(11) NOT NULL AUTO_INCREMENT,
  `alt` varchar(255) DEFAULT NULL,
  `linkName` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`linkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) DEFAULT NULL,
  `canComment` bit(1) DEFAULT b'1',
  `click` int(11) DEFAULT '0',
  `content` longtext,
  `plain_content` longtext,
  `markdown` longtext,
  `digest` text,
  `keywords` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `recommended` bit(1) DEFAULT b'0',
  `releaseTime` datetime DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `hot` bit(1) DEFAULT NULL,
  `rubbish` bit(1) DEFAULT NULL,
  `private` bit(1) DEFAULT NULL,
  `editor_type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`logId`),
  KEY `typeId` (`typeId`),
  KEY `userId` (`userId`),
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `type` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'hello-world','',0,'<blockquote>\n<p>Hello World 中文意思是『世界，你好』。因为《The C Programme Language》中使用它做为第一个演示程序，非常著名，所以后来的程序员在学习编程或进行设备调试时延续了这一习惯</p>\n</blockquote>\n<p>ZrLog是使用Java开发的博客/CMS程序，具有简约，易用，组件化，内存占用低等特点。自带Markdown编辑器，让更多的精力放在写作上，而不是花费大量时间在学习程序的使用上</p>\n<p>现在你可以通过访问 <a href=\"/zrlog/admin/index?id=1#article_edit\">admin</a> 编辑或删除这篇文章，然后开始愉快的写作吧</p>\n','Hello World 中文意思是『世界，你好』。因为《The C Programme Language》中使用它做为第一个演示程序，非常著名，所以后来的程序员在学习编程或进行设备调试时延续了这一习惯 ZrLog是使用Java开发的博客/CMS程序，具有简约，易用，组件化，内存占用低等特点。自带Markdown编辑器，让更多的精力放在写作上，而不是花费大量时间在学习程序的使用上 现在你可以通过访问 admin 编辑或删除这篇文章，然后开始愉快的写作吧','> Hello World 中文意思是『世界，你好』。因为《The C Programme Language》中使用它做为第一个演示程序，非常著名，所以后来的程序员在学习编程或进行设备调试时延续了这一习惯\n\nZrLog是使用Java开发的博客/CMS程序，具有简约，易用，组件化，内存占用低等特点。自带Markdown编辑器，让更多的精力放在写作上，而不是花费大量时间在学习程序的使用上\n\n现在你可以通过访问 [admin](/zrlog/admin/index?id=1#article_edit) 编辑或删除这篇文章，然后开始愉快的写作吧','<p>Hello World 中文意思是『世界，你好』。因为《The C Programme Language》中使用它做为第一个演示程序，非常著名，所以后来的程序员在学习编程或进行设备调试时延续了这一习惯</p><p>ZrLog是使用Java开发的博客/CMS程序，具有简约，易用，组件化，内存占用低等特点。自带Markdown编辑器，让更多的精力放在写作上，而不是花费大量时间在学习程序的使用上</p> ...','记录',NULL,'\0','2020-02-04 10:55:03','2020-02-04 10:55:03','你好，世界！',1,1,NULL,'\0','\0',NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lognav`
--

DROP TABLE IF EXISTS `lognav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lognav` (
  `navId` int(11) NOT NULL AUTO_INCREMENT,
  `navName` varchar(32) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`navId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lognav`
--

LOCK TABLES `lognav` WRITE;
/*!40000 ALTER TABLE `lognav` DISABLE KEYS */;
INSERT INTO `lognav` VALUES (1,'主页',1,'/'),(2,'管理',2,'/admin/login');
/*!40000 ALTER TABLE `lognav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `pluginId` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `isSystem` bit(1) DEFAULT NULL,
  `pTitle` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `pluginName` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`pluginId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES (1,NULL,'','分类',NULL,'types',3),(2,NULL,'','标签',NULL,'tags',3),(3,NULL,'','友链',NULL,'links',2),(4,NULL,'','存档',NULL,'archives',3);
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '0',
  `text` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`tagId`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,1,'记录');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(32) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `typeName` varchar(128) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeId`),
  KEY `pid` (`pid`),
  CONSTRAINT `type_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `type` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'note','','记录',NULL);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `userName` varchar(16) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `secretKey` varchar(1024) DEFAULT NULL COMMENT '密钥',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lishiming@qq.com','f6abfd47daf4ad5479eb47c0cd5d4221','admin',NULL,'aba1d977-06cf-4e05-9275-18a13c4d8984');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website` (
  `siteId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` longtext,
  `remark` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`siteId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES (1,'rows','10',NULL),(2,'template','/include/templates/default',NULL),(3,'autoUpgradeVersion','86400',NULL),(4,'title','aminglinux',NULL),(5,'second_title','aminglinux',NULL),(6,'language','zh_CN',NULL),(7,'zrlogSqlVersion','8',NULL),(8,'request_statistics','[{\"url\":\"http://192.168.120.140:8080/zrlog/\",\"userAgent\":\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36\",\"requestTime\":1580813708182,\"ip\":\"192.168.120.107\",\"deal\":false,\"requestUri\":\"/install/install\"},{\"url\":\"http://192.168.120.140:8080/zrlog/\",\"userAgent\":\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36\",\"requestTime\":1580813878421,\"ip\":\"192.168.120.107\",\"deal\":false,\"requestUri\":\"/\"},{\"url\":\"http://192.168.120.140:8080/zrlog/\",\"userAgent\":\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36\",\"requestTime\":1580813878435,\"ip\":\"192.168.120.107\",\"deal\":false,\"requestUri\":\"/\"}]',NULL),(9,'article_request_statistics','[]',NULL),(10,'plugin_core_db_key','{\"pluginInfoMap\":{},\"setting\":{\"disableAutoDownloadLostFile\":false}}',NULL);
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-04 19:28:54
