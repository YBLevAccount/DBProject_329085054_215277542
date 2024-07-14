-- Use the database
USE Lev_MPDB;

-- Alter Person table to add Lname and Fname
ALTER TABLE Person
ADD Fname VARCHAR(50) NOT NULL,
ADD Lname VARCHAR(50) NOT NULL;

-- Alter Student table to add StartOfStudy
ALTER TABLE Student
ADD StartOfStudy DATE NOT NULL;

-- Create Teacher table
CREATE TABLE Teacher
(
  ID INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Worker(ID)
);

-- Create Course table
CREATE TABLE Course
(
  CourseID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Department VARCHAR(100) NOT NULL,
  Credits INT NOT NULL,
  TeacherID INT NOT NULL,
  PRIMARY KEY (CourseID),
  FOREIGN KEY (TeacherID) REFERENCES Teacher(ID)
);

-- Create inCourse table to represent students in courses
CREATE TABLE inCourse
(
  StudentID INT NOT NULL,
  CourseID INT NOT NULL,
  PRIMARY KEY (StudentID, CourseID),
  FOREIGN KEY (StudentID) REFERENCES Student(ID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create teaching table to represent teachers teaching courses
CREATE TABLE teaching
(
  TeacherID INT NOT NULL,
  CourseID INT NOT NULL,
  PRIMARY KEY (TeacherID, CourseID),
  FOREIGN KEY (TeacherID) REFERENCES Teacher(ID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
