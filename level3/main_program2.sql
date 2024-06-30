USE Lev_MPDB;
-- MainProgram2.sql
-- This program calls the GetStudentMajorCount function and PromoteWorkerToManager procedure

-- Declare variables to hold results
SET @major_name = 'Computer Science';
SET @worker_id = 429;
SET @department_name = 'Engineering';
SET @student_count = 0;

-- Call the function to get the student count for a specific major
SET @student_count = GetStudentMajorCount(@major_name);
SELECT CONCAT('Student count for major ', @major_name, ': ', @student_count) AS StudentCount;

-- Call the procedure to promote a worker to manager
CALL PromoteWorkerToManager(@worker_id, @department_name);
SELECT CONCAT('Worker ', @worker_id, ' promoted to manager in department ', @department_name) AS Promotion;
