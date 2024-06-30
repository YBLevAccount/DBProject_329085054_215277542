USE Lev_MPDB;
DELIMITER //

CREATE PROCEDURE AssignRoomToStudent(
    IN student_id INT,
    IN room_id INT,
    IN building_id INT
)
BEGIN
    DECLARE current_capacity INT DEFAULT 0;
    DECLARE room_max_capacity INT DEFAULT 0;
    DECLARE done INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT COUNT(*) 
        FROM Student 
        WHERE RoomID = room_id AND BuildingID = building_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open cursor to get current capacity
    OPEN cur;

    -- Loop to fetch the current capacity
    get_capacity: LOOP
        FETCH cur INTO current_capacity;
        IF done THEN
            LEAVE get_capacity;
        END IF;
    END LOOP;

    CLOSE cur;

    -- Get the maximum capacity of the room
    SELECT MaxCapacity INTO room_max_capacity
    FROM Room
    WHERE RoomID = room_id AND BuildingID = building_id;

    -- Check if the room is full
    IF current_capacity >= room_max_capacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Room is full';
    ELSE
        -- Assign the room to the student
        UPDATE Student
        SET RoomID = room_id, BuildingID = building_id
        WHERE ID = student_id;
    END IF;
END //

DELIMITER ;
