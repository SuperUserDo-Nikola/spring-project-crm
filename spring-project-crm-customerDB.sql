CREATE DATABASE  IF NOT EXISTS `spring_project`;

USE `spring_project`;


-- Server version	8.0.32

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nikola','Stankov','hernikola@icloud.com','Las Vegas','Las Vegas Blvrd'),
(2,'Demario','Morar','zkulas@example.com','North Kurt','5586 Marcia Village Suite 753\nWizashire, PA 57724-'),
(3,'Lillian','Runolfsdottir','jerad02@example.org','Hellerborough','3024 Rosella Lake\nNorth Bernadettebury, CO 19877-3'),
(4,'Mathew','Haag','durgan.celia@example.org','South Omerland','2638 Joelle Grove Apt. 176\nWarrenmouth, MS 51843-4'),
(5,'Theodora','Mertz','mose.bailey@example.com','East Lenny','848 Doyle Corners Suite 323\nFerryfurt, KY 30617'),
(7,'Karina','Hodkiewicz','dandre.mann@example.com','Wittingburgh','72486 Gerry Bypass Apt. 859\nNorbertoville, HI 7968'),
(8,'Kaleb','Dicki','bennie76@example.org','McCulloughbury','963 Augustine Fields\nGradyberg, SD 73459-7135'),
(9,'Rod','Prosacco','nola71@example.com','Robelland','19735 Sadie Pine Apt. 139\nRuthtown, AK 45539-3706'),
(10,'Nicklaus','Rowe','janis26@example.com','Lake Gabriellaview','296 Koepp Drive\nAdelechester, MO 50113-0619'),
(11,'Daryl','Turcotte','jonathon49@example.com','East Antwonchester','090 Elda Fields\nMcKenziefurt, ID 15642'),
(12,'Cole','Mitchell','wolf.jovani@example.org','Santiagoside','87721 Anderson Loop\nDenesikport, IA 64280'),
(13,'Quinn','Raynor','bednar.marta@example.org','Miastad','007 Hyatt Tunnel\nRoobhaven, IL 19879-8660'),
(14,'Precious','DuBuque','yhand@example.com','Jerdeburgh','9739 Samir Passage\nSchillerstad, OK 16246-5328'),
(15,'Laney','Wintheiser','hlang@example.org','Gwenbury','66308 Watsica Trafficway Suite 388\nAntoniettamouth'),
(16,'Destin','Windler','kody64@example.net','New Keaganfort','4577 Eddie Row\nSouth Vergieport, FL 58658'),
(17,'Louie','Hirthe','aurore63@example.net','North Manley','807 Blake Flat Apt. 375\nHoppefurt, DC 16397-5134'),
(18,'Beaulah','Rippin','uheathcote@example.org','West Dexterville','15281 Elwyn Harbors\nMurazikborough, TX 33043-8096'),
(19,'Zion','Farrell','walter48@example.net','Windlerborough','44196 Robyn Junction Suite 089\nWest Arlene, TN 085'),
(21,'Anastasia','Hammes','brandt.altenwerth@example.net','Kovacekborough','629 Dare Run\nEduardochester, SC 19174-4940'),
(22,'Brianne','Schuppe','brunte@example.org','Port Jacklyn','39880 Alison Brook Suite 707\nWest Charles, OR 2268'),
(24,'Sigmund','Stark','roberts.kayla@example.com','Kreigerburgh','37814 Bruen Parkways Apt. 186\nEast Lelahton, NM 56'),
(25,'Gaylord','Schumm','herman.meda@example.org','East Hildegardhaven','69742 Retha Isle\nNigelville, FL 37018'),
(26,'Roosevelt','Becker','douglas.marc@example.com','Langoshland','39983 Chanel Estates Apt. 974\nPort Adalineburgh, P'),
(27,'Lula','Rippin','johann.yost@example.com','Yazminchester','49986 Schultz Streets\nSouth Kianaville, OR 83856'),
(28,'Humberto','Rath','wendell86@example.net','Reynoldshaven','964 Aufderhar Keys\nPort Estellfurt, OR 48974-9211'),
(29,'Jacquelyn','Blanda','jaqueline18@example.net','Mertiemouth','472 Jennifer Overpass\nEast Sandrine, SD 40691'),
(30,'Arely','Jenkins','brenna.lindgren@example.com','Colestad','3829 Donna Circle Apt. 303\nKonopelskichester, MT 1'),
(31,'Oliver','Schamberger','buddy.shields@example.org','Lake Micah','2984 Mayer Club Suite 843\nFarrelltown, FL 89601-89'),
(32,'Katrine','Kuhn','whodkiewicz@example.net','Olsonview','733 Gennaro Garden\nKarelleport, NE 67901-6514'),
(33,'Malachi','Konopelski','wschultz@example.net','South Caden','765 Maria Shore\nLangoshmouth, SD 85493'),
(34,'Sydnie','Conn','walter.christina@example.org','Feeneyberg','572 Kay Meadow Suite 865\nLake Winifred, VA 72614'),
(35,'Samanta','Brown','ypollich@example.net','East Shania','16172 Johathan Street Apt. 750\nPadbergport, RI 616'),
(36,'Isai','Jacobi','kamron92@example.com','Lake Mckaylafort','40953 Cathryn Creek Suite 108\nRosenbaumview, PA 36'),
(37,'Randall','Schmeler','haag.lamont@example.net','Port Daniellechester','57384 Goldner Fort\nPort Linwoodstad, NY 91562'),
(38,'Oran','Stehr','mbrakus@example.com','Champlinshire','26727 Orpha Estates Suite 479\nSouth Unaberg, IL 91'),
(39,'Gwendolyn','Crooks','dion02@example.net','Mullermouth','42777 Mohammed Locks Suite 920\nPort Elenoramouth, '),
(40,'Mozelle','Howe','jocelyn14@example.com','South Brandtberg','71183 Hansen Lock Suite 717\nPietrohaven, NM 26143');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 21:24:11
