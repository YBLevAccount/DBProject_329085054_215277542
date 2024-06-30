# Dormitory Control Database Project

## Introduction

We are part of the Lev group, which is dedicated to creating a comprehensive system for a university. The subdivision that my colleague Yair Shprecher and I are working on focuses on managing the university's dormitories.

## Project Overview

This project was developed by **Yonatan Berkovitch** and **Yair Shprecher** as part of our coursework at Lev. The aim of the project is to design and implement a database system for managing university dormitories. This README file outlines the project's process and specifies its components.

## Stage 1 - Design

### The Project

Our group at Lev has a clear target: to create a comprehensive database for managing university dormitory facilities. Our specific focus is on the dormitory control component.

### The Components

The dormitory control component of the project comprises seven key entities and one relationship.

### Entities

1. **Person**
   - Represents an individual associated with the dormitories.
   - **Fields**:
     - `ID` (Integer, Primary Key) - A unique identifier for the person.
     - `PhoneNumber` (String) - The person's phone number.
     - `Age` (Integer) - The person's age.
     - `Name` (String) - The person's name.

2. **Student**
   - A student residing in the dormitories.
   - **Inherits**: `Person`
   - **Fields**:
     - `RoomID` (Integer, Foreign Key) - References the room the student is assigned to.
     - `BuildingID` (Integer, Foreign Key) - References the building the student's room is part of.
     - `EnrollmentDate` (Date) - The date the student enrolled in the dormitory.
     - `Major` (String) - The student's major field of study.

3. **Worker**
   - Represents a worker associated with the dormitories, including both managers and cleaners.
   - **Inherits**: `Person`
   - **Fields**:
     - `HireDate` (Date) - The date the worker was hired.

4. **Manager**
   - Oversees either the facility maintenance or the overall administration of the dormitory.
   - **Inherits**: `Worker`
   - **Fields**:
     - `Department` (String) - The type of department the manager is part of.

5. **Cleaner**
   - Responsible for the cleanliness and upkeep of the dormitory buildings.
   - **Inherits**: `Worker`
   - **Fields**:
     - `Shift` (String) - The type of shift the cleaner works.

6. **Building**
   - Represents a dormitory building within the university campus.
   - **Key**: `BuildingID` (Integer, Primary Key) - A unique identifier for the building.

7. **Room**
   - Represents a room within a dormitory building, accommodating students. It is a weak entity dependent on the Building entity.
   - **Key**: 
     - `RoomID` (Integer, Composite Key) - A unique identifier for the room.
     - `BuildingID` (Integer, Foreign Key) - References the building the room is part of.
   - **Fields**:
     - `MaxCapacity` (Integer) - The maximum number of students the room can accommodate.
     - `Floor` (Integer) - The floor number where the room is located.

### Relationships

1. **WorksIn**
   - Represents the relationship between a worker and the buildings they work in.
   - **Fields**:
     - `WorkerID` (Integer, Foreign Key) - References the worker.
     - `BuildingID` (Integer, Foreign Key) - References the building.
     - **Composite Key**: (`WorkerID`, `BuildingID`)

## Entity-Relationship Diagram (ERD)

![ERD](https://github.com/YBLevAccount/DataBaseProject/assets/100221042/933bc4ad-9691-47b0-a273-2c51ee6bf2ce)


## Data-Structure Diagram (DSD)

![DSD](https://github.com/YBLevAccount/DataBaseProject/assets/100221042/2ada7594-8545-4ef0-bfeb-c23d3e84df50)


## The Data Base

The base contains 4 scripts for operation:
   - [CreateTable](level1/createTable.sql) creates the tables
   - [DropTable](level1/dropTable.sql) delete the tables
   - [InsertTable](level1/insertTable.sql) insert data
   - [SelectAll](level1/selectAll.sql) select all the data in the data base

also we have [Backup](level1/backup.sql) as a backup file for the data base

for inserting the data, we have pictures from the methods used to generate the data
![GENB](level1/gen_Building.png)
![GENC](level1/gen_Cleaner.png)
![GENM](level1/gen_Manager.png)
![GENP](level1/gen_Person.png)
![GENR](level1/gen_Room.png)
![GENS](level1/gen_Student.png)
![GENW](level1/gen_Worker.png)
![GENWI](level1/gen_WorksIn.png)

and also python script that helped a lot: [Script](level1/insertTableScript.py)

picture of uploading the data:
![Insert](level1/InsertAll.png)

pictures of desc commands:
![DESCB](level1/BuildingDesc.png)
![DESCC](level1/CleanerDesc.png)
![DESCM](level1/ManagerDesc.png)
![DESCP](level1/PersonDesc.png)
![DESCR](level1/RoomDesc.png)
![DESCS](level1/StudentDesc.png)
![DESCW](level1/WorkerDesc.png)
![DESCI](level1/WorksInDesc.png)

picture of reloading the data using the backup file:
![Backup](level1/backup.png)


## Stage 2 - Queries

there are 8 queries in the file [Queries](level2/queries.sql)
   - Select all students managed by a specific manager and show the number of students managed by each manager
   - Select rooms with more students than their capacity
   - Promote a cleaner with 10 years of experience to a manager
   - Delete the oldest student from each room where the number ofDelete students who are enrolled in rooms with a maximum capacity of 1 and have no workers assigned to their building
   - Total number of cleaners and managers in each building with more than one cleaner and manager
   - Most common major in each building
   - Double the capacity of rooms where the current capacity equals the number of students in the room

and 4 parameter queries in the file [ParamQueries](level2/paramqueries.sql)
   - Find the top N buildings with the highest number of students in each building
   - Find the number of students in each building with more than N students
   - Find the top N oldest students
   - Find the workers who work in buildings with more than N students

there are also 3 constraints in [Constraints](level2/Constraints.sql):
   - rooms must have capaticy of more then zero
   - hire date cannot be in the future
   - default Major for new students

here are pictures of the scripts:

![Queries](level2/queries.png)
![ParamQueries](level2/paramqueries.png)
![Constraints](level2/Constraints.png)

also there is a new backup in the file:
[Backup2](level2/backup2.sql)

## stage 3 - function and procedures

in this stage we have 6 files:
   - [Func1](level3/function1.sql)
     params: building ID
     return: the amount of workers in the given building
   - [Func2](level3/function2.sql)
     params: major (string)
     returns: the amout of students in this major
   - [Proc1](level3/procedure1.sql)
     insert new student into room
     params: studentID, room key
     errors: 45000 if room is full 
   - [Proc2](level3/procedure2.sql)
     promote worker to manager
     params: workerID, department
     error: 45000 if the ID is student ID 
   - [Main1](level3/main_function1.sql)
     calls function1 and procedure1
   - [Main2](level3/main_functio2.sql)
   - calls function2 and procedure2
