-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbpointwork
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `tbavisos`
--

DROP TABLE IF EXISTS `tbavisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbavisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `conteudo` varchar(1000) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbAvisos_tbFuncionario1_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbAvisos_tbFuncionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `tbfuncionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbavisos`
--

LOCK TABLES `tbavisos` WRITE;
/*!40000 ALTER TABLE `tbavisos` DISABLE KEYS */;
INSERT INTO `tbavisos` VALUES (9,'lorem ipsum','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis tellus lacinia nisi rhoncus dignissim. Mauris dapibus convallis ipsum, et imperdiet nibh iaculis in. Donec ac nunc euismod nunc imperdiet laoreet in nec odio. In non consequat massa. Quisque et arcu felis. Fusce sed ligula urna','2023-09-10',7);
/*!40000 ALTER TABLE `tbavisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcargo`
--

DROP TABLE IF EXISTS `tbcargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcargo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) NOT NULL,
  `salario_base` float NOT NULL,
  `carga_horaria` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcargo`
--

LOCK TABLES `tbcargo` WRITE;
/*!40000 ALTER TABLE `tbcargo` DISABLE KEYS */;
INSERT INTO `tbcargo` VALUES (1,'funcionário',1850,160);
/*!40000 ALTER TABLE `tbcargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbferias`
--

DROP TABLE IF EXISTS `tbferias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbferias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int NOT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` varchar(45) DEFAULT NULL,
  `data_vencimento` datetime NOT NULL,
  `data_solicitacao` datetime DEFAULT NULL,
  `data_autorizacao` datetime DEFAULT NULL,
  `status_autorizacao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbFerias_tbFuncionario1_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbFerias_tbFuncionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `tbfuncionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbferias`
--

LOCK TABLES `tbferias` WRITE;
/*!40000 ALTER TABLE `tbferias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbferias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbfuncionario`
--

DROP TABLE IF EXISTS `tbfuncionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbfuncionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` bigint NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `carga_horaria_mensal` float DEFAULT NULL,
  `data_admissao` date NOT NULL,
  `data_demissao` date NOT NULL,
  `id_cargo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbFuncionario_tbCargo_idx` (`id_cargo`),
  CONSTRAINT `fk_tbFuncionario_tbCargo` FOREIGN KEY (`id_cargo`) REFERENCES `tbcargo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfuncionario`
--

LOCK TABLES `tbfuncionario` WRITE;
/*!40000 ALTER TABLE `tbfuncionario` DISABLE KEYS */;
INSERT INTO `tbfuncionario` VALUES (7,'Matheus Cervelheri',12345678901,'matheuscervelheri@gmail.com','$2b$10$dGDgKXG8nOMsW9XLrnBvR.FJ5iB/xcjoj9.mCk4FYXSnpTe8knpgy',220,'2023-09-01','2023-09-04',1);
/*!40000 ALTER TABLE `tbfuncionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbholerite`
--

DROP TABLE IF EXISTS `tbholerite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbholerite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int NOT NULL,
  `mes_emissao` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  `desconto` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbHolerite_tbFuncionario1_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbHolerite_tbFuncionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `tbfuncionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbholerite`
--

LOCK TABLES `tbholerite` WRITE;
/*!40000 ALTER TABLE `tbholerite` DISABLE KEYS */;
INSERT INTO `tbholerite` VALUES (13,7,'10','1707.27','150.825');
/*!40000 ALTER TABLE `tbholerite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbhorasextras`
--

DROP TABLE IF EXISTS `tbhorasextras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbhorasextras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int NOT NULL,
  `quantidade_horas_extras` int NOT NULL,
  `mes` int DEFAULT NULL,
  `ano` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbHorasExtras_tbFuncionario1_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbHorasExtras_tbFuncionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `tbfuncionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbhorasextras`
--

LOCK TABLES `tbhorasextras` WRITE;
/*!40000 ALTER TABLE `tbhorasextras` DISABLE KEYS */;
INSERT INTO `tbhorasextras` VALUES (20,7,1,10,2023);
/*!40000 ALTER TABLE `tbhorasextras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbjustificativas_faltas`
--

DROP TABLE IF EXISTS `tbjustificativas_faltas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbjustificativas_faltas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `motivo` varchar(45) NOT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbJustificativas_Faltas_tbFuncionario1_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbJustificativas_Faltas_tbFuncionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `tbfuncionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbjustificativas_faltas`
--

LOCK TABLES `tbjustificativas_faltas` WRITE;
/*!40000 ALTER TABLE `tbjustificativas_faltas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbjustificativas_faltas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbregistro_ponto`
--

DROP TABLE IF EXISTS `tbregistro_ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbregistro_ponto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int NOT NULL,
  `data` date DEFAULT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `hora_saida_intervalo` datetime DEFAULT NULL,
  `hora_entrada_intervalo` datetime DEFAULT NULL,
  `hora_saida` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbRegistro_Ponto_tbFuncionario1_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbRegistroPonto_tbFuncionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `tbfuncionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbregistro_ponto`
--

LOCK TABLES `tbregistro_ponto` WRITE;
/*!40000 ALTER TABLE `tbregistro_ponto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbregistro_ponto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-19 23:33:54
