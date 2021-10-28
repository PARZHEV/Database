-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: airbnb_281021
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `apartment_id` int unsigned NOT NULL COMMENT 'Ссылка на апартаменты',
  `country` varchar(130) DEFAULT NULL COMMENT 'Страна',
  `city` varchar(130) DEFAULT NULL COMMENT 'Город',
  `street` varchar(130) DEFAULT NULL COMMENT 'улица',
  `home` varchar(130) DEFAULT NULL COMMENT 'улица',
  `appartment_number` varchar(130) DEFAULT NULL COMMENT 'улица',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `adresses_apartment_id` (`apartment_id`),
  CONSTRAINT `adresses_apartment_id` FOREIGN KEY (`apartment_id`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Адреса апартаментов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
INSERT INTO `adresses` VALUES (1,1,'3426','Toyton',NULL,NULL,'571','1984-08-19 03:22:39','1990-06-15 22:39:53'),(2,2,'','New Karianne',NULL,NULL,'93195477','2010-09-27 09:46:22','2004-08-31 06:50:27'),(3,3,'705141414','Lake Laronmouth',NULL,NULL,'15','1997-04-05 11:55:03','1998-10-14 07:24:43'),(4,4,'47','North Eleanoraborough',NULL,NULL,'645568','2000-06-16 04:34:52','1982-04-08 06:00:11'),(5,5,'7938','Janechester',NULL,NULL,'64676','1983-09-10 05:17:23','1978-06-27 16:41:14'),(6,6,'5875','South Alysson',NULL,NULL,'1','1982-11-09 14:01:41','1991-11-11 10:31:15'),(7,7,'13','Beulahside',NULL,NULL,'5838760','1991-08-26 05:05:51','1998-09-20 17:08:10'),(8,8,'6652','Trompview',NULL,NULL,'786','1970-03-31 14:11:02','2014-04-25 03:36:21'),(9,9,'840177','Florencioton',NULL,NULL,'7592','2006-10-21 19:10:48','1992-11-09 17:48:55'),(10,10,'26169066','Herzogfort',NULL,NULL,'5','1990-04-08 20:35:36','2011-12-02 04:52:44');
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apart_condition`
--

DROP TABLE IF EXISTS `apart_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apart_condition` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `id_apartment` int unsigned NOT NULL COMMENT 'Идентификатор апартаметов ',
  `check-in` varchar(130) DEFAULT NULL COMMENT 'Условие Прибывание',
  `check-out` varchar(130) DEFAULT NULL COMMENT 'Условие Отбытия',
  `cancellation` varchar(130) DEFAULT NULL COMMENT 'Условие отмены',
  `TV` varchar(130) DEFAULT NULL COMMENT 'Телевизор',
  `Wifi` varchar(130) DEFAULT NULL COMMENT 'Вайфай',
  `Air_conditioning` varchar(130) DEFAULT NULL COMMENT 'Кондиционер',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `apart_condition_id_apartment` (`id_apartment`),
  CONSTRAINT `apart_condition_id_apartment` FOREIGN KEY (`id_apartment`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Условия какие есть в апартаментах';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apart_condition`
--

LOCK TABLES `apart_condition` WRITE;
/*!40000 ALTER TABLE `apart_condition` DISABLE KEYS */;
INSERT INTO `apart_condition` VALUES (21,1,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-20 22:05:16','2005-08-20 06:11:05'),(22,2,NULL,NULL,NULL,NULL,NULL,NULL,'1972-05-17 05:05:00','1998-05-19 20:25:06'),(23,3,NULL,NULL,NULL,NULL,NULL,NULL,'1984-02-26 22:20:21','2017-12-09 22:49:30'),(24,4,NULL,NULL,NULL,NULL,NULL,NULL,'1984-05-12 16:22:51','1973-05-01 14:05:15'),(25,5,NULL,NULL,NULL,NULL,NULL,NULL,'1978-07-12 14:01:49','2006-10-09 22:25:46'),(26,6,NULL,NULL,NULL,NULL,NULL,NULL,'2010-08-09 20:00:00','1975-12-11 06:53:57'),(27,7,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-01 01:52:43','1981-11-07 05:19:52'),(28,8,NULL,NULL,NULL,NULL,NULL,NULL,'1998-07-01 15:24:18','1975-08-30 08:10:21'),(29,9,NULL,NULL,NULL,NULL,NULL,NULL,'1976-04-10 03:08:19','2010-11-12 10:23:41'),(30,10,NULL,NULL,NULL,NULL,NULL,NULL,'1990-06-08 15:48:59','1988-04-26 09:04:54');
/*!40000 ALTER TABLE `apart_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `coordinates` varchar(130) DEFAULT NULL,
  `id_owner` int unsigned NOT NULL COMMENT 'владелец апартаментов',
  `photo_id` int unsigned DEFAULT NULL COMMENT 'Ссылка на основную фотографию апартаментов',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `apartment_photo_id` (`photo_id`),
  CONSTRAINT `apartment_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='апартаменты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES (1,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,1,'1986-04-10 15:58:04','2000-11-21 01:47:48'),(2,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,2,'1998-01-08 21:09:28','2012-04-28 10:31:23'),(3,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,3,'1980-12-14 03:45:25','1972-09-13 08:58:01'),(4,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,4,'2021-07-22 19:29:36','1988-01-28 18:38:09'),(5,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,5,'2006-06-17 01:30:20','1973-08-11 08:34:13'),(6,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,6,'1981-08-18 11:33:20','1989-03-17 06:54:33'),(7,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,7,'1997-06-05 05:23:52','1984-07-08 20:22:04'),(8,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,8,'1983-08-16 06:24:16','1985-07-19 11:03:32'),(9,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,9,'2018-01-06 17:55:41','2000-04-12 09:56:21'),(10,'Latitude: -25.80422, Longitude: 74.80728, Distortion: 1.23',0,10,'2016-07-22 06:26:23','1986-04-11 05:55:22');
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `filename` varchar(255) NOT NULL COMMENT 'Путь к файлу',
  `media_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип файла',
  `size` int NOT NULL COMMENT 'Размер файла',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `media_media_type_id` (`media_type_id`),
  CONSTRAINT `media_media_type_id` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'quis',1,757468259,'2017-09-27 15:03:22','2008-06-26 08:54:19'),(2,'ut',2,4114288,'2019-09-18 19:34:10','1981-09-07 22:17:15'),(3,'voluptas',3,0,'2007-02-22 01:56:54','1975-05-26 05:34:42'),(4,'sed',4,47,'1996-08-03 05:04:01','2007-05-23 06:47:58'),(5,'sit',5,6198200,'1988-10-05 03:26:51','1990-04-22 01:55:37'),(6,'laboriosam',6,6316,'1978-09-19 16:48:25','1970-08-12 22:47:32'),(7,'eos',7,7867,'1993-08-26 12:23:04','1980-12-02 01:33:48'),(8,'repudiandae',8,0,'1971-07-26 22:54:18','1985-06-25 06:47:36'),(9,'consequatur',9,5563439,'1991-04-09 14:33:44','2002-03-08 22:58:53'),(10,'exercitationem',10,736408,'2000-09-13 12:23:58','1973-07-04 19:34:35');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'quo','2008-12-25 02:56:28','2005-06-10 20:48:13'),(2,'rerum','1973-02-04 02:34:08','2008-01-17 17:50:17'),(3,'consequatur','1983-05-28 11:56:16','1977-05-12 05:26:27'),(4,'in','1977-12-14 18:17:55','2006-03-22 21:58:26'),(5,'debitis','1980-12-19 19:44:02','1994-05-28 16:58:25'),(6,'omnis','1979-05-27 15:56:32','1999-01-09 07:25:13'),(7,'placeat','1983-10-12 16:07:52','1972-11-05 11:51:07'),(8,'beatae','1997-05-12 12:58:27','1978-09-29 06:41:05'),(9,'at','2015-02-17 00:23:45','2005-10-31 04:18:10'),(10,'ut','2007-09-30 19:33:25','1984-08-11 21:02:15');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text NOT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,1,'Fugit nisi non eaque rerum molestias. Aut omnis debitis pariatur alias. Ratione suscipit deleniti modi numquam adipisci quod. Ea veniam aut eos nihil ut nam quia voluptatem. Dolor ea et reiciendis voluptas quam mollitia quo quod.',0,1,'2018-01-05 20:03:41','1989-12-19 01:41:08'),(2,2,2,'Laboriosam ea quisquam iure pariatur laudantium numquam. Saepe hic in ut dolores voluptatem modi distinctio sint. Aut commodi sed enim voluptatem eius autem.',1,0,'1995-12-13 15:14:43','1977-04-01 01:50:07'),(3,3,3,'Ex molestias repellat suscipit sed vel. Quos sint amet maiores sed. Rerum voluptas earum dolorem quaerat aut dolore molestias autem. Nostrum recusandae non aperiam ex corporis consequatur dicta minima.',1,0,'1980-02-24 21:32:08','1993-01-05 01:05:09'),(4,4,4,'Recusandae aut non ex iure et. Nihil iusto dolores laboriosam praesentium nobis consequatur beatae. Mollitia sint ea culpa sit.',1,0,'1992-12-09 17:18:25','1986-07-30 12:58:22'),(5,5,5,'Consequatur atque exercitationem inventore libero est nesciunt iure dolorem. Nostrum voluptatum eveniet qui eum voluptas natus vel. Voluptas nisi quos quibusdam aperiam voluptatem.',1,0,'2001-12-01 09:26:10','2013-09-19 09:20:05'),(6,6,6,'Aperiam et et aut quaerat nemo. Impedit est qui sed et. Voluptatem sunt velit quo quisquam illo voluptatibus. Eveniet error perferendis et perspiciatis earum amet iusto. Mollitia ratione sed magni numquam perspiciatis possimus.',0,1,'2020-11-22 01:15:52','2004-09-10 12:58:29'),(7,7,7,'Dolores aperiam error molestiae est temporibus quia nobis vel. Quidem quia magnam soluta iusto reprehenderit sit. Sit maxime ipsum aspernatur voluptatem quia ullam est quia.',1,0,'1970-02-13 04:20:41','2000-12-29 12:03:15'),(8,8,8,'Doloremque soluta voluptatibus deserunt temporibus maiores laborum. Aliquid magnam et ut. Commodi nisi sed sit quo.',0,1,'1976-06-01 01:30:47','1982-07-02 21:20:02'),(9,9,9,'Omnis accusantium est mollitia cumque. Et nisi quidem maiores molestiae aliquid. Non quisquam reprehenderit aut aut. Similique quidem ipsa illo cum rerum.',1,0,'2008-02-07 11:03:05','1977-03-04 10:07:57'),(10,10,10,'Magni quas quos sit fuga magnam et sed. Quod eius ut atque et pariatur id tenetur. Unde pariatur veritatis est non maiores rem. Quo aliquid animi commodi debitis voluptas.',0,0,'2004-12-11 15:08:24','1974-06-11 23:15:59');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gerder` enum('M','F','?') DEFAULT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `photo_id` int unsigned DEFAULT NULL COMMENT 'Ссылка на основную фотографию пользователя',
  `status` enum('online','offline','disabled') DEFAULT NULL COMMENT 'Текущий статус',
  `city` varchar(130) DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) DEFAULT NULL COMMENT 'Страна проживания',
  `status_user` enum('owner','turist') DEFAULT NULL COMMENT 'Определение кто юзер ищет или сдает апартаменты',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `profiles_user_id` (`user_id`),
  KEY `profiles_photo_id` (`photo_id`),
  CONSTRAINT `profiles_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,1,'F','2012-08-29',1,'disabled','West Erlingland','92','owner','1993-07-23 16:35:12','2014-05-30 11:15:45'),(3,3,'?','1982-05-13',3,'online','Funkfurt','6447103','owner','2015-04-22 04:54:51','1982-01-27 05:13:15'),(4,4,'F','1999-02-19',4,'online','North Brad','343','turist','2001-05-28 09:35:40','2009-12-15 12:46:36'),(5,5,'M','1974-10-16',5,'disabled','Jadestad','2514','turist','1989-12-19 13:48:25','2010-04-01 14:46:26'),(6,6,'F','1993-10-13',6,'disabled','Port Adele','','turist','1976-01-13 14:55:57','1985-11-21 07:28:51'),(7,7,'F','1991-09-07',7,'online','Jacobsmouth','593691645','owner','2019-03-30 18:45:42','1974-10-15 10:42:23'),(8,8,'M','2010-04-05',8,'offline','Port Nils','6402716','turist','1984-07-02 21:24:50','2001-07-24 06:45:40'),(9,9,'?','1976-07-17',9,'online','Irmaland','8','owner','2013-10-05 18:15:49','2001-05-20 14:58:27'),(10,10,'F','1979-07-04',10,'disabled','Tarynfort','475826','owner','1989-02-24 08:20:16','1983-03-27 03:59:21');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `apart_id` int unsigned NOT NULL COMMENT 'Идентификатор апартаментов',
  `from_user` int unsigned NOT NULL COMMENT 'кто прислал хапрос',
  `date_of_start_rental` date NOT NULL COMMENT 'Дата наяала аренды',
  `date_of_end_rental` date NOT NULL COMMENT 'дата конца аренды',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `requests_apart_id` (`apart_id`),
  KEY `requests_from_user` (`from_user`),
  CONSTRAINT `requests_apart_id` FOREIGN KEY (`apart_id`) REFERENCES `apartment` (`id`),
  CONSTRAINT `requests_from_user` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запрос на букинг апартаментов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (121,1,1,'1979-10-09','2006-06-24','2009-03-24 11:53:39','1986-02-19 05:51:31'),(122,2,2,'1980-02-09','1998-09-08','2019-06-09 01:28:00','1984-05-13 05:41:12'),(123,3,3,'1987-07-17','1992-04-23','2012-04-13 08:27:31','1977-11-24 00:21:18'),(124,4,4,'1984-05-07','1987-09-02','2007-01-14 15:24:12','2015-08-21 21:43:51'),(125,5,5,'1973-03-05','2013-03-23','1993-04-22 22:17:30','2021-05-03 10:35:55'),(126,6,6,'2006-03-07','2021-05-12','2010-11-10 16:31:37','1970-12-30 10:12:22'),(127,7,7,'2016-01-16','2006-03-03','2004-07-31 03:37:05','1984-03-05 20:17:04'),(128,8,8,'1993-12-07','1980-03-10','2000-09-23 18:47:48','2013-12-04 09:29:49'),(129,9,9,'1980-11-05','1990-06-25','1972-08-16 20:53:27','1993-11-01 00:02:43'),(130,10,10,'1973-11-21','1999-09-06','1975-03-06 06:41:45','2005-08-04 12:55:55');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user` int unsigned NOT NULL COMMENT 'Идентификатор юзера от кого пришел отзыв',
  `to_apartment` int unsigned NOT NULL COMMENT 'Идентификатор апартаметов на которефе сделан отзыв',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `reviews_from_user` (`from_user`),
  KEY `reviews_to_apartment` (`to_apartment`),
  CONSTRAINT `reviews_from_user` FOREIGN KEY (`from_user`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_to_apartment` FOREIGN KEY (`to_apartment`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='отзыв на апартаменты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (41,1,1,'1985-12-04 03:31:54','2008-06-12 01:00:36'),(42,2,2,'1979-11-02 08:39:30','2000-12-25 01:32:08'),(43,3,3,'1997-06-13 08:46:38','1994-01-17 19:40:05'),(44,4,4,'1994-10-25 03:08:13','1970-06-15 15:58:10'),(45,5,5,'1974-10-04 17:37:45','1972-02-24 06:48:06'),(46,6,6,'1983-12-16 18:10:35','1999-04-20 20:27:56'),(47,7,7,'1991-09-04 15:52:10','1982-08-13 00:19:19'),(48,8,8,'1979-12-21 20:18:44','1980-12-21 16:59:27'),(49,9,9,'1979-02-16 06:41:21','2013-09-19 14:56:05'),(50,10,10,'2019-08-24 20:35:13','2017-12-01 06:14:05');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `id_user` int unsigned NOT NULL COMMENT 'Идентификатор юзера',
  `id_apartment` int unsigned NOT NULL COMMENT 'Идентификатор апартаметов ',
  `id_request` int unsigned NOT NULL COMMENT 'Идентификатор  запроса на трип',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `trips_id_user` (`id_user`),
  KEY `trips_id_apartment` (`id_apartment`),
  KEY `trips_id_request` (`id_request`),
  CONSTRAINT `trips_id_apartment` FOREIGN KEY (`id_apartment`) REFERENCES `apartment` (`id`),
  CONSTRAINT `trips_id_request` FOREIGN KEY (`id_request`) REFERENCES `requests` (`id`),
  CONSTRAINT `trips_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='отзыв на апартаменты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (201,1,1,121,'1996-07-25 05:21:46','1971-04-07 20:26:10'),(202,2,2,122,'1985-09-09 17:54:24','1980-11-01 00:23:31'),(203,3,3,123,'1982-03-18 02:37:56','1993-01-31 04:22:42'),(204,4,4,124,'1981-04-24 10:02:25','2019-07-19 15:51:19'),(205,5,5,125,'1999-01-16 18:40:33','1984-05-05 04:13:23'),(206,6,6,126,'1974-05-27 03:37:53','1990-01-25 17:01:20'),(207,7,7,127,'1971-11-14 01:35:36','1973-09-19 10:19:53'),(208,8,8,128,'1992-06-02 18:20:31','1977-05-02 08:13:27'),(209,9,9,129,'2007-01-20 03:37:38','1973-03-22 11:49:55'),(210,10,10,130,'2013-03-02 05:16:13','2000-09-10 01:37:18');
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) NOT NULL COMMENT 'Почта',
  `phone` char(11) NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Edythe','Bednar','tschiller@example.org','07263276744','2015-05-13 03:49:06','1987-04-30 23:42:55'),(2,'Aidan','Collier','chance.eichmann@example.com','1-904-521-8','2016-05-02 21:16:06','1996-07-30 16:55:15'),(3,'Kaylah','Barton','alejandra.wyman@example.org','(926)785-44','2005-11-26 23:24:14','1999-05-08 22:01:24'),(4,'Weldon','Ratke','carter.uriah@example.com','366.856.852','1970-05-19 03:23:45','1998-07-17 09:29:22'),(5,'Trystan','Wisoky','qkoss@example.net','(572)007-42','2019-03-31 13:33:12','1975-12-25 16:58:25'),(6,'Antonietta','Paucek','eerdman@example.net','(804)989-42','1997-08-14 01:24:41','1992-11-23 19:55:22'),(7,'Reid','Crist','grady.houston@example.org','911-860-627','1986-04-23 06:31:31','1972-01-10 17:09:00'),(8,'Heidi','Schumm','hoppe.philip@example.org','(902)048-25','1987-03-15 01:28:22','2008-05-07 15:35:22'),(9,'Reba','Funk','jeromy.upton@example.org','+39(8)12731','1982-02-28 06:34:14','1998-07-04 09:05:04'),(10,'Magnus','Rutherford','walter.west@example.com','(442)942-30','2008-05-27 00:49:40','1984-04-04 08:23:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-28 21:17:38
