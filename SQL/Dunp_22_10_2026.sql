CREATE DATABASE  IF NOT EXISTS `bd_aluguel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_aluguel`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_aluguel
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `aluguel`
--

DROP TABLE IF EXISTS `aluguel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluguel` (
  `ALU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ALU_DATA_ALUGUEL` date NOT NULL,
  `ALU_DATA_DEVOLUCAO` date NOT NULL,
  `ALU_VALOR` double NOT NULL,
  `FK_CLI_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ALU_ID`),
  KEY `FK_CLI_ID` (`FK_CLI_ID`),
  CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`FK_CLI_ID`) REFERENCES `cliente` (`CLI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel`
--

LOCK TABLES `aluguel` WRITE;
/*!40000 ALTER TABLE `aluguel` DISABLE KEYS */;
INSERT INTO `aluguel` VALUES (1,'2026-10-08','2026-10-15',600.9,2);
/*!40000 ALTER TABLE `aluguel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluguel_produto`
--

DROP TABLE IF EXISTS `aluguel_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluguel_produto` (
  `ALP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FK_PRO_ID` int(11) NOT NULL,
  `FK_ALU_ID` int(11) NOT NULL,
  PRIMARY KEY (`ALP_ID`),
  KEY `FK_PRO_ID` (`FK_PRO_ID`),
  KEY `FK_ALU_ID` (`FK_ALU_ID`),
  CONSTRAINT `aluguel_produto_ibfk_1` FOREIGN KEY (`FK_PRO_ID`) REFERENCES `produto` (`PRO_ID`),
  CONSTRAINT `aluguel_produto_ibfk_2` FOREIGN KEY (`FK_ALU_ID`) REFERENCES `aluguel` (`ALU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel_produto`
--

LOCK TABLES `aluguel_produto` WRITE;
/*!40000 ALTER TABLE `aluguel_produto` DISABLE KEYS */;
INSERT INTO `aluguel_produto` VALUES (1,1,1),(2,1,1);
/*!40000 ALTER TABLE `aluguel_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CLI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLI_NOME` varchar(50) NOT NULL,
  `CLI_CPF` varchar(11) NOT NULL,
  `CLI_EMAIL` varchar(50) NOT NULL,
  `CLI_TELEFONE` varchar(9) NOT NULL,
  PRIMARY KEY (`CLI_ID`),
  UNIQUE KEY `CLI_CPF` (`CLI_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Rafael','42973404886','rafael@email.com','990258869'),(2,'Davi','12345678901','davi@email.com','123456789'),(93,'Ana Silva','12345674901','Ana.Silva@email.com','889125341'),(94,'Bruno Souza','22345678902','Bruno.Souza@email.com','119112947'),(95,'Carla Mendes','32345678903','Carla.Mendes@email.com','649550462'),(96,'Daniel Rocha','42345678904','Daniel.Rocha@email.com','349239228'),(97,'Eliane Costa','52345678905','Eliane.Costa@email.com','929019576'),(98,'Felipe Lima','62345678906','Felipe.Lima@email.com','829738651'),(99,'Gisele Martins','72345678907','Gisele.Martins@email.com','329383245'),(100,'Henrique Alves','82345678908','Henrique.Alves@email.com','939570819'),(101,'Isabela Ferreira','92345678909','Isabela.Ferreira@email.com','929797184'),(102,'João Oliveira','02345678910','João.Oliveira@email.com','279783499');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `PRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_NOME` varchar(50) NOT NULL,
  `PRO_DESCRICAO` varchar(200) DEFAULT NULL,
  `PRO_PRECO` double NOT NULL,
  `PRO_QTD_DISPONIVEIS` int(11) NOT NULL,
  PRIMARY KEY (`PRO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Ipone 18 Pro Max',NULL,590.9,100),(2,'Lancha Turbo','Lancha Tubo Para Rio e Mar',5590.9,5),(4,'Smartphone Samsung Galaxy S21','Smartphone com tela de 6.2 polegadas, 128GB de armazenamento',350,15),(5,'TV LG 55\" 4K','Smart TV com resolução 4K e HDR',280,8),(6,'Drone DJI Phantom 4','Drone com câmera 4K e estabilização de imagem',300,55),(7,'Câm. Canon EOS T7','Câmera DSLR com lente 18-55mm, 24.1MP',250,2),(8,'Câmera GoPro Hero 9','Câmera de ação com resolução 5K e resistência à água',80,60),(9,'Tenda Eventos 5x5m','Tenda resistente à água e fácil de montar',200,4),(10,'Microfone Shure SM58','Microfone para apresentações e shows',40,35),(11,'Mesa de Som Behringer','Mesa de som com 16 canais e efeitos integrados',500,3),(12,'Kit de Iluminação Fotográfica','Kit com softbox, tripés e lâmpadas de LED',100,6);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-22  8:05:36
