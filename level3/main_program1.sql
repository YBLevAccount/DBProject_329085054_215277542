USE Lev_MPDB;
-- MainProgram1.sql
-- This program calls the GetBuildingWorkerCount function and AssignRoomToStudent procedure

-- Declare variables to hold results
SET @building_id = 37;
SET @student_id = 826;
SET @room_id = 1;
SET @worker_count = 0;

-- Call the function to get the worker count for a specific building
SET @worker_count = GetBuildingWorkerCount(@building_id);
SELECT CONCAT('Worker count in building ', @building_id, ': ', @worker_count) AS WorkerCount;

-- Call the procedure to assign a room to a student
CALL AssignRoomToStudent(@student_id, @room_id, @building_id);
SELECT CONCAT('Student ', @student_id, ' assigned to room ', @room_id, ' in building ', @building_id) AS RoomAssignment;
