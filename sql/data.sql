-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: noj
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `post`
--

-- 创建库
create database if not exists noj;

-- 切换库
use noj;

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `tags` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `favourNum` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帖子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_favour`
--

DROP TABLE IF EXISTS `post_favour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_favour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_postId` (`postId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='帖子收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_favour`
--

LOCK TABLES `post_favour` WRITE;
/*!40000 ALTER TABLE `post_favour` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_favour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_thumb`
--

DROP TABLE IF EXISTS `post_thumb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_thumb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_postId` (`postId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='帖子点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_thumb`
--

LOCK TABLES `post_thumb` WRITE;
/*!40000 ALTER TABLE `post_thumb` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_thumb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `tags` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text COLLATE utf8mb4_unicode_ci COMMENT '题目答案',
  `submitNum` int(11) NOT NULL DEFAULT '0' COMMENT '题目提交数',
  `acceptedNum` int(11) NOT NULL DEFAULT '0' COMMENT '题目通过数',
  `judgeCase` text COLLATE utf8mb4_unicode_ci COMMENT '判题用例（json 数组）',
  `judgeConfig` text COLLATE utf8mb4_unicode_ci COMMENT '判题配置（json 对象）',
  `thumbNum` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `favourNum` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1804006552155320323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`id`, `title`, `content`, `tags`, `answer`, `submitNum`, `acceptedNum`, `judgeCase`, `judgeConfig`, `thumbNum`, `favourNum`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1802040610911232002,'A + C','## Description\n\nCalculate a+b\n\n## Input\n\nTwo integer a,b (0<=a,b<=10)\n\n## Output\n\nOutput a+b\n\n## Sample Input\n\n```\n1 2\n```\n\n## Sample Output\n\n```\n3\n```\n\n## Hint\n\nQ: Where are the input and the output?\n\nA: Your program shall always read input from stdin (Standard Input) and write output to stdout (Standard Output). For example, you can use \'scanf\' in C or \'cin\' in C++ to read from stdin, and use \'printf\' in C or \'cout\' in C++ to write to stdout.\n\nYou shall not output any extra data to standard output other than that required by the problem, otherwise you will get a \"Wrong Answer\".\n\nUser programs are not allowed to open and read from/write to files. You will get a \"Runtime Error\" or a \"Wrong Answer\"if you try to do so.','[\"new tag\"]','new answer',3,0,'[{\"input\":\"new in\",\"output\":\"new out\"}]','{\"timeLimit\":1,\"memoryLimit\":1,\"stackLimit\":1}',0,0,1801936658387472385,'2024-06-16 02:08:56','2024-06-16 17:39:43',0),(1802241150924369921,'A + B','## Description\n\nCalculate a+b\n\n## Input\n\nTwo integer a,b (0<=a,b<=10)\n\n## Output\n\nOutput a+b\n\n## Sample Input\n\n```\n1 2\n```\n\n## Sample Output\n\n```\n3\n```\n\n## Hint\n\nQ: Where are the input and the output?\n\nA: Your program shall always read input from stdin (Standard Input) and write output to stdout (Standard Output). For example, you can use \'scanf\' in C or \'cin\' in C++ to read from stdin, and use \'printf\' in C or \'cout\' in C++ to write to stdout.\n\nYou shall not output any extra data to standard output other than that required by the problem, otherwise you will get a \"Wrong Answer\".\n\nUser programs are not allowed to open and read from/write to files. You will get a \"Runtime Error\" or a \"Wrong Answer\"if you try to do so.','[\"二叉树\",\"中等\"]','tests他',0,0,'[{\"input\":\"1 2\",\"output\":\"3\"},{\"input\":\"2 2\",\"output\":\"4\"}]','{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}',0,0,1801936658387472385,'2024-06-16 15:25:49','2024-06-19 15:39:45',0),(1802248969157357570,'testUpdate','## Description\n\nCalculate a+b\n\n## Input\n\nTwo integer a,b (0<=a,b<=10)\n\n## Output\n\nOutput a+b\n\n## Sample Input\n\n```\n1 2\n```\n\n## Sample Output\n\n```\n3\n```\n\n## Hint\n\nQ: Where are the input and the output?\n\nA: Your program shall always read input from stdin (Standard Input) and write output to stdout (Standard Output). For example, you can use \'scanf\' in C or \'cin\' in C++ to read from stdin, and use \'printf\' in C or \'cout\' in C++ to write to stdout.\n\nYou shall not output any extra data to standard output other than that required by the problem, otherwise you will get a \"Wrong Answer\".\n\nUser programs are not allowed to open and read from/write to files. You will get a \"Runtime Error\" or a \"Wrong Answer\"if you try to do so.','[\"test\",\"简单\",\"new\"]','new 的撒大',0,0,'[{\"input\":\"new1\",\"output\":\"new2\"},{\"input\":\"new5\",\"output\":\"new6\"}]','{\"timeLimit\":1001,\"memoryLimit\":1001,\"stackLimit\":1001}',0,0,1801936658387472385,'2024-06-16 15:56:53','2024-06-19 15:26:23',0),(1804006552155320322,'两数之和','请输出两数之和\n## 示例输入\n1 2\n## 示例输出\n3','[\"简单\"]','sum(a+b)',4,1,'[{\"input\":\"1 2\",\"output\":\"3\"},{\"input\":\"3 4\",\"output\":\"7\"}]','{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}',0,0,1801936658387472385,'2024-06-21 12:20:53','2024-06-21 12:20:53',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_comment`
--

DROP TABLE IF EXISTS `question_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_comment` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `questionId` bigint(20) NOT NULL DEFAULT '0' COMMENT '问题id',
  `userId` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `userName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像',
  `content` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评论内容',
  `parentId` bigint(20) DEFAULT '-1' COMMENT '父级评论id\n',
  `commentNum` int(11) DEFAULT '0' COMMENT '回复条数',
  `likeCount` int(11) DEFAULT '0' COMMENT '点赞数量',
  `isLike` tinyint(1) DEFAULT '0' COMMENT '是否点赞',
  `likeListId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '点赞id列表',
  `inputShow` tinyint(1) DEFAULT '0' COMMENT '是否显示输入框',
  `fromId` bigint(20) DEFAULT NULL COMMENT '回复记录id\n',
  `fromName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '回复人名称\n',
  `gmtCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmtModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDeleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_comment`
--

LOCK TABLES `question_comment` WRITE;
/*!40000 ALTER TABLE `question_comment` DISABLE KEYS */;
INSERT INTO `question_comment` (`id`, `questionId`, `userId`, `userName`, `userAvatar`, `content`, `parentId`, `commentNum`, `likeCount`, `isLike`, `likeListId`, `inputShow`, `fromId`, `fromName`, `gmtCreate`, `gmtModified`, `isDeleted`) VALUES (1805994859395383297,1802040610911232002,1801936658387472385,NULL,NULL,'test',-1,1,1,1,'[1801936658387472385]',1,NULL,NULL,'2024-06-27 00:01:42','2024-06-27 00:01:42',1),(1806234076973207553,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','testReply',1805994859395383297,0,1,1,'[1801936658387472385]',0,1801936658387472385,NULL,'2024-06-27 15:52:16','2024-06-27 15:52:16',1),(1806234680109928450,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','testcomment',-1,0,0,0,'[]',0,-1,'','2024-06-27 15:54:40','2024-06-27 15:54:40',1),(1806234712880025601,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','testReply',1806234680109928450,0,1,1,'[1801936658387472385]',0,1801936658387472385,'若以','2024-06-27 15:54:48','2024-06-27 15:54:48',1),(1806240122412306433,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',1806234680109928450,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 16:16:18','2024-06-27 16:16:18',1),(1806283250452238338,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',1805994859395383297,0,0,0,'[]',0,1801936658387472385,NULL,'2024-06-27 19:07:40','2024-06-27 19:07:40',1),(1806283334422204418,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',1805994859395383297,0,0,0,'[]',0,1801936658387472385,NULL,'2024-06-27 19:08:00','2024-06-27 19:08:00',0),(1806283560306446338,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',-1,2,1,1,'[1801936658387472385]',1,-1,'','2024-06-27 19:08:54','2024-06-27 19:08:54',1),(1806283638656045058,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',1806283560306446338,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:09:13','2024-06-27 19:09:13',1),(1806283668179750914,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test2',1806283560306446338,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:09:20','2024-06-27 19:09:20',1),(1806283722122694657,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test3',1806283560306446338,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:09:33','2024-06-27 19:09:33',1),(1806290859288793089,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',-1,2,0,0,'[]',1,-1,'','2024-06-27 19:37:54','2024-06-27 19:37:54',1),(1806291430360059906,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','ttt',1806290859288793089,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:40:10','2024-06-27 19:40:10',1),(1806291612749369346,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','tst',1806290859288793089,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:40:54','2024-06-27 19:40:54',1),(1806292820218187778,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',1806290859288793089,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:45:42','2024-06-27 19:45:42',1),(1806292851390255106,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','test',1806290859288793089,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:45:49','2024-06-27 19:45:49',1),(1806293504476942338,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','日日日',1806283560306446338,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:48:25','2024-06-27 19:48:25',1),(1806293526673199105,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','热污染',-1,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:48:30','2024-06-27 19:48:30',1),(1806293604339126274,1802241150924369921,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','大大大',-1,2,1,1,'[1801936658387472385]',0,-1,'','2024-06-27 19:48:49','2024-06-27 19:48:49',0),(1806293613663064066,1802241150924369921,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','的撒旦撒旦',-1,0,0,0,'[]',0,-1,'','2024-06-27 19:48:51','2024-06-27 19:48:51',0),(1806293625830739970,1802241150924369921,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','大大',-1,0,0,0,'[]',0,-1,'','2024-06-27 19:48:54','2024-06-27 19:48:54',0),(1806293640053624833,1802241150924369921,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','大苏打',1806293604339126274,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:48:57','2024-06-27 19:48:57',0),(1806293657300602882,1802241150924369921,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','大苏打撒旦',-1,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:49:01','2024-06-27 19:49:01',0),(1806293735855722497,1802241150924369921,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','的撒大',1806293604339126274,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:49:20','2024-06-27 19:49:20',0),(1806293885114224641,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','儿童虽然是',-1,3,1,1,'[1801936658387472385]',0,-1,'','2024-06-27 19:49:56','2024-06-27 19:49:56',1),(1806293894316527617,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','二十日',-1,0,0,0,'[]',0,-1,'','2024-06-27 19:49:58','2024-06-27 19:49:58',1),(1806293909466353666,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','大苏打的',1806293885114224641,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:50:02','2024-06-27 19:50:02',1),(1806293923051704321,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','的撒大',1806293885114224641,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:50:05','2024-06-27 19:50:05',1),(1806293957021372418,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','的撒大',1806293885114224641,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:50:13','2024-06-27 19:50:13',1),(1806294603946627074,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','方迪宝宝',-1,2,2,1,'[1801936658387472385,1806581827699290113]',1,1801936658387472385,'若以','2024-06-27 19:52:47','2024-06-27 19:52:47',0),(1806294647378644994,1802040610911232002,1801936658387472385,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','雀氏',1806294603946627074,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-27 19:52:57','2024-06-27 19:52:57',0),(1806581940698034178,1802040610911232002,1806581827699290113,'test11','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','默认头像',-1,1,1,1,'[1806581827699290113]',0,-1,'','2024-06-28 14:54:34','2024-06-28 14:54:34',0),(1806581991298117633,1802040610911232002,1806581827699290113,'test11','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','嘿嘿',1806294603946627074,0,0,0,'[]',0,1801936658387472385,'若以','2024-06-28 14:54:46','2024-06-28 14:54:46',0),(1806582055118647298,1802040610911232002,1806581827699290113,'test11','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','你干嘛哎呦',1806581940698034178,0,0,0,'[]',0,1806581827699290113,'test11','2024-06-28 14:55:01','2024-06-28 14:55:01',0);
/*!40000 ALTER TABLE `question_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_submit`
--

DROP TABLE IF EXISTS `question_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_submit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `language` varchar(128) NOT NULL COMMENT '编程语言',
  `code` text NOT NULL COMMENT '用户代码',
  `judgeInfo` text COMMENT '判题信息（json 对象）',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
  `questionId` bigint(20) NOT NULL COMMENT '题目 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_questionId` (`questionId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1804223285482827779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='题目提交';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_submit`
--

LOCK TABLES `question_submit` WRITE;
/*!40000 ALTER TABLE `question_submit` DISABLE KEYS */;
INSERT INTO `question_submit` (`id`, `language`, `code`, `judgeInfo`, `status`, `questionId`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1802047781132627969,'java','a + b','{}',0,1802040610911232002,1801936658387472385,'2024-06-16 02:37:26','2024-06-16 02:37:26',0),(1802279835652870145,'java','<template>\r\n  <div\r\n    id=\"code-editor\"\r\n    ref=\"codeEditorRef\"\r\n    style=\"min-height: 400px; height: 60vh\"\r\n  />\r\n  <!--  <a-button @click=\"fillValue\">填充值</a-button>-->\r\n</template>\r\n\r\n<script setup lang=\"ts\">\r\nimport * as monaco from \"monaco-editor\";\r\nimport { onMounted, ref, toRaw, withDefaults, defineProps, watch } from \"vue\";\r\n\r\n/**\r\n * 定义组件属性类型\r\n */\r\ninterface Props {\r\n  value: string;\r\n  language?: string;\r\n  handleChange: (v: string) => void;\r\n}\r\n\r\n/**\r\n * 给组件指定初始值\r\n */\r\nconst props = withDefaults(defineProps<Props>(), {\r\n  value: () => \"\",\r\n  language: () => \"java\",\r\n  handleChange: (v: string) => {\r\n    console.log(v);\r\n  },\r\n});\r\n\r\nconst codeEditorRef = ref();\r\nconst codeEditor = ref();\r\n\r\n// const fillValue = () => {\r\n//   if (!codeEditor.value) {\r\n//     return;\r\n//   }\r\n//   // 改变值\r\n//   toRaw(codeEditor.value).setValue(\"新的值\");\r\n// };\r\n\r\n// watch(\r\n//   () => props.language,\r\n//   () => {\r\n//     codeEditor.value = monaco.editor.create(codeEditorRef.value, {\r\n//       value: props.value,\r\n//       language: props.language,\r\n//       automaticLayout: true,\r\n//       colorDecorators: true,\r\n//       minimap: {\r\n//         enabled: true,\r\n//       },\r\n//       readOnly: false,\r\n//       theme: \"vs-dark\",\r\n//       // lineNumbers: \"off\",\r\n//       // roundedSelection: false,\r\n//       // scrollBeyondLastLine: false,\r\n//     });\r\n//   }\r\n// );\r\n\r\nonMounted(() => {\r\n  if (!codeEditorRef.value) {\r\n    return;\r\n  }\r\n  // Hover on each property to see its docs!\r\n  codeEditor.value = monaco.editor.create(codeEditorRef.value, {\r\n    value: props.value,\r\n    language: props.language,\r\n    automaticLayout: true,\r\n    colorDecorators: true,\r\n    minimap: {\r\n      enabled: true,\r\n    },\r\n    readOnly: false,\r\n    theme: \"vs-dark\",\r\n    // lineNumbers: \"off\",\r\n    // roundedSelection: false,\r\n    // scrollBeyondLastLine: false,\r\n  });\r\n\r\n  // 编辑 监听内容变化\r\n  codeEditor.value.onDidChangeModelContent(() => {\r\n    props.handleChange(toRaw(codeEditor.value).getValue());\r\n  });\r\n});\r\n</script>\r\n\r\n<style scoped></style>\r\n','{}',0,1802040610911232002,1801936658387472385,'2024-06-16 17:59:32','2024-06-16 17:59:32',0),(1802328517278552065,'cpp','#include \"stdio.h\"\r\nint mian(){\r\n    return 0;\r\n}','{}',0,1802040610911232002,1801936658387472385,'2024-06-16 21:12:58','2024-06-16 21:12:58',0),(1802329394630479873,'java','testtsetsetstcode ','{}',0,1802248969157357570,1801960088314875906,'2024-06-16 21:16:28','2024-06-16 21:16:28',0),(1802419685567856641,'java','asjdaskjfkjfasdf','{}',0,1802040610911232002,1801936658387472385,'2024-06-17 03:15:15','2024-06-17 03:15:15',0),(1802420243783598082,'java','asjdaskjfkjfasdf','{}',0,1802040610911232002,1801936658387472385,'2024-06-17 03:17:28','2024-06-17 03:17:28',0),(1802422093610020865,'java','asjdaskjfkjfasdf','{}',0,1802040610911232002,1801936658387472385,'2024-06-17 03:24:49','2024-06-17 03:24:49',0),(1802422522280472578,'java','asjdaskjfkjfasdf','{\"message\":\"答案错误\",\"memory\":100,\"time\":100}',2,1802040610911232002,1801936658387472385,'2024-06-17 03:26:31','2024-06-17 03:26:31',0),(1802422826786918402,'java','sadsaf saf ','{\"message\":\"答案错误\",\"memory\":100,\"time\":100}',2,1802248969157357570,1801936658387472385,'2024-06-17 03:27:43','2024-06-17 03:27:44',0),(1803328685679366146,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"答案错误\",\"time\":93}',2,1802241150924369921,1801936658387472385,'2024-06-19 15:27:17','2024-06-19 15:27:18',0),(1803328905725136897,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"答案错误\",\"time\":89}',2,1802241150924369921,1801936658387472385,'2024-06-19 15:28:10','2024-06-19 15:28:10',0),(1803331004076724226,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"答案错误\",\"time\":78}',2,1802241150924369921,1801936658387472385,'2024-06-19 15:36:30','2024-06-19 15:39:18',0),(1803331917415780353,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1802241150924369921,1801936658387472385,'2024-06-19 15:40:08','2024-06-19 15:40:08',0),(1803333108019302401,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1802241150924369921,1801936658387472385,'2024-06-19 15:44:51','2024-06-19 15:44:51',0),(1803333435539918849,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1802241150924369921,1801936658387472385,'2024-06-19 15:46:10','2024-06-19 15:46:10',0),(1803333757909929985,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1802241150924369921,1801936658387472385,'2024-06-19 15:47:26','2024-06-19 15:47:26',0),(1803334338300940290,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1802241150924369921,1801936658387472385,'2024-06-19 15:49:45','2024-06-19 15:49:45',0),(1803334436950970369,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1802241150924369921,1801936658387472385,'2024-06-19 15:50:08','2024-06-19 15:50:08',0),(1803334756393361409,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"成功\",\"memory\":0,\"time\":92}',2,1802241150924369921,1801936658387472385,'2024-06-19 15:51:24','2024-06-19 15:51:30',0),(1803335150892748801,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"成功\",\"memory\":0,\"time\":86}',2,1802241150924369921,1801936658387472385,'2024-06-19 15:52:58','2024-06-19 15:52:59',0),(1803864809464168450,'java','int','{}',1,1802040610911232002,1801936658387472385,'2024-06-21 02:57:39','2024-06-21 02:57:39',0),(1804010856593272834,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1804006552155320322,1801936658387472385,'2024-06-21 12:37:59','2024-06-21 12:41:36',0),(1804012368291741698,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1804006552155320322,1801936658387472385,'2024-06-21 12:44:00','2024-06-21 12:44:00',0),(1804013236445560833,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1804006552155320322,1801936658387472385,'2024-06-21 12:47:27','2024-06-21 12:47:27',0),(1804013646233255938,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"成功\",\"memory\":0,\"time\":82}',2,1804006552155320322,1801936658387472385,'2024-06-21 12:49:04','2024-06-21 12:49:06',0),(1804016363865423874,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1804006552155320322,1801936658387472385,'2024-06-21 12:59:52','2024-06-21 12:59:53',0),(1804016621299220481,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{}',1,1802241150924369921,1801936658387472385,'2024-06-21 13:00:54','2024-06-21 13:00:54',0),(1804020417882537986,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"成功\",\"memory\":0,\"time\":96}',2,1802241150924369921,1801936658387472385,'2024-06-21 13:15:59','2024-06-21 13:16:00',0),(1804020449327235073,'java','','{\"message\":\"答案错误\",\"memory\":0,\"time\":74}',2,1802241150924369921,1801936658387472385,'2024-06-21 13:16:06','2024-06-21 13:16:07',0),(1804209715231662081,'java','            question.setAcceptedNum(acceptedNum + 1);\r\n','{}',1,1804006552155320322,1801936658387472385,'2024-06-22 01:48:11','2024-06-22 01:48:11',0),(1804212374265180161,'java','dfs','{}',1,1804006552155320322,1801936658387472385,'2024-06-22 01:58:45','2024-06-22 01:58:45',0),(1804214221289861121,'java','sad','{}',1,1802040610911232002,1801936658387472385,'2024-06-22 02:06:05','2024-06-22 02:06:05',0),(1804214492690690050,'java','das','{}',1,1802040610911232002,1801936658387472385,'2024-06-22 02:07:10','2024-06-22 02:07:10',0),(1804215296768126978,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"答案错误\",\"memory\":0,\"time\":80}',2,1802040610911232002,1801936658387472385,'2024-06-22 02:10:22','2024-06-22 02:10:32',0),(1804215409192251394,'java','public class Main {\r\n    public static void main(String[] args) {\r\n        int a = Integer.parseInt(args[0]);\r\n        int b = Integer.parseInt(args[1]);\r\n        System.out.println(a + b);\r\n    }\r\n}','{\"message\":\"成功\",\"memory\":0,\"time\":78}',2,1804006552155320322,1801936658387472385,'2024-06-22 02:10:48','2024-06-22 02:10:49',0),(1804221251840978945,'java','dsa ','{}',0,1804006552155320322,1804207027051859969,'2024-06-22 02:34:01','2024-06-22 02:34:01',0),(1804223285482827778,'java','dasd','{}',1,1804006552155320322,1804207027051859969,'2024-06-22 02:42:06','2024-06-22 02:42:07',0);
/*!40000 ALTER TABLE `question_submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_unionId` (`unionId`)
) ENGINE=InnoDB AUTO_INCREMENT=1806581827699290114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `userAccount`, `userPassword`, `unionId`, `mpOpenId`, `userName`, `userAvatar`, `userProfile`, `userRole`, `createTime`, `updateTime`, `isDelete`) VALUES (1801596416715493378,'yupi','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'yupi','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain',NULL,'admin','2024-06-14 20:43:52','2024-06-14 20:46:13',0),(1801596449825329154,'nian','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'nian','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain',NULL,'admin','2024-06-14 20:44:00','2024-06-14 20:46:13',0),(1801936658387472385,'ruoyi','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'若以','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain',NULL,'admin','2024-06-15 19:15:52','2024-06-16 02:15:27',0),(1801960088314875906,'test','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'test','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain','个人简介','user','2024-06-15 20:48:58','2024-06-28 21:18:35',0),(1804137516802064386,'test1','b0dd3697a192885d7c055db46155b26a',NULL,NULL,NULL,NULL,NULL,'user','2024-06-21 21:01:17','2024-06-28 21:02:24',1),(1804148116307374081,'yfdd','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'袁方迪',NULL,NULL,'user','2024-06-21 21:43:25','2024-06-21 21:43:25',0),(1804148906547802114,'yfdi','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'袁方迪',NULL,NULL,'user','2024-06-21 21:46:33','2024-06-28 21:02:14',1),(1804207027051859969,'test2','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'mirco',NULL,NULL,'user','2024-06-22 01:37:30','2024-06-28 21:02:09',1),(1806581827699290113,'test11','b0dd3697a192885d7c055db46155b26a',NULL,NULL,'test11','https://tse3-mm.cn.bing.net/th/id/OIP-C.hjAbNp5uIzwZJzApoqiYrwAAAA?rs=1&pid=ImgDetMain',NULL,'user','2024-06-28 14:54:07','2024-06-28 21:17:48',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-29 17:03:02
