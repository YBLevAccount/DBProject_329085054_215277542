-- Use the database
USE Lev_MPDB;

-- Create or replace the AllDataBeforeChanges view
CREATE OR REPLACE VIEW AllDataBeforeChanges AS
SELECT 
    P.ID AS PersonID, 
    P.Name, 
    P.Age, 
    P.PhoneNumber, 
    B.BuildingID, 
    R.RoomID, 
    R.MaxCapacity,
    W.HireDate, 
    S.EnrollmentDate, 
    S.Major, 
    M.Department, 
    C.Shift
FROM 
    Person P
LEFT JOIN 
    Student S ON P.ID = S.ID
LEFT JOIN 
    Worker W ON P.ID = W.ID
LEFT JOIN 
    Manager M ON W.ID = M.ID
LEFT JOIN 
    Cleaner C ON W.ID = C.ID
LEFT JOIN 
    WorksIn WI ON W.ID = WI.ID
LEFT JOIN 
    Building B ON WI.BuildingID = B.BuildingID
LEFT JOIN 
    Room R ON S.RoomID = R.RoomID AND S.BuildingID = R.BuildingID;

-- Create or replace the AllNewData view
CREATE OR REPLACE VIEW AllNewData AS
SELECT 
    P.ID AS PersonID, 
    P.Name, 
    P.Fname, 
    P.Lname, 
    P.Age, 
    P.PhoneNumber, 
    S.StartOfStudy,
    B.BuildingID, 
    R.RoomID, 
    R.MaxCapacity,
    W.HireDate, 
    S.EnrollmentDate, 
    S.Major, 
    M.Department, 
    C.Shift,
    T.ID AS TeacherID, 
    CO.CourseID, 
    CO.Name AS CourseName, 
    CO.Department AS CourseDepartment, 
    CO.Credits,
    IC.StudentID, 
    IC.CourseID AS InCourseID,
    TE.TeacherID AS TeachingTeacherID, 
    TE.CourseID AS TeachingCourseID
FROM 
    Person P
LEFT JOIN 
    Student S ON P.ID = S.ID
LEFT JOIN 
    Worker W ON P.ID = W.ID
LEFT JOIN 
    Manager M ON W.ID = M.ID
LEFT JOIN 
    Cleaner C ON W.ID = C.ID
LEFT JOIN 
    WorksIn WI ON W.ID = WI.ID
LEFT JOIN 
    Building B ON WI.BuildingID = B.BuildingID
LEFT JOIN 
    Room R ON S.RoomID = R.RoomID AND S.BuildingID = R.BuildingID
LEFT JOIN 
    Teacher T ON W.ID = T.ID
LEFT JOIN 
    inCourse IC ON S.ID = IC.StudentID
LEFT JOIN 
    teaching TE ON T.ID = TE.TeacherID
LEFT JOIN 
    Course CO ON CO.CourseID = TE.CourseID;

-- Query for the AllDataBeforeChanges view
SELECT 
    B.BuildingID,
    COUNT(DISTINCT S.ID) AS NumberOfStudents,
    AVG(P.Age) AS AverageAge
FROM 
    AllDataBeforeChanges A
INNER JOIN 
    Building B ON A.BuildingID = B.BuildingID
INNER JOIN 
    Student S ON A.PersonID = S.ID
INNER JOIN 
    Person P ON A.PersonID = P.ID
GROUP BY 
    B.BuildingID;

-- Query for the AllNewData view - Number of courses taught by each teacher
SELECT 
    T.ID,
    COUNT(DISTINCT CO.CourseID) AS NumberOfCoursesTaught,
    AVG(CO.Credits) AS AverageCredits
FROM 
    AllNewData A
LEFT JOIN 
    Teacher T ON A.TeachingTeacherID = T.ID
LEFT JOIN 
    Course CO ON A.TeachingCourseID = CO.CourseID
GROUP BY 
    T.ID;

-- Query for the AllNewData view - Average credits of courses per department
SELECT 
    CO.Department,
    COUNT(DISTINCT CO.CourseID) AS NumberOfCourses,
    AVG(CO.Credits) AS AverageCredits
FROM 
    AllNewData A
LEFT JOIN 
    Course CO ON A.CourseID = CO.CourseID
GROUP BY 
    CO.Department;
