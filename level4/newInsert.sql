-- Use the database
USE Lev_MPDB;

-- Insert sample data into Person table
INSERT INTO Person (ID, Name, Fname, Lname, Age, PhoneNumber) VALUES
(1, 'John Doe', 'John', 'Doe', 25, '555-1234'),
(2, 'Jane Smith', 'Jane', 'Smith', 22, '555-5678'),
(3, 'Alice Johnson', 'Alice', 'Johnson', 29, '555-8765'),
(4, 'Bob Brown', 'Bob', 'Brown', 30, '555-4321');

-- Insert sample data into Building table
INSERT INTO Building (BuildingID) VALUES
(1),
(2);

-- Insert sample data into Room table
INSERT INTO Room (RoomID, BuildingID, MaxCapacity) VALUES
(101, 1, 2),
(102, 1, 3),
(201, 2, 2),
(202, 2, 4);

-- Insert sample data into Worker table
INSERT INTO Worker (ID, HireDate) VALUES
(1, '2020-01-15'),
(3, '2019-03-10'),
(4, '2018-06-23');

-- Insert sample data into Student table
INSERT INTO Student (ID, EnrollmentDate, Major, StartOfStudy, RoomID, BuildingID) VALUES
(2, '2021-09-01', 'Computer Science', '2021-09-01', 101, 1),
(3, '2020-09-01', 'Mathematics', '2020-09-01', 201, 2);

-- Insert sample data into Manager table
INSERT INTO Manager (ID, Department) VALUES
(1, 'Administration');

-- Insert sample data into Cleaner table
INSERT INTO Cleaner (ID, Shift) VALUES
(4, 'Night');

-- Insert sample data into WorksIn table
INSERT INTO WorksIn (ID, BuildingID) VALUES
(1, 1),
(3, 2),
(4, 1);

-- Insert sample data into Teacher table
INSERT INTO Teacher (ID) VALUES
(3);

-- Insert sample data into Course table
INSERT INTO Course (CourseID, Name, Department, Credits, TeacherID) VALUES
(1, 'Introduction to Programming', 'Computer Science', 4, 3),
(2, 'Calculus I', 'Mathematics', 3, 3);

-- Insert sample data into inCourse table
INSERT INTO inCourse (StudentID, CourseID) VALUES
(2, 1),
(3, 2);

-- Insert sample data into teaching table
INSERT INTO teaching (TeacherID, CourseID) VALUES
(3, 1),
(3, 2);
