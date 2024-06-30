USE Lev_MPDB;
DELIMITER //

CREATE PROCEDURE PromoteWorkerToManager(
    IN worker_id INT,
    IN department_name VARCHAR(50)
)
BEGIN
    DECLARE cur_worker_id INT;
    DECLARE cur_hire_date DATE;
    DECLARE worker_exists INT DEFAULT 0;

    DECLARE done INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT ID, HireDate 
        FROM Worker 
        WHERE ID = worker_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open cursor to check if worker exists
    OPEN cur;

    -- Fetch worker data
    FETCH cur INTO cur_worker_id, cur_hire_date;

    -- Close the cursor
    CLOSE cur;

    -- Check if the worker exists
    IF done THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Worker not found';
    ELSE
        -- Promote the worker to manager
        INSERT INTO Manager (ID, Department)
        VALUES (worker_id, department_name);
    END IF;
END //

DELIMITER ;
