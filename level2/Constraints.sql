USE Lev_MPDB;

-- Add constraints for the Room table
ALTER TABLE Room
MODIFY MaxCapacity INT NOT NULL,
ADD CONSTRAINT CHK_Room_MaxCapacity CHECK (MaxCapacity > 0);

-- Set default value for HireDate to current date
DELIMITER //
CREATE TRIGGER check_hire_date
BEFORE INSERT ON Worker
FOR EACH ROW
BEGIN
    IF NEW.HireDate > CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'HireDate cannot be in the future';
    END IF;
END//
DELIMITER ;

-- Add constraints for the Student table
ALTER TABLE Student
MODIFY Major VARCHAR(50) NOT NULL DEFAULT 'Undeclared';
