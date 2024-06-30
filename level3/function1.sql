USE Lev_MPDB;
DELIMITER //

CREATE FUNCTION GetBuildingWorkerCount(building_id INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE worker_count INT DEFAULT 0;

    -- Implicit cursor to count workers in the building
    SELECT COUNT(*) INTO worker_count
    FROM WorksIn
    WHERE BuildingID = building_id;

    RETURN worker_count;
END //

DELIMITER ;