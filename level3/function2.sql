USE Lev_MPDB;
DELIMITER //

CREATE FUNCTION GetStudentMajorCount(major_name VARCHAR(50)) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE student_count INT DEFAULT 0;

    -- Implicit cursor to count students in the major
    SELECT COUNT(*) INTO student_count
    FROM Student
    WHERE Major = major_name;

    RETURN student_count;
END //

DELIMITER ;