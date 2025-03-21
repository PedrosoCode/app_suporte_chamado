CREATE DATABASE  IF NOT EXISTS `suporte_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `suporte_database`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: suporte_database
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `tb_cad_empresa`
--

DROP TABLE IF EXISTS `tb_cad_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cad_empresa` (
  `codigo` int NOT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cad_empresa`
--

LOCK TABLES `tb_cad_empresa` WRITE;
/*!40000 ALTER TABLE `tb_cad_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cad_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cad_parceiro_negocio`
--

DROP TABLE IF EXISTS `tb_cad_parceiro_negocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cad_parceiro_negocio` (
  `codigo` int NOT NULL,
  `codigo_empresa` int NOT NULL,
  `nome_fantasia` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigo_empresa`),
  KEY `fk_parceiro_negocio_empresa` (`codigo_empresa`),
  CONSTRAINT `fk_parceiro_negocio_empresa` FOREIGN KEY (`codigo_empresa`) REFERENCES `tb_cad_empresa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cad_parceiro_negocio`
--

LOCK TABLES `tb_cad_parceiro_negocio` WRITE;
/*!40000 ALTER TABLE `tb_cad_parceiro_negocio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cad_parceiro_negocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cad_usuario`
--

DROP TABLE IF EXISTS `tb_cad_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cad_usuario` (
  `codigo` int NOT NULL,
  `codigo_empresa` int NOT NULL,
  `codigo_parceiro_negocio` int NOT NULL,
  `nome_usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigo_empresa`,`codigo_parceiro_negocio`),
  KEY `fk_usuario_empresa` (`codigo_parceiro_negocio`,`codigo_empresa`),
  CONSTRAINT `fk_usuario_empresa` FOREIGN KEY (`codigo_parceiro_negocio`, `codigo_empresa`) REFERENCES `tb_cad_parceiro_negocio` (`codigo`, `codigo_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cad_usuario`
--

LOCK TABLES `tb_cad_usuario` WRITE;
/*!40000 ALTER TABLE `tb_cad_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cad_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_chat_mensagem`
--

DROP TABLE IF EXISTS `tb_chat_mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_chat_mensagem` (
  `codigo` int NOT NULL,
  `codigo_empresa` int NOT NULL,
  `codigo_parceiro_negocio` int NOT NULL,
  `codigo_chat` int NOT NULL,
  `codigo_usuario` int NOT NULL,
  `mensagem` varchar(512) DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigo_empresa`,`codigo_parceiro_negocio`,`codigo_chat`,`codigo_usuario`),
  KEY `fk_chat_mensagem_sessao` (`codigo_chat`,`codigo_parceiro_negocio`,`codigo_empresa`),
  KEY `fk_chat_sessao_usuario_participante` (`codigo_chat`,`codigo_empresa`,`codigo_parceiro_negocio`,`codigo_usuario`),
  CONSTRAINT `fk_chat_mensagem_sessao` FOREIGN KEY (`codigo_chat`, `codigo_parceiro_negocio`, `codigo_empresa`) REFERENCES `tb_chat_sessao` (`codigo`, `codigo_parceiro_negocio`, `codigo_empresa`),
  CONSTRAINT `fk_chat_sessao_usuario_participante` FOREIGN KEY (`codigo_chat`, `codigo_empresa`, `codigo_parceiro_negocio`, `codigo_usuario`) REFERENCES `tb_chat_sessao_participante` (`codigo_chat`, `codigo_empresa`, `codigo_parceiro_negocio`, `codigo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_chat_mensagem`
--

LOCK TABLES `tb_chat_mensagem` WRITE;
/*!40000 ALTER TABLE `tb_chat_mensagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_chat_mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_chat_sessao`
--

DROP TABLE IF EXISTS `tb_chat_sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_chat_sessao` (
  `codigo` int NOT NULL,
  `codigo_parceiro_negocio` int NOT NULL,
  `codigo_empresa` int NOT NULL,
  `codigo_acesso` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`codigo_parceiro_negocio`,`codigo_empresa`),
  KEY `fk_chat_sessao_empresa` (`codigo_parceiro_negocio`,`codigo_empresa`),
  CONSTRAINT `fk_chat_sessao_empresa` FOREIGN KEY (`codigo_parceiro_negocio`, `codigo_empresa`) REFERENCES `tb_cad_parceiro_negocio` (`codigo`, `codigo_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_chat_sessao`
--

LOCK TABLES `tb_chat_sessao` WRITE;
/*!40000 ALTER TABLE `tb_chat_sessao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_chat_sessao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_chat_sessao_participante`
--

DROP TABLE IF EXISTS `tb_chat_sessao_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_chat_sessao_participante` (
  `codigo_chat` int NOT NULL,
  `codigo_empresa` int NOT NULL,
  `codigo_parceiro_negocio` int NOT NULL,
  `codigo_usuario` int NOT NULL,
  PRIMARY KEY (`codigo_chat`,`codigo_empresa`,`codigo_parceiro_negocio`,`codigo_usuario`),
  KEY `fk_chat_sessao_usuario` (`codigo_usuario`,`codigo_empresa`),
  CONSTRAINT `fk_chat_sessao_participante_chat` FOREIGN KEY (`codigo_chat`, `codigo_empresa`, `codigo_parceiro_negocio`) REFERENCES `tb_chat_sessao` (`codigo`, `codigo_parceiro_negocio`, `codigo_empresa`),
  CONSTRAINT `fk_chat_sessao_usuario` FOREIGN KEY (`codigo_usuario`, `codigo_empresa`) REFERENCES `tb_cad_usuario` (`codigo`, `codigo_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_chat_sessao_participante`
--

LOCK TABLES `tb_chat_sessao_participante` WRITE;
/*!40000 ALTER TABLE `tb_chat_sessao_participante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_chat_sessao_participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'suporte_database'
--

--
-- Dumping routines for database 'suporte_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20 22:11:50
