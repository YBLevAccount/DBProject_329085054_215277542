USE Lev_MPDB;

-- Add constraints for the Person table
ALTER TABLE Person
ADD CONSTRAINT PK_Person PRIMARY KEY (ID),
ADD CONSTRAINT CHK_Person_Age CHECK (Age >= 0),
ADD CONSTRAINT CHK_Person_PhoneNumber CHECK (PhoneNumber LIKE '[0-9]%'),
ADD CONSTRAINT DF_Person_Age DEFAULT 18;

-- Add constraints for the Building table
ALTER TABLE Building
ADD CONSTRAINT PK_Building PRIMARY KEY (BuildingID);

-- Add constraints for the Room table
ALTER TABLE Room
ADD CONSTRAINT PK_Room PRIMARY KEY (RoomID, BuildingID),
ADD CONSTRAINT FK_Room_Building FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID),
ADD CONSTRAINT CHK_Room_MaxCapacity CHECK (MaxCapacity > 0);

-- Add constraints for the Worker table
ALTER TABLE Worker
ADD CONSTRAINT PK_Worker PRIMARY KEY (ID),
ADD CONSTRAINT FK_Worker_Person FOREIGN KEY (ID) REFERENCES Person(ID);

-- Add constraints for the Student table
ALTER TABLE Student
ADD CONSTRAINT PK_Student PRIMARY KEY (ID),
ADD CONSTRAINT FK_Student_Person FOREIGN KEY (ID) REFERENCES Person(ID),
ADD CONSTRAINT FK_Student_Room FOREIGN KEY (RoomID, BuildingID) REFERENCES Room(RoomID, BuildingID);

-- Add constraints for the Manager table
ALTER TABLE Manager
ADD CONSTRAINT PK_Manager PRIMARY KEY (ID),
ADD CONSTRAINT FK_Manager_Worker FOREIGN KEY (ID) REFERENCES Worker(ID);

-- Add constraints for the Cleaner table
ALTER TABLE Cleaner
ADD CONSTRAINT PK_Cleaner PRIMARY KEY (ID),
ADD CONSTRAINT FK_Cleaner_Worker FOREIGN KEY (ID) REFERENCES Worker(ID);

-- Add constraints for the WorksIn table
ALTER TABLE WorksIn
ADD CONSTRAINT PK_WorksIn PRIMARY KEY (ID, BuildingID),
ADD CONSTRAINT FK_WorksIn_Worker FOREIGN KEY (ID) REFERENCES Worker(ID),
ADD CONSTRAINT FK_WorksIn_Building FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID);
