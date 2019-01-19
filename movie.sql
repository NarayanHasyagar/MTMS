-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: login
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `admindetail`
--

DROP TABLE IF EXISTS `admindetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admindetail` (
  `AdminID` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `Phone_number` char(10) NOT NULL,
  `Email_ID` varchar(45) NOT NULL,
  `Address` varchar(60) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admindetail`
--

LOCK TABLES `admindetail` WRITE;
/*!40000 ALTER TABLE `admindetail` DISABLE KEYS */;
INSERT INTO `admindetail` VALUES ('Narayan','GH','8105713798','hasyagar44@gmail.com','Sirsi'),('Pavan','sank','8123641239','pavan@gmail.com','Belagavi');
/*!40000 ALTER TABLE `admindetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `Movie_ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Language` varchar(15) DEFAULT NULL,
  `Synopsis` varchar(1000) DEFAULT NULL,
  `Actor` varchar(45) DEFAULT NULL,
  `Actress` varchar(45) DEFAULT NULL,
  `Director` varchar(45) DEFAULT NULL,
  `Producer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Tarak','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\tarak1.jpg','Kannada','Tarak, the grandson of a Bengaluru-based businessman who grows up in Europe is reluctant to visit India despite several pleas by his grandfather. All goes well for him until he falls in love with Meera, a selfless person who lives for the happiness of others. The two share a blissful relationship, however, things change when Meera poses Tarak a 60-day challenge to prove his real love for her. To prove his love, Tarak accepts and as part of the challenge visits India and soon finds himself in a tricky situation that would ruin his relationship. What happens next, forms the crux. ','Darshan Thoogudeep','Shruti Hariharan','Prakash','K.S.Dushyanth'),(2,'Alamelamma','C:\\Users\\Narayan Hasyagar\\Desktop\\\\Pict\\operation alamelamma.jpg','Kannada','Purmy\'s life turns upside down when he is arrested by the police one morning under the charges of picking a bag containing money, lying on the street. The money was, in fact, ransom money demanded by kidnappers from a wealthy businessman in exchange for his school-going son, John. Purmy clumsily attempts to prove his innocence and that he has nothing to do with the kidnapping, but is, obviously, on the police\'s radar. With the ongoing investigation, a number of twists and turns make the police suspect everyone, including their own kin. ','Rishi','Shraddha Shrinath','Simple Suni','Amrej Suryavanshi'),(3,'Bharjari','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\bharjari.jpg','Kannada','A romantic action drama about the life of an easygoing youngster named Surya, whose life takes some unexpected turns thanks to the three women he meets along the way. ','Dhruva Sarja','Rachita Ram','Chetan Kumar','R Srinavas'),(4,'Kataka','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\kataka.jpg','Kannada','Kumar, a school teacher working in the city, comes back to his native to pursue his long-cherished dream of opening a school in his hometown that would provide quality education to the lesser fortunate children. He takes his uncle\'s and friend\'s help to build the school but soon faces many obstacles. How he tackles the problems, forms the crux. ','Ashok Raj','Spandana','Ravi Basrur','N.S Rajakumar'),(5,'Golmaal again','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\golmaal again.jpg','Hindi','The makers of the famous franchise unite again, this time presenting a film high on steroids - to bring the house down with laughter and fun. The same madness, extreme level of fun and more craziness will make Golmaal Again one of the best entertainers of 2017. The original cast reunites along with powerhouse performers like Tabu and Parineeti Chopra making this franchise one of the most awaited Diwali releases of the year. ','Ajay Devgan','Parineeti Chopra','Rohit Shetty','Ajav Devgan'),(6,'Secret superstar','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\secret superstar.jpg','Hindi','Fourteen year old Insia aspires to become a singer, but her overbearing father stands in the way of her great dream. However, under a veil of anonymity, she soon becomes an internet sensation - a Secret Superstar. With the world in awe of her rare gift and a celebrated musician as a mentor by her side, Insia embarks on an exciting journey that changes her life and the lives of everyone around her. ','Aamir Khan','Zaira Wasim','Advait Chandan','Aamir Khan'),(7,'Judwaa 2','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\judwaa 2.jpg','Hindi','Raja and Prem - the iconic Jodi from Judwaa 2 are back after 20 years. Superstar Varun Dhawan, who is known for his comic timing, is set to entertain audiences through this rib-tickling comedy that promises to be an all-out family entertainer. Setting the temperatures soaring are two of the hottest actresses - Jacqueline Fernandes and Taapsee Pannu, in a never-seen-before avatar.','Varun Dhawan','Taapsee Pannu','David Dhawan','Sajid Nadiadwala'),(8,'Good time','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\good time.jpg','English','A bank robber finds himself unable to evade those who are looking for him. ','Robert Pattinson','Jenifer Jason','Joshua Sadfie','Ben Safdie'),(9,'Americanmade','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\americanmade.jpg','English','A biographical crime drama based on the life of Adler Berriman Seal, a commercial airline pilot who becomes the focal point of a covert CIA operation and soon finds himself dangerously juggling roles an informant, drug smuggler and gunrunner.','Tom Cruise','Sarah Wright','Dough Liman','Brian Grazer'),(10,'Geostorm','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\geostorm.jpg','English','When catastrophic climate change endangers Earth\'s very survival, world governments unite and create the Dutch Boy Program: a world wide net of satellites, surrounding the planet, that are armed with geoengineering technologies designed to stave off the natural disasters. ','Gerard Butler','Abbie Corninsh','Dean Devlin','David Ellison'),(11,'Angel','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\angel.jpg','Telugu','The story revolves around two guys who make use of different ways to earn money and enjoy life, but their life changes when they accidentally get a statue, which is an angel from heaven.','Naga Avnesh','Hebah Patel','Bahubali Palani','Bhuvan Sagar'),(12,'Raja the great','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\raja the great.jpg','Telugu','An honest police officer\'s efforts to bring a powerful crime lord to justice costs him his life and endangers his beloved daughter. The only person who could save her and stop the mayhem is Raja, a blind man blessed with the gift of a sharp wit and some extraordinary abilities. ','Ravi Teja','Mehreen Kaur','Anil Ravipudi','Dil Raju'),(13,'Mersal','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\mersal.jpg','Tamil','The story of Mersal unfurls in three different time periods, in which Vijay plays three different characters, a doctor, a magician and a village leader from Madurai. In this action thriller film, a magician and a doctor attempt to solve a healthcare threat that is looming large over the country and in the process expose the corruption in the Indian medical industry','Vijay','Kajal Agarwal','Atlee Kumar','H Murali'),(14,'Aval','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\aval.jpg','Tamil','A neurosurgeon (played by Siddharth) and his wife (played by Andrea Jeremiah), a newly-wed couple move into a new neighborhood and soon realize that the house next door, inhabiting a little girl and her mother, is haunted. Although initially reluctant to believe the stories of supernatural elements, the doctor, after a close encounter with the possessed resorts to exorcism to help save the neighbors. ','Siddharth','Andrea','Miland Raju','Siddharth'),(15,'Villain','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\villain.jpg','Malayalam','A killer who is infamous for committing flawless crimes has become a nemesis for the police department. Unable to trap him, a retired cop is summoned to solve the case and a game of cat and mouse hunt ensues. ','Mohanlal','Andrea','B Unikrishnan','Rockline Venkatesh'),(16,'Thor: Ragnarok','C:\\Users\\Narayan Hasyagar\\Desktop\\Pict\\thor.jpg','English','Upon finding himself in a gladiatorial match against the Hulk, his former ally, Thor must fight for survival and to save his people from the ruthless Hela from destroying Asgard. ','Chris Hemsworth','Cate Blanchet','Stan Lee','Stan Lee'),(17,'bangalore',NULL,'english',NULL,'shivakumar','gshghsgh','hyagts','tyhwyr');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_description`
--

DROP TABLE IF EXISTS `movie_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_description` (
  `Movie_ID` int(11) NOT NULL,
  `Synopsis` varchar(600) DEFAULT NULL,
  `Actor` varchar(30) DEFAULT NULL,
  `Actress` varchar(30) DEFAULT NULL,
  `Director` varchar(30) DEFAULT NULL,
  `Producer` varchar(30) DEFAULT NULL,
  KEY `movie_description_ibfk_1` (`Movie_ID`),
  CONSTRAINT `movie_description_ibfk_1` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_description`
--

LOCK TABLES `movie_description` WRITE;
/*!40000 ALTER TABLE `movie_description` DISABLE KEYS */;
INSERT INTO `movie_description` VALUES (1,'Tarak, the grandson of a Bengaluru-based businessman who grows up in Europe is reluctant to visit India despite several pleas by his grandfather. All goes well for him until he falls in love with Meera, a selfless person who lives for the happiness of others. The two share a blissful relationship, however, things change when Meera poses Tarak a 60-day challenge to prove his real love for her. To prove his love, Tarak accepts and as part of the challenge visits India and soon finds himself in a tricky situation that would ruin his relationship. What happens next, forms the crux. ','Darshan Thoogudeep','Shruti Hariharan','Prakash','K.S.Dushyanth'),(2,'Purmy\'s life turns upside down when he is arrested by the police one morning under the charges of picking a bag containing money, lying on the street. The money was, in fact, ransom money demanded by kidnappers from a wealthy businessman in exchange for his school-going son, John. Purmy clumsily attempts to prove his innocence and that he has nothing to do with the kidnapping, but is, obviously, on the police\'s radar. With the ongoing investigation, a number of twists and turns make the police suspect everyone, including their own kin. ','Rishi','Shraddha Shrinath','Simple Suni','Amrej Suryavanshi'),(3,'A romantic action drama about the life of an easygoing youngster named Surya, whose life takes some unexpected turns thanks to the three women he meets along the way. ','Dhruva Sarja','Rachita Ram','Chetan Kumar','R Srinavas'),(4,'Kumar, a school teacher working in the city, comes back to his native to pursue his long-cherished dream of opening a school in his hometown that would provide quality education to the lesser fortunate children. He takes his uncle\'s and friend\'s help to build the school but soon faces many obstacles. How he tackles the problems, forms the crux. ','Ashok Raj','Spandana','Ravi Basrur','N.S Rajakumar'),(5,'The makers of the famous franchise unite again, this time presenting a film high on steroids - to bring the house down with laughter and fun. The same madness, extreme level of fun and more craziness will make Golmaal Again one of the best entertainers of 2017. The original cast reunites along with powerhouse performers like Tabu and Parineeti Chopra making this franchise one of the most awaited Diwali releases of the year. ','Ajay Devgan','Parineeti Chopra','Rohit Shetty','Ajav Devgan'),(6,'Fourteen year old Insia aspires to become a singer, but her overbearing father stands in the way of her great dream. However, under a veil of anonymity, she soon becomes an internet sensation - a Secret Superstar. With the world in awe of her rare gift and a celebrated musician as a mentor by her side, Insia embarks on an exciting journey that changes her life and the lives of everyone around her. ','Aamir Khan','Zaira Wasim','Advait Chandan','Aamir Khan'),(7,'Raja and Prem - the iconic Jodi from Judwaa 2 are back after 20 years. Superstar Varun Dhawan, who is known for his comic timing, is set to entertain audiences through this rib-tickling comedy that promises to be an all-out family entertainer. Setting the temperatures soaring are two of the hottest actresses - Jacqueline Fernandes and Taapsee Pannu, in a never-seen-before avatar.','Varun Dhawan','Taapsee Pannu','David Dhawan','Sajid Nadiadwala'),(8,'A bank robber finds himself unable to evade those who are looking for him. ','Robert Pattinson','Jenifer Jason','Joshua Sadfie','Ben Safdie'),(9,'A biographical crime drama based on the life of Adler Berriman Seal, a commercial airline pilot who becomes the focal point of a covert CIA operation and soon finds himself dangerously juggling roles an informant, drug smuggler and gunrunner.','Tom Cruise','Sarah Wright','Dough Liman','Brian Grazer'),(10,'A biographical crime drama based on the life of Adler Berriman Seal, a commercial airline pilot who becomes the focal point of a covert CIA operation and soon finds himself dangerously juggling roles an informant, drug smuggler and gunrunner.','Gerard Butler','Abbie Corninsh','Dean Devlin','David Ellison'),(11,'The story revolves around two guys who make use of different ways to earn money and enjoy life, but their life changes when they accidentally get a statue, which is an angel from heaven.','Naga Avnesh','Hebah Patel','Bahubali Palani','Bhuvan Sagar'),(12,'An honest police officer\'s efforts to bring a powerful crime lord to justice costs him his life and endangers his beloved daughter. The only person who could save her and stop the mayhem is Raja, a blind man blessed with the gift of a sharp wit and some extraordinary abilities. ','Ravi Teja','Mehreen Kaur','Anil Ravipudi','Dil Raju'),(13,'The story of Mersal unfurls in three different time periods, in which Vijay plays three different characters, a doctor, a magician and a village leader from Madurai. In this action thriller film, a magician and a doctor attempt to solve a healthcare threat that is looming large over the country and in the process expose the corruption in the Indian medical industry','Vijay','Kajal Agarwal','Atlee Kumar','H Murali'),(14,'A neurosurgeon (played by Siddharth) and his wife (played by Andrea Jeremiah), a newly-wed couple move into a new neighborhood and soon realize that the house next door, inhabiting a little girl and her mother, is haunted. Although initially reluctant to believe the stories of supernatural elements, the doctor, after a close encounter with the possessed resorts to exorcism to help save the neighbors. ','Siddharth','Andrea','Miland Raju','Siddharth'),(15,'A killer who is infamous for committing flawless crimes has become a nemesis for the police department. Unable to trap him, a retired cop is summoned to solve the case and a game of cat and mouse hunt ensues. ','Mohanlal','Manju Warrier','B Unikrishnan','Rockline Venkatesh');
/*!40000 ALTER TABLE `movie_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_rating`
--

DROP TABLE IF EXISTS `movie_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_rating` (
  `Movie_ID` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `Rating` int(2) unsigned DEFAULT NULL,
  `Review` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Movie_ID`,`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_rating`
--

LOCK TABLES `movie_rating` WRITE;
/*!40000 ALTER TABLE `movie_rating` DISABLE KEYS */;
INSERT INTO `movie_rating` VALUES (1,'Narayan',3,'this is good movie , i watvhed i t, you also do that dont hesitae.'),(2,'Narayan',4,'hello'),(2,'Nisarg',4,'I watched it twice , fan of this movie.'),(2,'Pavan',5,'Awesome'),(2,'Sujayendra',5,'I haven\'t watched it still!!\r\n'),(2,'Vinay',1,NULL),(3,'Narayan',4,'Very good movie'),(3,'Nithin',4,'this is good movie , i watvhed i t, you also do that dont hesitae.'),(4,'Narayan',4,'wow !!!!   awesome movie'),(4,'Pavan',5,'this is nice movie'),(4,'Pranav',5,'Movie with good story'),(5,'Narayan',5,'Very funny and entertaining movie'),(5,'Nithin',2,'wow !!!!   awesome movie'),(6,'Nisarg',4,'this is good movie , i watvhed i t, you also do that dont hesitae.'),(7,'Niteesh',3,'Dont watch this !!!!'),(8,'Narayan',5,'It\'s a good entertaining movie'),(8,'Pavan',4,'this is good movie , i watvhed i t, you also do that dont hesitae.'),(9,'Narayan',5,NULL),(9,'Pavan',3,'wow !!!!   awesome movie'),(10,'Nithin',4,'this is bad movi'),(11,'Narayan',4,'very sensible movie ...........'),(11,'Pavan',3,'Very good story but bad direction...'),(12,'Narayan',3,'Mass entertainer!!!!'),(12,'Niteesh',4,'wow !!!!   awesome movie'),(13,'Narayan',5,'Great movie'),(13,'Niteesh',3,'this is good movie , i watvhed i t, you also do that dont hesitae.'),(14,'Nisarg',4,'this is not good movie'),(15,'Narayan',4,'It\'s a good thriller movie'),(15,'Pavan',2,'this is good movie , i watvhed i t, you also do that dont hesitae.'),(16,'Narayan',5,'Awesome movie by marvel filled with comedy.');
/*!40000 ALTER TABLE `movie_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_review`
--

DROP TABLE IF EXISTS `movie_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_review` (
  `Movie_ID` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `Review` varchar(100) DEFAULT NULL,
  KEY `username_idx` (`username`),
  KEY `Movie_ID` (`Movie_ID`),
  CONSTRAINT `Movie_ID` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `userdetail` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_review`
--

LOCK TABLES `movie_review` WRITE;
/*!40000 ALTER TABLE `movie_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_in`
--

DROP TABLE IF EXISTS `played_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `played_in` (
  `Movie_ID` int(11) NOT NULL,
  `Theatre_ID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `Time` time NOT NULL,
  `seat` varchar(75) DEFAULT NULL,
  `Date` date NOT NULL,
  KEY `Thatre_ID` (`Theatre_ID`),
  KEY `Movie_ID` (`Movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_in`
--

LOCK TABLES `played_in` WRITE;
/*!40000 ALTER TABLE `played_in` DISABLE KEYS */;
INSERT INTO `played_in` VALUES (1,1,100,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000001','2017-12-30'),(1,1,100,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(2,2,100,'13:00:00','1010011000000011111001110000000001100000000000000000000000000111000000','2017-11-30'),(3,3,100,'15:30:00','1010011000000000000001110000000000001100000000000000000000000111000000','2017-12-30'),(4,4,190,'17:00:00','1010011001000000000101110000000000000000000000000000000000000111000000','2017-11-30'),(5,1,100,'09:00:00','1010011000000000000001110000000000100000000001000000000000000111000000','2017-12-02'),(6,2,180,'09:30:00','1010011000000000000001010000000000011000000000000000000001000111000000','2017-11-30'),(7,3,170,'15:00:00','1010011000000000000001100000000000000000000000000000000000000111000000','2017-12-01'),(8,4,100,'17:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(9,1,160,'12:00:00','1010011000000000000001100000000000000000000001000000000000000111000000','2017-12-02'),(10,2,150,'19:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(11,3,100,'19:00:00','1010011000000000000000110000000000000000000000000000000000000111000000','2017-12-30'),(12,4,120,'15:00:00','1010011000000000000001010000000100000000001000000000000000000111000000','2017-11-30'),(13,1,100,'13:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(14,2,130,'13:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(15,3,130,'13:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(1,1,100,'12:00:00','1010011000000000000001110000000000010000000000100000000000000111000000','2017-11-30'),(2,1,100,'11:00:00','1010011000000010000001111000000000100000000000000000000000000111000000','2017-11-30'),(2,1,130,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(3,1,130,'11:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(4,1,140,'14:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(5,1,100,'18:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(6,1,150,'10:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(7,1,170,'19:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(8,1,100,'17:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(9,1,180,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(10,1,100,'15:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(11,1,190,'10:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(12,1,190,'19:30:00','1010011000000000000001110000000000000000110000000000000000000111000000','2017-11-30'),(13,1,150,'17:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(14,1,100,'15:30:00','1010011000000000000001110000000000000000110000000000000000000111000000','2017-11-30'),(15,1,130,'11:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-11-30'),(16,1,100,'13:30:00','1010011010000000000001110000000000000110000000000000000000000111000000','2017-11-30'),(1,1,120,'18:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(2,1,100,'17:30:00','1010011000000000000001110000000000000000001000000000000000000111000000','2017-12-02'),(3,1,140,'13:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(4,1,100,'15:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(5,1,190,'16:00:00','1010011000000000000001110000000000000000001000000000000000000111000000','2017-12-01'),(6,1,100,'14:00:00','1010011000000000000001110000000000000000000000000000100000000111000000','2017-12-02'),(7,1,100,'12:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(8,1,100,'09:00:00','1010011000000000000001110000000000000000000000000000100000000111000000','2017-12-02'),(9,1,190,'11:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(10,1,100,'18:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(11,1,160,'16:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(12,1,140,'14:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(13,1,100,'12:30:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(14,1,120,'14:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(15,1,100,'14:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(16,1,120,'15:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(1,1,100,'13:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-01'),(1,1,100,'12:00:00','1010011000000000000001110000000000000000000001100000000000000111000000','2017-12-02'),(2,3,100,'13:00:00','1010011000000000000001111100000000000000000000000000000000000111000000','2017-12-02'),(3,2,100,'15:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(4,4,100,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(5,3,100,'16:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(6,2,100,'14:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(7,1,100,'17:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(8,4,100,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(9,3,100,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(10,2,100,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02'),(11,1,100,'12:00:00','1010011000000000000001110000000000000000000000000000000000000111000000','2017-12-02');
/*!40000 ALTER TABLE `played_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre`
--

DROP TABLE IF EXISTS `theatre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theatre` (
  `Theatre_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(15) NOT NULL,
  PRIMARY KEY (`Theatre_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre`
--

LOCK TABLES `theatre` WRITE;
/*!40000 ALTER TABLE `theatre` DISABLE KEYS */;
INSERT INTO `theatre` VALUES (1,'PVR :Forum','Bengaluru'),(2,'Gopalan Arcade,R.R.Nagar','Bengaluru'),(3,'Innovative Multiplex :Marathahalli','Bengaluru'),(4,'Inox,Garuda Mall','Bengaluru'),(5,'Fun Cinemas,Sigma Mall','Bengaluru');
/*!40000 ALTER TABLE `theatre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `Ticket_ID` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `Movie_Name` varchar(45) DEFAULT NULL,
  `Theatre_Name` varchar(45) DEFAULT NULL,
  `No_ticket` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Showtime` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Ticket_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'Narayan','kataka','Gopalan Arcade,R.R.Nagar',3,570,'10:30:00','2017-11-29'),(2,'Narayan','kataka','Gopalan Arcade,R.R.Nagar',3,570,'12:00:00','2017-11-29'),(3,'Narayan','golmaal again','Innovative Multiplex :Marathahalli',1,180,'17:30:00','2017-11-29'),(4,'Narayan','golmaal again','Innovative Multiplex :Marathahalli',1,180,'14:15:00','2017-11-29'),(5,'Narayan','judwaa 2','PVR :Forum',3,660,'09:00:00','2017-11-29'),(6,'Narayan','judwaa 2','PVR :Forum',3,660,'18:30:00','2017-11-29'),(7,'Narayan','aval','Inox,Garuda Mall',3,600,'19:00:00','2017-11-29'),(8,'Narayan','aval','Inox,Garuda Mall',3,600,'19:00:00','2017-11-29'),(9,'Narayan','tarak','Gopalan Arcade,R.R.Nagar',2,360,'12:30:00','2017-11-29'),(10,'NithinHK','alamelamma','Inox,Garuda Mall',3,660,'11:15:00','2017-11-29'),(11,'Pavan','tarak','PVR :Forum',5,900,'13:30:00','2017-11-29'),(12,'Subbu','angel','PVR :Forum',1,180,'16:45:00','2017-11-29'),(13,'Narayan','bharjari','PVR :Forum',3,600,'16:45:00','2017-11-29'),(14,'Narayan','mersal','Innovative Multiplex :Marathahalli',2,360,'09:30:00','2017-11-29'),(15,'Narayan','secret superstar','Inox,Garuda Mall',2,300,'09:45:00','2017-11-29'),(16,'Nisarg','judwaa 2','PVR :Forum',4,880,'14:25:00','2017-11-29'),(17,'Nisarg','judwaa 2','PVR :Forum',4,880,'14:25:00','2017-11-29'),(18,'Nisarg','judwaa 2','PVR :Forum',2,440,'17:30:00','2017-11-29'),(19,'Nisarg','judwaa 2','PVR :Forum',1,220,'13:00:00','2017-11-29'),(20,'Pavan','villain','Fun Cinemas,Sigma Mall',2,440,'14:30:00','2017-11-29'),(21,'Narayan','geostorm','Fun Cinemas,Sigma Mall',3,600,'12:00:00','2017-11-29'),(22,'Narayan','thor: ragnarok','PVR :Forum',3,600,'10:30:00','2017-11-29'),(23,'Narayan','thor: ragnarok','PVR :Forum',4,800,'10:30:00','2017-11-29'),(24,'Pavan','raja the great','Gopalan Arcade,R.R.Nagar',2,600,'15:00:00','2017-11-29'),(25,'Narayan','alamelamma','Innovative Multiplex :Marathahalli',3,600,'14:00:00','2017-11-29'),(26,'Pavan','alamelamma','Innovative Multiplex :Marathahalli',2,400,'14:00:00','2017-11-29'),(27,'Narayan','alamelamma','Innovative Multiplex :Marathahalli',2,400,'14:00:00','2017-11-29'),(28,'Pavan','bharjari','Fun Cinemas,Sigma Mall',3,630,'09:30:00','2017-11-29'),(29,'Pavan','alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(30,'Roopa','thor: ragnarok','PVR :Forum',3,600,'10:30:00','2017-11-29'),(31,'Narayan','mersal','Innovative Multiplex :Marathahalli',2,360,'13:45:00','2017-11-29'),(32,'Narayan','Bharjari','Fun Cinemas,Sigma Mall',1,210,'09:30:00','2017-11-29'),(33,'Narayan','Kataka','Gopalan Arcade,R.R.Nagar',2,380,'18:00:00','2017-11-29'),(34,'Narayan','Tarak','Gopalan Arcade,R.R.Nagar',2,360,'15:00:00','2017-11-29'),(35,'Narayan','Judwaa 2','Fun Cinemas,Sigma Mall',3,750,'14:25:00','2017-11-29'),(36,'Narayan','Raja the great','Gopalan Arcade,R.R.Nagar',2,600,'15:00:00','2017-11-29'),(37,'Narayan','Good time','Gopalan Arcade,R.R.Nagar',2,460,'20:30:00','2017-11-29'),(38,'Narayan','Good time','Gopalan Arcade,R.R.Nagar',2,460,'20:30:00','2017-11-29'),(39,'Narayan','Americanmade','Innovative Multiplex :Marathahalli',3,720,'21:00:00','2017-11-29'),(40,'Narayan','Americanmade','Innovative Multiplex :Marathahalli',2,480,'21:00:00','2017-11-29'),(41,'Narayan','Americanmade','Innovative Multiplex :Marathahalli',2,480,'21:00:00','2017-11-29'),(42,'Narayan','Americanmade','Innovative Multiplex :Marathahalli',2,480,'21:00:00','2017-11-29'),(43,'Narayan','Americanmade','Innovative Multiplex :Marathahalli',2,480,'21:00:00','2017-11-29'),(44,'Narayan','Americanmade','Innovative Multiplex :Marathahalli',2,480,'21:00:00','2017-11-29'),(45,'Pavan','Tarak','Gopalan Arcade,R.R.Nagar',3,540,'15:00:00','2017-11-29'),(46,'NithinHK','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(47,'Pavan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(48,'NithinHK','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(49,'NithinHK','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(50,'NithinHK','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(51,'NithinHK','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(52,'NithinHK','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(53,'NithinHK','Americanmade','Innovative Multiplex :Marathahalli',2,480,'21:00:00','2017-11-29'),(54,'NithinHK','Americanmade','Innovative Multiplex :Marathahalli',2,480,'21:00:00','2017-11-29'),(55,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(56,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(57,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(58,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(59,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(60,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(61,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(62,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(63,'Narayan','Alamelamma','Inox,Garuda Mall',2,440,'13:00:00','2017-11-29'),(64,'Pavan','Secret superstar','Inox,Garuda Mall',3,450,'11:00:00','2017-11-29'),(65,'Pavan','Secret superstar','Inox,Garuda Mall',2,300,'11:00:00','2017-11-29'),(66,'Narayan','Kataka','Gopalan Arcade,R.R.Nagar',2,380,'18:00:00','2017-11-29'),(67,'Narayan','Alamelamma','Innovative Multiplex :Marathahalli',2,400,'14:00:00','2017-11-29'),(68,'Narayan','Alamelamma','Innovative Multiplex :Marathahalli',2,400,'14:00:00','2017-11-29'),(69,'Subbu','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(70,'Subbu','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(71,'Subbu','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(72,'Subbu','Thor: Ragnarok','PVR :Forum',2,400,'10:30:00','2017-11-29'),(73,'Narayan','Villain','Fun Cinemas,Sigma Mall',2,440,'22:00:00','2017-11-29'),(74,'Sujayendra','Tarak','Gopalan Arcade,R.R.Nagar',3,540,'15:00:00','2017-11-29'),(75,'Narayan','Thor: Ragnarok','PVR :Forum',3,600,'14:00:00','2017-11-29'),(76,'Narayan','Thor: Ragnarok','PVR :Forum',2,400,'14:00:00','2017-11-29'),(77,'Narayan','Judwaa 2','Gopalan Arcade,R.R.Nagar',3,585,'20:30:00','2017-11-30'),(78,'Narayan','Thor: Ragnarok','Gopalan Arcade,R.R.Nagar',3,615,'15:00:00','2017-11-30'),(79,'Narayan','Golmaal again','Innovative Multiplex :Marathahalli',3,540,'10:30:00','2017-11-29'),(80,'Narayan','Golmaal again','Fun Cinemas,Sigma Mall',3,330,'15:15:00','2017-11-30'),(81,'Narayan','Golmaal again','Innovative Multiplex :Marathahalli',2,360,'10:30:00','2017-11-29'),(82,'Narayan','Golmaal again','Innovative Multiplex :Marathahalli',2,360,'10:30:00','2017-11-29'),(83,'Narayan','Bharjari','Gopalan Arcade,R.R.Nagar',3,450,'14:20:00','2017-12-01'),(84,'Narayan','Geostorm','Inox,Garuda Mall',2,420,'12:30:00','2017-11-29'),(85,'Narayan','Bharjari','Gopalan Arcade,R.R.Nagar',1,150,'14:20:00','2017-12-01'),(86,'Narayan','Bharjari','Gopalan Arcade,R.R.Nagar',1,150,'14:20:00','2017-12-01'),(87,'Narayan','Raja the great','Inox,Garuda Mall',3,750,'21:00:00','2017-11-30'),(88,'Narayan','Geostorm','Inox,Garuda Mall',5,1050,'12:30:00','2017-11-29'),(89,'Pavan','Alamelamma','Innovative Multiplex :Marathahalli',1,200,'14:00:00','2017-11-30'),(90,'Pavan','Alamelamma','Innovative Multiplex :Marathahalli',1,200,'14:00:00','2017-11-30'),(91,'Pavan','Alamelamma','Innovative Multiplex :Marathahalli',1,200,'14:00:00','2017-11-30'),(92,'Pavan','Alamelamma','Innovative Multiplex :Marathahalli',1,200,'14:00:00','2017-11-30'),(93,'Pavan','Alamelamma','Innovative Multiplex :Marathahalli',1,200,'14:00:00','2017-11-30'),(94,'Pavankumar','Tarak','Gopalan Arcade,R.R.Nagar',2,300,'22:00:00','2017-12-02'),(95,'Pavankumar','Tarak','Gopalan Arcade,R.R.Nagar',2,300,'22:00:00','2017-12-02'),(96,'Pavankumar','Alamelamma','Innovative Multiplex :Marathahalli',7,700,'13:04:00','2017-12-01'),(97,'Pavankumar','Tarak','PVR :Forum',2,200,'12:00:00','2017-11-30'),(98,'Pavankumar','Tarak','PVR :Forum',2,200,'12:00:00','2017-12-02'),(99,'Shankar','Tarak','PVR :Forum',1,130,'10:30:00','2017-12-30'),(100,'Pavan','Secret superstar','Gopalan Arcade,R.R.Nagar',2,360,'09:30:00','2017-11-30'),(101,'Narayan','Alamelamma','Innovative Multiplex :Marathahalli',2,200,'13:00:00','2017-12-02'),(102,'Narayan','Thor: Ragnarok','PVR :Forum',1,100,'13:30:00','2017-11-30'),(103,'Narayan','Kataka','Inox,Garuda Mall',2,380,'17:00:00','2017-11-30'),(104,'Vinay','Alamelamma','Gopalan Arcade,R.R.Nagar',3,300,'13:00:00','2017-11-30'),(105,'Vinay','Alamelamma','PVR :Forum',3,300,'11:00:00','2017-11-30'),(106,'Vinay','Alamelamma','Gopalan Arcade,R.R.Nagar',2,200,'13:00:00','2017-11-30');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetail`
--

DROP TABLE IF EXISTS `userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdetail` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone_number` char(11) NOT NULL,
  `Email_ID` varchar(40) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetail`
--

LOCK TABLES `userdetail` WRITE;
/*!40000 ALTER TABLE `userdetail` DISABLE KEYS */;
INSERT INTO `userdetail` VALUES ('','','','',''),('Narayan','hasyagar','Narayan','8105713798','hasyagar44@gmail.com'),('Nisarg','ak','Nisarg','9876543210','nisargak@gmail.com'),('Niteesh','bhat','Niteesh','8123465870','niteesh@gmail.com'),('NithinHK','123','Nithin H K','9012345667','nithinhk24@gmail.com'),('Pavan','sankh','Pavan','8123456789','pavankumarsankh18@gmail.com'),('Pavankumar','123','Pavan','8123641239','pavansankh123@gmail.com'),('Sham','1234','sham','8123651238','saham@gnail.com'),('Sujayendra','sujay','Sujayendra','9324354354','sujayeendraboodur955@gmail.com'),('Vinay','vinay123','Vinay','7123641239','sdjfklj@aksdfj.com');
/*!40000 ALTER TABLE `userdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-19 11:47:13
