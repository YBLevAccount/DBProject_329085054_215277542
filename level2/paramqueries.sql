USE Lev_MPDB;-- Query 1: Find the top N buildings with the highest number of students in each building-- Parameters: @N (Int)SET @N = 3; -- Replace this with the desired valueSELECT    BuildingID,    NumberOfStudentsFROM (    SELECT        Building.BuildingID,        COUNT(Student.ID) AS NumberOfStudents,        RANK() OVER (ORDER BY COUNT(Student.ID) DESC) AS RankNum    FROM        Building        JOIN Room ON Building.BuildingID = Room.BuildingID        JOIN Student ON Room.RoomID = Student.RoomID AND Room.BuildingID = Student.BuildingID    GROUP BY        Building.BuildingID) AS SubqueryWHERE    Subquery.RankNum <= @N;-- Query 2: Find the number of students in each building with more than N students-- Parameters: @N (Int)SET @N = 50; -- Replace this with the desired valueSELECT    Building.BuildingID,    COUNT(Student.ID) AS NumberOfStudentsFROM    Building    JOIN Room ON Building.BuildingID = Room.BuildingID    JOIN Student ON Room.RoomID = Student.RoomID AND Room.BuildingID = Student.BuildingIDGROUP BY    Building.BuildingIDHAVING    COUNT(Student.ID) > @N;-- Query 3: Find the top N oldest students-- Parameters: @N (Int)SET @N = 5; -- Replace this with the desired valuePREPARE stmt FROM 'SELECT Person.ID, Person.Name, Student.EnrollmentDateFROM PersonJOIN Student ON Person.ID = Student.IDORDER BY Student.EnrollmentDate ASCLIMIT ?';EXECUTE stmt USING @N;DEALLOCATE PREPARE stmt;-- Query 4: Find the workers who work in buildings with more than N students-- Parameters: @N (Int)SET @N = 10; -- Replace this with the desired valueSELECT DISTINCT    Worker.ID,    Person.Name AS WorkerNameFROM    Worker    JOIN WorksIn ON Worker.ID = WorksIn.ID    JOIN Building ON WorksIn.BuildingID = Building.BuildingID    JOIN Room ON Building.BuildingID = Room.BuildingID    JOIN Student ON Room.RoomID = Student.RoomID AND Room.BuildingID = Student.BuildingID    JOIN Person ON Worker.ID = Person.IDGROUP BY    Worker.ID,    Person.NameHAVING    COUNT(Student.ID) > @N;