-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: lev_mpdb
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Temporary view structure for view `alldatabeforechanges`
--

DROP TABLE IF EXISTS `alldatabeforechanges`;
/*!50001 DROP VIEW IF EXISTS `alldatabeforechanges`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alldatabeforechanges` AS SELECT 
 1 AS `PersonID`,
 1 AS `Name`,
 1 AS `Age`,
 1 AS `PhoneNumber`,
 1 AS `BuildingID`,
 1 AS `RoomID`,
 1 AS `MaxCapacity`,
 1 AS `HireDate`,
 1 AS `EnrollmentDate`,
 1 AS `Major`,
 1 AS `Department`,
 1 AS `Shift`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allnewdata`
--

DROP TABLE IF EXISTS `allnewdata`;
/*!50001 DROP VIEW IF EXISTS `allnewdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `allnewdata` AS SELECT 
 1 AS `PersonID`,
 1 AS `Name`,
 1 AS `Fname`,
 1 AS `Lname`,
 1 AS `Age`,
 1 AS `PhoneNumber`,
 1 AS `StartOfStudy`,
 1 AS `BuildingID`,
 1 AS `RoomID`,
 1 AS `MaxCapacity`,
 1 AS `HireDate`,
 1 AS `EnrollmentDate`,
 1 AS `Major`,
 1 AS `Department`,
 1 AS `Shift`,
 1 AS `TeacherID`,
 1 AS `CourseID`,
 1 AS `CourseName`,
 1 AS `CourseDepartment`,
 1 AS `Credits`,
 1 AS `StudentID`,
 1 AS `InCourseID`,
 1 AS `TeachingTeacherID`,
 1 AS `TeachingCourseID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `BuildingID` int NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,NULL),(2,NULL);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaner`
--

DROP TABLE IF EXISTS `cleaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaner` (
  `Shift` varchar(20) NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `cleaner_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `worker` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaner`
--

LOCK TABLES `cleaner` WRITE;
/*!40000 ALTER TABLE `cleaner` DISABLE KEYS */;
INSERT INTO `cleaner` VALUES ('Night',4);
/*!40000 ALTER TABLE `cleaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Credits` int NOT NULL,
  `TeacherID` int NOT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `TeacherID` (`TeacherID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Introduction to Programming','Computer Science',4,3),(2,'Calculus I','Mathematics',3,3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incourse`
--

DROP TABLE IF EXISTS `incourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incourse` (
  `StudentID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`StudentID`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `incourse_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`ID`),
  CONSTRAINT `incourse_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incourse`
--

LOCK TABLES `incourse` WRITE;
/*!40000 ALTER TABLE `incourse` DISABLE KEYS */;
INSERT INTO `incourse` VALUES (2,1),(3,2);
/*!40000 ALTER TABLE `incourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `Department` varchar(50) NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `worker` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('Administration',1);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `Age` int NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `ID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_person_name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (25,'555-1234',1,'John Doe','John','Doe'),(22,'555-5678',2,'Jane Smith','Jane','Smith'),(29,'555-8765',3,'Alice Johnson','Alice','Johnson'),(30,'555-4321',4,'Bob Brown','Bob','Brown');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomID` int NOT NULL,
  `MaxCapacity` int NOT NULL,
  `BuildingID` int NOT NULL,
  `RoomName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RoomID`,`BuildingID`),
  KEY `BuildingID` (`BuildingID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`),
  CONSTRAINT `CHK_Room_MaxCapacity` CHECK ((`MaxCapacity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,2,1,NULL),(102,3,1,NULL),(201,2,2,NULL),(202,4,2,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `EnrollmentDate` date NOT NULL,
  `Major` varchar(50) NOT NULL DEFAULT 'Undeclared',
  `ID` int NOT NULL,
  `RoomID` int DEFAULT NULL,
  `BuildingID` int DEFAULT NULL,
  `GPA` decimal(3,2) DEFAULT NULL,
  `StartOfStudy` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RoomID` (`RoomID`,`BuildingID`),
  KEY `idx_student_major` (`Major`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`RoomID`, `BuildingID`) REFERENCES `room` (`RoomID`, `BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2021-09-01','Computer Science',2,101,1,NULL,'2021-09-01'),('2020-09-01','Mathematics',3,201,2,NULL,'2020-09-01');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `worker` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (3);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching`
--

DROP TABLE IF EXISTS `teaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching` (
  `TeacherID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`TeacherID`,`CourseID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `teaching_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`ID`),
  CONSTRAINT `teaching_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching`
--

LOCK TABLES `teaching` WRITE;
/*!40000 ALTER TABLE `teaching` DISABLE KEYS */;
INSERT INTO `teaching` VALUES (3,1),(3,2);
/*!40000 ALTER TABLE `teaching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `HireDate` date NOT NULL,
  `ID` int NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES ('2020-01-15',1,NULL),('2019-03-10',3,NULL),('2018-06-23',4,NULL);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worksin`
--

DROP TABLE IF EXISTS `worksin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worksin` (
  `ID` int NOT NULL,
  `BuildingID` int NOT NULL,
  PRIMARY KEY (`ID`,`BuildingID`),
  KEY `BuildingID` (`BuildingID`),
  CONSTRAINT `worksin_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `worker` (`ID`),
  CONSTRAINT `worksin_ibfk_2` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worksin`
--

LOCK TABLES `worksin` WRITE;
/*!40000 ALTER TABLE `worksin` DISABLE KEYS */;
INSERT INTO `worksin` VALUES (1,1),(4,1),(3,2);
/*!40000 ALTER TABLE `worksin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `alldatabeforechanges`
--

/*!50001 DROP VIEW IF EXISTS `alldatabeforechanges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alldatabeforechanges` AS select `p`.`ID` AS `PersonID`,`p`.`Name` AS `Name`,`p`.`Age` AS `Age`,`p`.`PhoneNumber` AS `PhoneNumber`,`b`.`BuildingID` AS `BuildingID`,`r`.`RoomID` AS `RoomID`,`r`.`MaxCapacity` AS `MaxCapacity`,`w`.`HireDate` AS `HireDate`,`s`.`EnrollmentDate` AS `EnrollmentDate`,`s`.`Major` AS `Major`,`m`.`Department` AS `Department`,`c`.`Shift` AS `Shift` from (((((((`person` `p` left join `student` `s` on((`p`.`ID` = `s`.`ID`))) left join `worker` `w` on((`p`.`ID` = `w`.`ID`))) left join `manager` `m` on((`w`.`ID` = `m`.`ID`))) left join `cleaner` `c` on((`w`.`ID` = `c`.`ID`))) left join `worksin` `wi` on((`w`.`ID` = `wi`.`ID`))) left join `building` `b` on((`wi`.`BuildingID` = `b`.`BuildingID`))) left join `room` `r` on(((`s`.`RoomID` = `r`.`RoomID`) and (`s`.`BuildingID` = `r`.`BuildingID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allnewdata`
--

/*!50001 DROP VIEW IF EXISTS `allnewdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allnewdata` AS select `p`.`ID` AS `PersonID`,`p`.`Name` AS `Name`,`p`.`Fname` AS `Fname`,`p`.`Lname` AS `Lname`,`p`.`Age` AS `Age`,`p`.`PhoneNumber` AS `PhoneNumber`,`s`.`StartOfStudy` AS `StartOfStudy`,`b`.`BuildingID` AS `BuildingID`,`r`.`RoomID` AS `RoomID`,`r`.`MaxCapacity` AS `MaxCapacity`,`w`.`HireDate` AS `HireDate`,`s`.`EnrollmentDate` AS `EnrollmentDate`,`s`.`Major` AS `Major`,`m`.`Department` AS `Department`,`c`.`Shift` AS `Shift`,`t`.`ID` AS `TeacherID`,`co`.`CourseID` AS `CourseID`,`co`.`Name` AS `CourseName`,`co`.`Department` AS `CourseDepartment`,`co`.`Credits` AS `Credits`,`ic`.`StudentID` AS `StudentID`,`ic`.`CourseID` AS `InCourseID`,`te`.`TeacherID` AS `TeachingTeacherID`,`te`.`CourseID` AS `TeachingCourseID` from (((((((((((`person` `p` left join `student` `s` on((`p`.`ID` = `s`.`ID`))) left join `worker` `w` on((`p`.`ID` = `w`.`ID`))) left join `manager` `m` on((`w`.`ID` = `m`.`ID`))) left join `cleaner` `c` on((`w`.`ID` = `c`.`ID`))) left join `worksin` `wi` on((`w`.`ID` = `wi`.`ID`))) left join `building` `b` on((`wi`.`BuildingID` = `b`.`BuildingID`))) left join `room` `r` on(((`s`.`RoomID` = `r`.`RoomID`) and (`s`.`BuildingID` = `r`.`BuildingID`)))) left join `teacher` `t` on((`w`.`ID` = `t`.`ID`))) left join `incourse` `ic` on((`s`.`ID` = `ic`.`StudentID`))) left join `teaching` `te` on((`t`.`ID` = `te`.`TeacherID`))) left join `course` `co` on((`co`.`CourseID` = `te`.`CourseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-14 16:34:22
