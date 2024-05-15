# Dormitory Control Database Project

### Introduction

We are part of the Lev group, which is dedicated to creating a comprehensive system for a university. The subdivision that my friend Yair and I are working on focuses on managing the dormitories.

### Project Overview

This project was developed by **Yonatan Berkovitch** and **Yair Shprecher** as part of our coursework at Lev. The aim of the project is to design and implement a database system for managing university dormitories. This README file outlines the project's process and specifies its components.

### Stage 1 - Design

#### The Project

Our group at Lev has a clear target: to create a comprehensive database for a university's dormitory management. Our specific focus is on the "dormitories" control component.

#### The Components

The "dormitories" component of the project comprises seven key entities and one relationship.

#### Entities

1. **Person**  
   Represents an individual associated with the dormitories. This entity holds basic information about the person, such as phone number and age.  
   - **Key**: `ID` (Integer, Primary Key) - A unique identifier for the person.
   - **Fields**: 
     - `PhoneNumber` (String) - The person's phone number.
     - `Age` (Integer) - The person's age.

2. **Student**  
   A student residing in the dormitories. This entity contains information relevant to their residence in the dormitory.  
   - **Inherits**: `Person`
   - **Key**: `ID` (Integer, Primary Key) - Inherited from `Person`.
   - **Fields**:
     - `RoomID` (Integer, Foreign Key) - References the room the student is assigned to.
     - `BuildingID` (Integer, Foreign Key) - References the building the student's room is part of.
     - `EnrollmentDate` (Date) - The date the student enrolled in the dormitory.
     - `Major` (String) - The student's major field of study.

3. **Worker**  
   Represents a worker associated with the dormitories, including both managers and cleaners.  
   - **Inherits**: `Person`
   - **Key**: `ID` (Integer, Primary Key) - Inherited from `Person`.
   - **Fields**:
     - `HireDate` (Date) - The date the worker was hired.

4. **Manager**  
   Oversees either the facility maintenance or the overall administration of the dormitory.  
   - **Inherits**: `Worker`
   - **Key**: `ID` (Integer, Primary Key) - Inherited from `Worker`.
   - **Fields**:
     - `Department` (String) - The department the manager is part of.

5. **Cleaner**  
   Responsible for the cleanliness and upkeep of the dormitory buildings.  
   - **Inherits**: `Worker`
   - **Key**: `ID` (Integer, Primary Key) - Inherited from `Worker`.
   - **Fields**:
     - `Shift` (String) - The cleaner's work shift (e.g., morning, evening).

6. **Building**  
   Represents a dormitory building within the university campus.  
   - **Key**: `BuildingID` (Integer, Primary Key) - A unique identifier for the building.
   - **Fields**:
     - `Name` (String) - The name of the building.
     - `Address` (String) - The address of the building.

7. **Room**  
   Represents a room within a dormitory building, accommodating students. It is a weak entity dependent on the `Building` entity.  
   - **Key**: 
     - `RoomID` (Integer, Composite Key) - A unique identifier for the room.
     - `BuildingID` (Integer, Foreign Key) - References the building the room is part of.
   - **Fields**:
     - `Capacity` (Integer) - The number of students the room can accommodate.
     - `FloorNumber` (Integer) - The floor number where the room is located.

#### Relationships

1. **WorksIn**  
   Represents the relationship between a worker and the buildings they work in.  
   - **Fields**:
     - `WorkerID` (Integer, Foreign Key) - References the worker.
     - `BuildingID` (Integer, Foreign Key) - References the building.
     - **Composite Key**: (`WorkerID`, `BuildingID`)

### Entity-Relationship Diagram (ERD)

![ERD](ERD.png)
