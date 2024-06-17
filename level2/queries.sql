USE Lev_MPDB;

-- 1. Select all students managed by a specific manager and show the number of students managed by each manager
SELECT
    Manager.ID AS ManagerID,
    Person.Name AS ManagerName,
    COUNT(Student.ID) AS NumberOfStudents
FROM
    Manager
    JOIN Worker ON Manager.ID = Worker.ID
    JOIN WorksIn ON Worker.ID = WorksIn.ID
    JOIN Building ON WorksIn.BuildingID = Building.BuildingID
    JOIN Room ON Building.BuildingID = Room.BuildingID
    LEFT JOIN Student ON Room.RoomID = Student.RoomID AND Room.BuildingID = Student.BuildingID
    JOIN Person ON Manager.ID = Person.ID
GROUP BY
    Manager.ID,
    Person.Name;

-- 2. Select rooms with more students than their capacity
SELECT
    Room.RoomID,
    Room.BuildingID,
    Room.MaxCapacity,
    COUNT(Student.ID) AS NumberOfStudents
FROM
    Room
    LEFT JOIN Student ON Room.RoomID = Student.RoomID AND Room.BuildingID = Student.BuildingID
GROUP BY
    Room.RoomID,
    Room.BuildingID,
    Room.MaxCapacity
HAVING
    COUNT(Student.ID) > Room.MaxCapacity;

-- 3. Promote a cleaner with 10 years of experience to a manager
WITH EligibleCleaners AS (
    SELECT
        Cleaner.ID
    FROM
        Cleaner
        JOIN Worker ON Cleaner.ID = Worker.ID
    WHERE
        DATEDIFF(CURDATE(), Worker.HireDate) / 365 >= 10
)
UPDATE Manager
SET Department = 'General Management'
WHERE ID IN (SELECT ID FROM EligibleCleaners);

-- 4. Delete the oldest student from each room where the number of students has reached the room's maximum capacity
WITH RoomOccupancy AS (
    SELECT
        Room.RoomID,
        Room.BuildingID,
        Room.MaxCapacity,
        COUNT(Student.ID) AS Occupied
    FROM
        Room
        LEFT JOIN Student ON Room.RoomID = Student.RoomID AND Room.BuildingID = Student.BuildingID
    GROUP BY
        Room.RoomID,
        Room.BuildingID,
        Room.MaxCapacity
    HAVING
        COUNT(Student.ID) >= Room.MaxCapacity
),
OldestStudents AS (
    SELECT
        Student.ID,
        Student.RoomID,
        Student.BuildingID,
        ROW_NUMBER() OVER (PARTITION BY Student.RoomID, Student.BuildingID ORDER BY Student.EnrollmentDate) AS rn
    FROM
        Student
        JOIN RoomOccupancy ON Student.RoomID = RoomOccupancy.RoomID AND Student.BuildingID = RoomOccupancy.BuildingID
)
DELETE FROM Student
WHERE ID IN (
    SELECT ID
    FROM OldestStudents
    WHERE rn = 1
);

-- 5. Delete students who are enrolled in rooms with a maximum capacity of 1 and have no workers assigned to their building
DELETE s
FROM Student s
JOIN Room r ON s.RoomID = r.RoomID AND s.BuildingID = r.BuildingID
LEFT JOIN WorksIn wi ON r.BuildingID = wi.BuildingID
WHERE r.MaxCapacity = 1 AND wi.ID IS NULL;

-- 6. Total number of cleaners and managers in each building with more than one cleaner and manager
SELECT
    b.BuildingID,
    COUNT(DISTINCT c.ID) AS TotalCleaners,
    COUNT(DISTINCT m.ID) AS TotalManagers
FROM
    WorksIn wi
JOIN
    Building b ON wi.BuildingID = b.BuildingID
JOIN
    Worker w ON wi.ID = w.ID
LEFT JOIN
    Cleaner c ON w.ID = c.ID
LEFT JOIN
    Manager m ON w.ID = m.ID
WHERE
    b.BuildingID IN (
        SELECT
            wi.BuildingID
        FROM
            WorksIn wi
        JOIN
            Cleaner c ON wi.ID = c.ID
        GROUP BY
            wi.BuildingID
        HAVING
            COUNT(DISTINCT c.ID) > 1
    )
    AND b.BuildingID IN (
        SELECT
            wi.BuildingID
        FROM
            WorksIn wi
        JOIN
            Manager m ON wi.ID = m.ID
        GROUP BY
            wi.BuildingID
        HAVING
            COUNT(DISTINCT m.ID) > 1
    )
GROUP BY
    b.BuildingID
HAVING
    COUNT(DISTINCT c.ID) > 1 AND
    COUNT(DISTINCT m.ID) > 1
ORDER BY
    b.BuildingID;

-- 7. Most common major in each building
SELECT
    b.BuildingID,
    sq.MostCommonMajor
FROM
    Building b
LEFT JOIN (
    SELECT
        s.BuildingID,
        s.Major AS MostCommonMajor,
        ROW_NUMBER() OVER (PARTITION BY s.BuildingID ORDER BY COUNT(*) DESC) AS rn
    FROM
        Student s
    GROUP BY
        s.BuildingID, s.Major
) AS sq ON b.BuildingID = sq.BuildingID AND sq.rn = 1
GROUP BY
    b.BuildingID, sq.MostCommonMajor
ORDER BY
    b.BuildingID;

-- 8. Double the capacity of rooms where the current capacity equals the number of students in the room
UPDATE Room r
JOIN (
    SELECT s.RoomID, s.BuildingID
    FROM Student s
    JOIN (
        SELECT RoomID, BuildingID, COUNT(*) AS NumStudents
        FROM Student
        GROUP BY RoomID, BuildingID
    ) AS StudentCount ON s.RoomID = StudentCount.RoomID AND s.BuildingID = StudentCount.BuildingID
    JOIN Room r ON s.RoomID = r.RoomID AND s.BuildingID = r.BuildingID
    WHERE r.MaxCapacity = StudentCount.NumStudents
) AS RoomsToUpdate ON r.RoomID = RoomsToUpdate.RoomID AND r.BuildingID = RoomsToUpdate.BuildingID
SET r.MaxCapacity = r.MaxCapacity * 2;