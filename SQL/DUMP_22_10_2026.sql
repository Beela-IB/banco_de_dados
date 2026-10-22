CREATE DATABASE  IF NOT EXISTS `bd_enquete` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_enquete`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_enquete
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
-- Table structure for table `enquete`
--

DROP TABLE IF EXISTS `enquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquete` (
  `ENQ_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `ENQ_DATA_INCIAL` date NOT NULL,
  `ENQ_DATA_FINAL` date DEFAULT NULL,
  `ENQ_DESCRICAO` varchar(1440) DEFAULT NULL,
  `ENQ_NOME` varchar(50) NOT NULL,
  PRIMARY KEY (`ENQ_CODIGO`),
  UNIQUE KEY `ENQ_NOME` (`ENQ_NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquete`
--

LOCK TABLES `enquete` WRITE;
/*!40000 ALTER TABLE `enquete` DISABLE KEYS */;
INSERT INTO `enquete` VALUES (1,'2026-02-01',NULL,NULL,'Satisfação do Cliente 2026'),(2,'2026-01-15',NULL,NULL,'Clima Organizacional'),(3,'2026-11-01',NULL,NULL,'Feedback do Novo Produto'),(4,'2026-12-10',NULL,NULL,'Escolha da Festa de Fim de Ano');
/*!40000 ALTER TABLE `enquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perguntas`
--

DROP TABLE IF EXISTS `perguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perguntas` (
  `PER_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `PER_DESCRICAO` varchar(500) NOT NULL,
  `FK_ENQ_CODIGO` int(11) NOT NULL,
  PRIMARY KEY (`PER_CODIGO`),
  KEY `FK_ENQ_CODIGO` (`FK_ENQ_CODIGO`),
  CONSTRAINT `perguntas_ibfk_1` FOREIGN KEY (`FK_ENQ_CODIGO`) REFERENCES `enquete` (`ENQ_CODIGO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perguntas`
--

LOCK TABLES `perguntas` WRITE;
/*!40000 ALTER TABLE `perguntas` DISABLE KEYS */;
INSERT INTO `perguntas` VALUES (21,'Como você avalia o nosso atendimento geral?',1),(22,'Qual é o seu nível de satisfação com o ambiente de trabalho?',2),(23,'O que você achou do design da nossa nova embalagem?',3),(24,'Qual sugestão de local você prefere para o evento de encerramento?',4),(25,'Você recomendaria nossos serviços para um amigo ou familiar?',4);
/*!40000 ALTER TABLE `perguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respostas`
--

DROP TABLE IF EXISTS `respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respostas` (
  `RES_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `RES_DESCRICAO` varchar(500) NOT NULL,
  `RES_CERTA` varchar(1) NOT NULL,
  `FK_PER_CODIGO` int(11) NOT NULL,
  PRIMARY KEY (`RES_CODIGO`),
  KEY `FK_PER_CODIGO` (`FK_PER_CODIGO`),
  CONSTRAINT `respostas_ibfk_1` FOREIGN KEY (`FK_PER_CODIGO`) REFERENCES `perguntas` (`PER_CODIGO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respostas`
--

LOCK TABLES `respostas` WRITE;
/*!40000 ALTER TABLE `respostas` DISABLE KEYS */;
INSERT INTO `respostas` VALUES (16,'Excelente','N',21),(17,'Bom','N',23),(18,'Regular','N',22),(19,'Ruim','N',25),(20,'Não','N',23);
/*!40000 ALTER TABLE `respostas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_responde_enquete`
--

DROP TABLE IF EXISTS `usuario_responde_enquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_responde_enquete` (
  `URE_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `URE_DATA` date NOT NULL,
  `FK_USU_CODIGO` int(11) NOT NULL,
  `FK_ENQ_CODIGO` int(11) NOT NULL,
  PRIMARY KEY (`URE_CODIGO`),
  KEY `FK_ENQ_CODIGO` (`FK_ENQ_CODIGO`),
  KEY `IDX_URE_USUARIO_ENQUETE` (`FK_USU_CODIGO`,`FK_ENQ_CODIGO`),
  CONSTRAINT `usuario_responde_enquete_ibfk_1` FOREIGN KEY (`FK_USU_CODIGO`) REFERENCES `usuarios` (`USU_CODIGO`) ON DELETE CASCADE,
  CONSTRAINT `usuario_responde_enquete_ibfk_2` FOREIGN KEY (`FK_ENQ_CODIGO`) REFERENCES `enquete` (`ENQ_CODIGO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_responde_enquete`
--

LOCK TABLES `usuario_responde_enquete` WRITE;
/*!40000 ALTER TABLE `usuario_responde_enquete` DISABLE KEYS */;
INSERT INTO `usuario_responde_enquete` VALUES (6,'2026-11-10',5,2),(7,'2026-11-10',3,1),(8,'2026-11-10',4,3),(9,'2026-11-10',2,3),(10,'2026-11-10',1,4);
/*!40000 ALTER TABLE `usuario_responde_enquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `USU_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `USU_DATA_CADASTRO` date NOT NULL,
  `USU_LOGIN` varchar(67) NOT NULL,
  `USU_AREA_ATUACAO` varchar(50) DEFAULT NULL,
  `USU_PROFISSAO` varchar(50) DEFAULT NULL,
  `USU_AREA_FORMACAO` varchar(50) DEFAULT NULL,
  `USU_DATANASC` date NOT NULL,
  `USU_ESTADO_CIVIL` enum('Solteiro','Casado','Divorciado','Viúvo') NOT NULL,
  `USU_ESTADO` varchar(2) NOT NULL,
  `USU_ESCOLARIDADE` enum('Fundamental Completo','Médio Completo','Superior') NOT NULL,
  `USU_EMAIL` varchar(100) NOT NULL,
  `USU_SENHA` varchar(255) NOT NULL,
  `USU_NOME` varchar(100) NOT NULL,
  PRIMARY KEY (`USU_CODIGO`),
  UNIQUE KEY `USU_LOGIN` (`USU_LOGIN`),
  UNIQUE KEY `USU_EMAIL` (`USU_EMAIL`),
  KEY `IDX_USUARIO_AREA_ATUACAO` (`USU_AREA_ATUACAO`),
  KEY `IDX_USUARIO_AREA_FORMACAO` (`USU_AREA_FORMACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'2026-10-15','joao.silva',NULL,NULL,NULL,'1995-08-25','Solteiro','SP','Superior','joao.silva@email.com','SenhaSegura123','João da Silva'),(2,'2026-10-15','lucas.silva',NULL,NULL,NULL,'1995-04-12','Solteiro','SP','','lucas.silva@email.com','Senha@123','Lucas Silva'),(3,'2026-10-15','mari.santos',NULL,NULL,NULL,'1988-11-23','Casado','RJ','','mariana.santos@email.com','Mari#2026','Mariana Santos'),(4,'2026-10-15','carlos.edu',NULL,NULL,NULL,'2001-07-05','Solteiro','MG','','carlos.eduardo@email.com','Cadu!9988','Carlos Eduardo'),(5,'2026-10-15','ana.oliveira',NULL,NULL,NULL,'1992-02-28','Divorciado','PR','','ana.oliveira@email.com','Ana@Secure','Ana Oliveira');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-22  8:05:57
