-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: games_database
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `age_ratings`
--

DROP TABLE IF EXISTS `age_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_ratings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_ratings`
--

LOCK TABLES `age_ratings` WRITE;
/*!40000 ALTER TABLE `age_ratings` DISABLE KEYS */;
INSERT INTO `age_ratings` VALUES (8,'ACB: M'),(5,'ACB: MA15+'),(6,'ACB: R18+'),(10,'CERO: D'),(9,'CERO: Z'),(1,'ESRB: M'),(2,'ESRB: T'),(4,'PEGI: 12'),(7,'PEGI: 16'),(3,'PEGI: 18');
/*!40000 ALTER TABLE `age_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `age_ratings_to_games`
--

DROP TABLE IF EXISTS `age_ratings_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_ratings_to_games` (
  `Id_game` int NOT NULL,
  `Id_age_rating` int NOT NULL,
  PRIMARY KEY (`Id_age_rating`,`Id_game`),
  KEY `fk_age_ratings_to_games_games_id_game` (`Id_game`),
  CONSTRAINT `fk_age_ratings_to_games_age_ratings_id_age_rating` FOREIGN KEY (`Id_age_rating`) REFERENCES `age_ratings` (`Id`),
  CONSTRAINT `fk_age_ratings_to_games_games_id_game` FOREIGN KEY (`Id_game`) REFERENCES `games` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_ratings_to_games`
--

LOCK TABLES `age_ratings_to_games` WRITE;
/*!40000 ALTER TABLE `age_ratings_to_games` DISABLE KEYS */;
INSERT INTO `age_ratings_to_games` VALUES (1,1),(1,3),(4,1),(4,3),(5,2),(5,4),(6,1),(7,1),(7,3),(8,7),(8,8),(8,10);
/*!40000 ALTER TABLE `age_ratings_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Location` varchar(25) NOT NULL,
  `Date_of_foundation` date DEFAULT NULL,
  `Site_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Site_URL` (`Site_URL`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Rockstar Games','США','1998-00-00','https://www.rockstargames.com/ru'),(2,'CD Projekt RED','Польша','2002-00-00','http://cdprojektred.com/'),(3,'Blizzard Entertainment','США','1991-00-00','http://www.blizzard.com/'),(4,'СофтКлаб','Россия','1994-00-00','https://www.softclub.ru/'),(5,'Capcom','Япония','1979-05-30','http://www.capcom.com/'),(6,'Bethesda Softworks','США','1986-06-28','https://bethesda.net/'),(7,'Bandai Namco Entertainment','Япония','2006-03-31','http://www.bandainamcoent.com'),(8,'Saber Interactive','США','2001-00-00','https://saber3d.com/'),(9,'Black Isle Studios','США','1996-00-00','http://www.blackisle.com/'),(10,'Valve','США','1996-08-24','https://www.valvesoftware.com/ru/');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies_from_usa`
--

DROP TABLE IF EXISTS `companies_from_usa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies_from_usa` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Location` varchar(25) NOT NULL,
  `Date_of_foundation` date DEFAULT NULL,
  `Site_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Site_URL` (`Site_URL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies_from_usa`
--

LOCK TABLES `companies_from_usa` WRITE;
/*!40000 ALTER TABLE `companies_from_usa` DISABLE KEYS */;
INSERT INTO `companies_from_usa` VALUES (1,'Rockstar Games','США','1998-00-00','https://www.rockstargames.com/ru'),(3,'Blizzard Entertainment','США','1991-00-00','http://www.blizzard.com/'),(6,'Bethesda Softworks','США','1986-06-28','https://bethesda.net/'),(8,'Saber Interactive','США','2001-00-00','https://saber3d.com/'),(9,'Black Isle Studios','США','1996-00-00','http://www.blackisle.com/'),(10,'Valve','США','1996-08-24','https://www.valvesoftware.com/ru/');
/*!40000 ALTER TABLE `companies_from_usa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies_to_games`
--

DROP TABLE IF EXISTS `companies_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies_to_games` (
  `Id_game` int NOT NULL,
  `Id_company` int NOT NULL,
  `Id_type_company` int NOT NULL,
  PRIMARY KEY (`Id_game`,`Id_company`,`Id_type_company`),
  KEY `fk_companies_to_games_games_id_game` (`Id_game`),
  KEY `fk_companies_to_games_companies_id_company` (`Id_company`),
  KEY `fk_companies_to_games_types_company_Id_type_company` (`Id_type_company`),
  CONSTRAINT `fk_companies_to_games_companies_id_company` FOREIGN KEY (`Id_company`) REFERENCES `companies` (`Id`),
  CONSTRAINT `fk_companies_to_games_games_id_game` FOREIGN KEY (`Id_game`) REFERENCES `games` (`Id`),
  CONSTRAINT `fk_companies_to_games_types_company_Id_type_company` FOREIGN KEY (`Id_type_company`) REFERENCES `types_company` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies_to_games`
--

LOCK TABLES `companies_to_games` WRITE;
/*!40000 ALTER TABLE `companies_to_games` DISABLE KEYS */;
INSERT INTO `companies_to_games` VALUES (1,1,1),(1,1,2),(4,2,1),(4,2,2),(4,8,2),(5,3,1),(5,3,2),(5,4,1),(5,5,1),(6,6,1),(6,9,2),(7,2,2),(7,4,1),(7,7,1);
/*!40000 ALTER TABLE `companies_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engines`
--

DROP TABLE IF EXISTS `engines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engines` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engines`
--

LOCK TABLES `engines` WRITE;
/*!40000 ALTER TABLE `engines` DISABLE KEYS */;
INSERT INTO `engines` VALUES (9,'Creation Engine'),(3,'Fallout engine'),(7,'Fox Engine'),(8,'Havok'),(1,'RAGE'),(2,'REDengine 3'),(4,'REDengine 4'),(5,'Source'),(6,'Source 2'),(10,'Tiger Engine');
/*!40000 ALTER TABLE `engines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_modes`
--

DROP TABLE IF EXISTS `game_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_modes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_modes`
--

LOCK TABLES `game_modes` WRITE;
/*!40000 ALTER TABLE `game_modes` DISABLE KEYS */;
INSERT INTO `game_modes` VALUES (2,'многопользовательский'),(1,'однопользовательский');
/*!40000 ALTER TABLE `game_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_modes_to_games`
--

DROP TABLE IF EXISTS `game_modes_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_modes_to_games` (
  `Id_game` int NOT NULL,
  `Id_game_mode` int NOT NULL,
  PRIMARY KEY (`Id_game_mode`,`Id_game`),
  KEY `fk_game_modes_to_games_games_id_game` (`Id_game`),
  CONSTRAINT `fk_game_modes_to_games_game_modes_id_game_mode` FOREIGN KEY (`Id_game_mode`) REFERENCES `game_modes` (`Id`),
  CONSTRAINT `fk_game_modes_to_games_games_id_game` FOREIGN KEY (`Id_game`) REFERENCES `games` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_modes_to_games`
--

LOCK TABLES `game_modes_to_games` WRITE;
/*!40000 ALTER TABLE `game_modes_to_games` DISABLE KEYS */;
INSERT INTO `game_modes_to_games` VALUES (1,1),(1,2),(4,1),(5,1),(5,2),(6,1),(7,1),(8,1),(8,2),(10,1),(10,2);
/*!40000 ALTER TABLE `game_modes_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_series`
--

DROP TABLE IF EXISTS `game_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_series` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `cover_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `cover_URL` (`cover_URL`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_series`
--

LOCK TABLES `game_series` WRITE;
/*!40000 ALTER TABLE `game_series` DISABLE KEYS */;
INSERT INTO `game_series` VALUES (1,'Red Dead','https://upload.wikimedia.org/wikipedia/ru/f/f0/Red_Dead_Logo.png'),(2,'The Witcher',NULL),(3,'Warcraft',NULL),(4,'Fallout','https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Fallout_logo.svg/2560px-Fallout_logo.svg.png'),(5,'Dark Souls',NULL),(6,'Grand Theft Auto','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Grand_Theft_Auto_logo_series.svg/274px-Grand_Theft_Auto_logo_series.svg.png'),(7,'Destiny',NULL),(8,'Metal Gear','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Metal_Gear_Solid_logo_2.png/274px-Metal_Gear_Solid_logo_2.png'),(9,'Dota',NULL),(10,'Counter-Strike','https://upload.wikimedia.org/wikipedia/ru/thumb/3/33/Counter-Strike_Logo.png/274px-Counter-Strike_Logo.png');
/*!40000 ALTER TABLE `game_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Brief_description` varchar(500) DEFAULT NULL,
  `Date_announce` date DEFAULT NULL,
  `Trailer_URL` varchar(250) DEFAULT NULL,
  `Game_cover_URL` varchar(250) DEFAULT NULL,
  `Game_website_URL` varchar(250) DEFAULT NULL,
  `Id_Engine` int DEFAULT NULL,
  `Id_Game_series` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_EngineGame` (`Id_Engine`),
  KEY `FK_GameSeriesGame` (`Id_Game_series`),
  CONSTRAINT `FK_EngineGame` FOREIGN KEY (`Id_Engine`) REFERENCES `engines` (`Id`),
  CONSTRAINT `FK_GameSeriesGame` FOREIGN KEY (`Id_Game_series`) REFERENCES `game_series` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Red dead redemption 2','Игра RDR2, получившая более 175 наград и 250 высших оценок от игровых изданий, – это грандиозная история о судьбе бандита Артура Моргана и банды Ван дер Линде, бегущих от закона через всю Америку на заре современной эпохи.','2016-10-18','https://www.youtube.com/watch?v=0kqEBOZaP94','https://upload.wikimedia.org/wikipedia/ru/thumb/0/03/Red_Dead_Redemption_2_coverart.jpg/274px-Red_Dead_Redemption_2_coverart.jpg','https://www.rockstargames.com/reddeadredemption2/restricted-content/agegate/form?redirect=https%3A%2F%2Fwww.rockstargames.com%2Freddeadredemption2%2Fru&options=&locale=ru_ru',1,1),(4,'The Witcher 3','Когда в Северных королевствах бушует война, вы заключаете величайший контракт своей жизни — отыскать Дитя предназначения, живое оружие, которое может изменить облик мира.','2013-02-05','https://www.youtube.com/watch?v=A-mCKNTU_mU','https://upload.wikimedia.org/wikipedia/ru/thumb/a/a2/The_Witcher_3-_Wild_Hunt_Cover.jpg/266px-The_Witcher_3-_Wild_Hunt_Cover.jpg','https://thewitcher.com/ru/witcher3/',2,2),(5,'Warcraft 3: The Frozen Throne','The Frozen Throne открывает перед геймерами новую главу в эпической саге о Warcraft. В одиночной кампании игроки возвращаются в раздираемый войной мир Азерота. ',NULL,NULL,'https://upload.wikimedia.org/wikipedia/ru/thumb/0/04/Warcraft_III_The_Frozen_Throne_Cover.jpg/274px-Warcraft_III_The_Frozen_Throne_Cover.jpg','http://eu.blizzard.com/ru-ru/games/war3/',NULL,3),(6,'Fallout 2','Fallout 2 — это продолжение признанной всеми игры, которая вытащила жанр RPG из подземелий и поместила его в динамичное, апокалиптическое ретро-будущее.',NULL,'https://www.youtube.com/watch?v=5fr1KDYGkeo','https://upload.wikimedia.org/wikipedia/ru/thumb/4/49/Fallout2.jpg/274px-Fallout2.jpg','https://web.archive.org/web/19980710153639/http://interplay.com/fallout2/',3,4),(7,'Cyberpunk 2077','Cyberpunk 2077 — приключенческая ролевая игра, действие которой происходит в мегаполисе Найт-Сити, где власть, роскошь и модификации тела ценятся выше всего.','2012-05-30','https://www.youtube.com/watch?v=aSrFWinrkeQ','https://ru.wikipedia.org/wiki/%D0%A4%D0%B0%D0%B9%D0%BB:%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_%D0%BA%D0%BE%D0%BC%D0%BF%D1%8C%D1%8E%D1%82%D0%B5%D1%80%D0%BD%D0%BE%D0%B9_%D0%B8%D0%B3%D1%80%D1%8B_Cyberpunk_2077.jpg','https://www.cyberpunk.net/ru/ru/',4,NULL),(8,'Dark Souls II','Это уникальная ролевая игра старой школы, покорившая игроков по всему миру. Здесь вас ждут труднейшие испытания и невероятное приключение','2012-12-07','https://www.youtube.com/watch?v=U6uyuIQYlfY','https://upload.wikimedia.org/wikipedia/ru/thumb/2/22/Dark_souls_2.jpg/274px-Dark_souls_2.jpg','http://www.darksoulsii.com/us/',8,5),(9,'Grand Theft Auto V','Grand Theft Auto V для PC позволяет игрокам исследовать знаменитый мир Лос-Сантоса и округа Блэйн в разрешении до 4k и выше с частотой 60 кадров в секунду.','2011-11-02','https://www.youtube.com/watch?v=QkkoHAzjnUs','https://upload.wikimedia.org/wikipedia/ru/thumb/c/c8/GTAV_Official_Cover_Art.jpg/274px-GTAV_Official_Cover_Art.jpg','http://www.rockstargames.com/ru/',1,6),(10,'Dota 2','Ежедневно миллионы игроков по всему миру вступают в битву от лица одного из более сотни героев Dota 2. Неважно, будет это десятый или тысячный час в игре — в ней всегда есть место чему-то новому.','2010-10-13','https://www.youtube.com/watch?v=-cSFPIwMEq4','https://upload.wikimedia.org/wikipedia/ru/thumb/8/8e/%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_Dota_2.jpg/266px-%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_Dota_2.jpg','http://ru.dota2.com/',6,9),(11,'Metal Gear Solid V: The Phantom Pain','Перейдите в новую эру франшизы с передовыми технологиями, работу которых обеспечивает графический процессор Fox Engine.','2013-05-27','https://www.youtube.com/watch?v=Krc1t4HU8GI','https://upload.wikimedia.org/wikipedia/ru/thumb/8/8a/%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_Metal_Gear_Solid_V_The_Phantom_Pain.jpg/266px-%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_Metal_Gear_Solid_V_The_Phantom_Pain.jpg','http://www.konami.jp/mgs5/',7,8),(12,'Counter-Strike: Global Offensive','Counter-Strike: Global Offensive (CS: GO) возрождает ураганную командную игру, впервые представленную еще 19 лет назад.','2011-08-12','https://www.youtube.com/watch?v=edYCtaNueQY','https://upload.wikimedia.org/wikipedia/ru/thumb/3/3f/%D0%9B%D0%BE%D0%B3%D0%BE%D1%82%D0%B8%D0%BF_Counter-Strike_Global_Offensive.svg/274px-%D0%9B%D0%BE%D0%B3%D0%BE%D1%82%D0%B8%D0%BF_Counter-Strike_Global_Offensive.svg.png','https://blog.counter-strike.net/',5,10);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_announced_in_2012`
--

DROP TABLE IF EXISTS `games_announced_in_2012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_announced_in_2012` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Brief_description` varchar(500) DEFAULT NULL,
  `Date_announce` date DEFAULT NULL,
  `Trailer_URL` varchar(250) DEFAULT NULL,
  `Game_cover_URL` varchar(250) DEFAULT NULL,
  `Game_website_URL` varchar(250) DEFAULT NULL,
  `Id_Engine` int DEFAULT NULL,
  `Id_Game_series` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_announced_in_2012`
--

LOCK TABLES `games_announced_in_2012` WRITE;
/*!40000 ALTER TABLE `games_announced_in_2012` DISABLE KEYS */;
INSERT INTO `games_announced_in_2012` VALUES (7,'Cyberpunk 2077','Cyberpunk 2077 — приключенческая ролевая игра, действие которой происходит в мегаполисе Найт-Сити, где власть, роскошь и модификации тела ценятся выше всего.','2012-05-30','https://www.youtube.com/watch?v=aSrFWinrkeQ','https://ru.wikipedia.org/wiki/%D0%A4%D0%B0%D0%B9%D0%BB:%D0%9E%D0%B1%D0%BB%D0%BE%D0%B6%D0%BA%D0%B0_%D0%BA%D0%BE%D0%BC%D0%BF%D1%8C%D1%8E%D1%82%D0%B5%D1%80%D0%BD%D0%BE%D0%B9_%D0%B8%D0%B3%D1%80%D1%8B_Cyberpunk_2077.jpg','https://www.cyberpunk.net/ru/ru/',4,NULL),(8,'Dark Souls II','Это уникальная ролевая игра старой школы, покорившая игроков по всему миру. Здесь вас ждут труднейшие испытания и невероятное приключение','2012-12-07','https://www.youtube.com/watch?v=U6uyuIQYlfY','https://upload.wikimedia.org/wikipedia/ru/thumb/2/22/Dark_souls_2.jpg/274px-Dark_souls_2.jpg','http://www.darksoulsii.com/us/',8,5);
/*!40000 ALTER TABLE `games_announced_in_2012` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (13,'action'),(15,'action-adventure'),(16,'multiplayer online battle arena'),(14,'open-World'),(11,'RPG'),(12,'strategy in real-time'),(20,'автогонки'),(19,'аркада'),(18,'стелс-экшен'),(17,'трёхмерный шутер');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_to_games`
--

DROP TABLE IF EXISTS `genres_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres_to_games` (
  `Id_game` int NOT NULL,
  `Id_genre` int NOT NULL,
  PRIMARY KEY (`Id_genre`,`Id_game`),
  KEY `fk_genres_to_games_games_id_game` (`Id_game`),
  CONSTRAINT `fk_genres_to_games_games_id_game` FOREIGN KEY (`Id_game`) REFERENCES `games` (`Id`),
  CONSTRAINT `fk_genres_to_games_genres_id_genre` FOREIGN KEY (`Id_genre`) REFERENCES `genres` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_to_games`
--

LOCK TABLES `genres_to_games` WRITE;
/*!40000 ALTER TABLE `genres_to_games` DISABLE KEYS */;
INSERT INTO `genres_to_games` VALUES (1,13),(1,14),(4,11),(4,13),(5,12),(6,11),(7,11),(7,14),(8,11),(10,16);
/*!40000 ALTER TABLE `genres_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'Английский'),(3,'Испанский'),(4,'Итальянский'),(9,'Корейский'),(5,'Немецкий'),(7,'Польский'),(2,'Русский'),(10,'Турецкий'),(6,'Французский'),(8,'Японский');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages_to_games`
--

DROP TABLE IF EXISTS `languages_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages_to_games` (
  `Id_game` int NOT NULL,
  `Id_language` int NOT NULL,
  `Id_type_language` int NOT NULL,
  PRIMARY KEY (`Id_game`,`Id_language`,`Id_type_language`),
  KEY `fk_languages_to_games_games_id_game` (`Id_game`),
  KEY `fk_languages_to_games_languages_id_languages` (`Id_language`),
  KEY `fk_languages_to_games_types_language_id_type_language` (`Id_type_language`),
  CONSTRAINT `fk_languages_to_games_games_id_game` FOREIGN KEY (`Id_game`) REFERENCES `games` (`Id`),
  CONSTRAINT `fk_languages_to_games_languages_id_languages` FOREIGN KEY (`Id_language`) REFERENCES `languages` (`Id`),
  CONSTRAINT `fk_languages_to_games_types_language_id_type_language` FOREIGN KEY (`Id_type_language`) REFERENCES `types_language` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages_to_games`
--

LOCK TABLES `languages_to_games` WRITE;
/*!40000 ALTER TABLE `languages_to_games` DISABLE KEYS */;
INSERT INTO `languages_to_games` VALUES (1,1,1),(1,1,2),(1,2,2),(1,3,2),(1,4,2),(1,5,2),(1,6,2),(4,1,1),(4,1,2),(4,2,1),(4,2,2),(4,4,1),(4,5,1),(4,5,2),(4,7,1),(4,7,2),(5,1,2),(5,5,2),(5,6,2),(6,1,2),(6,5,2),(6,6,2),(7,1,1),(7,1,2),(7,2,1),(7,2,2),(7,6,1),(7,6,2);
/*!40000 ALTER TABLE `languages_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (9,'Linux'),(10,'macOS'),(4,'Nintendo Switch'),(7,'PlayStation 3'),(2,'Playstation 4'),(5,'Playstation 5'),(1,'Windows'),(6,'Xbox 360'),(3,'Xbox One'),(8,'Xbox Series X/S');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms_to_games`
--

DROP TABLE IF EXISTS `platforms_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms_to_games` (
  `Id_game` int NOT NULL,
  `Id_platform` int NOT NULL,
  `Release_date` date NOT NULL,
  PRIMARY KEY (`Id_platform`,`Id_game`),
  KEY `fk_platforms_to_games_games_id_game` (`Id_game`),
  CONSTRAINT `fk_platforms_to_games_games_id_game` FOREIGN KEY (`Id_game`) REFERENCES `games` (`Id`),
  CONSTRAINT `fk_platforms_to_games_platforms_id_platform` FOREIGN KEY (`Id_platform`) REFERENCES `platforms` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms_to_games`
--

LOCK TABLES `platforms_to_games` WRITE;
/*!40000 ALTER TABLE `platforms_to_games` DISABLE KEYS */;
INSERT INTO `platforms_to_games` VALUES (1,1,'2019-11-05'),(4,1,'2015-05-19'),(5,1,'2003-07-01'),(6,1,'1998-10-29'),(7,1,'2020-12-10'),(1,2,'2018-10-26'),(4,2,'2015-05-19'),(7,2,'2020-12-10'),(1,3,'2018-10-26'),(4,3,'2015-05-19'),(7,3,'2020-12-10'),(4,4,'2019-10-15');
/*!40000 ALTER TABLE `platforms_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Rating` tinyint NOT NULL,
  `Review_text` varchar(255) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `Id_User` int NOT NULL,
  `Id_Game` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_UserReview` (`Id_User`),
  KEY `FK_GameReview` (`Id_Game`),
  CONSTRAINT `FK_GameReview` FOREIGN KEY (`Id_Game`) REFERENCES `games` (`Id`),
  CONSTRAINT `FK_UserReview` FOREIGN KEY (`Id_User`) REFERENCES `users` (`Id`),
  CONSTRAINT `CHK_Rating` CHECK (((`Rating` >= 0) and (`Rating` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,9,'Best game!','2019-04-15 10:54:01',5,5),(11,9,'Best game, ever created by human being!','2021-02-25 17:25:00',3,6),(12,8,'Хочется стереть себе память...и пройти заного)','2021-03-12 12:00:00',2,1),(13,10,'Шедевр!!!','2020-05-16 14:45:00',4,4),(14,7,'Great Game. I hope one day we are allowed to play it again. Damn Reforged to Hell.','2020-05-16 17:25:00',3,5),(15,8,'Минус этой игры в том,что она кончается.','2021-07-05 16:35:00',5,4),(16,10,'Хорошая игра, но багов много','2021-03-13 10:12:00',6,7),(17,7,'10 из 10 игра года','2018-08-05 13:32:00',7,11),(18,6,'Очень сложно!!','2015-12-02 02:53:00',9,8),(19,4,'Настоящее название этой игры: -25','2016-10-26 17:25:00',8,10);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) NOT NULL,
  `Surname` varchar(15) NOT NULL,
  `Post` varchar(30) NOT NULL,
  `id_company` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CompanyStaff` (`id_company`),
  CONSTRAINT `FK_CompanyStaff` FOREIGN KEY (`id_company`) REFERENCES `companies` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Роб','Пардо','Геймдизайнер',3),(2,'Сэм','Хаузер','Продюсер',1),(3,'Тодд','Вон','Вице-президент',6),(4,'Адам','Кичиньский','Генеральный директор',2),(5,'Фил','Хукер','Программист',1),(6,'Гейб','Ньюэлл','Генеральный директор',10),(7,'Майк','Морхейм','Генеральный директор',3),(8,'Конрад','Томашкевич','Геймдизайнер',2),(9,'Джеймс','Ледер','Исполнительный директор',6),(10,'Мэттью','Карч','Генеральный директор',8);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_company`
--

DROP TABLE IF EXISTS `types_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_company` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` char(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_company`
--

LOCK TABLES `types_company` WRITE;
/*!40000 ALTER TABLE `types_company` DISABLE KEYS */;
INSERT INTO `types_company` VALUES (1,'Издатель'),(2,'Разработчик');
/*!40000 ALTER TABLE `types_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_language`
--

DROP TABLE IF EXISTS `types_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_language` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` char(9) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_language`
--

LOCK TABLES `types_language` WRITE;
/*!40000 ALTER TABLE `types_language` DISABLE KEYS */;
INSERT INTO `types_language` VALUES (2,'Интерфейс'),(1,'Озвучка');
/*!40000 ALTER TABLE `types_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  `Login` varchar(10) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Login` (`Login`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin','123'),(2,'Yasd','name','qwer1234'),(3,'Grey','wasd','wasdfs456'),(4,'Black','qwer','1234567890asd'),(5,'Jasdas','frasd','1hdtuset123'),(6,'White','hgasd','[zgfjsa4123'),(7,'Name','bvzrft','9123kfds'),(8,'Ornot','fadssd','jbisdf843'),(9,'Ghret54','fasdf','1dfkmsd934'),(10,'Blee','Blee','l;kjadj1');
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

-- Dump completed on 2021-04-23 23:04:34
