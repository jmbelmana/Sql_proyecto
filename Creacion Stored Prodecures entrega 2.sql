-- Creacion de Stored procedure 1
DELIMITER //

CREATE PROCEDURE sp_Add_Crew_to_Flight(
    IN p_CrewID VARCHAR(50),
    IN p_Key_FDOD VARCHAR(50)
)
BEGIN
    INSERT INTO Crew_per_flight (CrewID, Key_FDOD)
    VALUES (p_CrewID, p_Key_FDOD);
END//

DELIMITER ;

-- Creacion de Stored procedure 2
DELIMITER //

CREATE PROCEDURE sp_Update_Product_ASP(
    IN p_Product_code VARCHAR(50),
    IN p_New_ASP INT
)
BEGIN
    UPDATE Product_ASP
    SET Product_ASP = p_New_ASP
    WHERE Product_code = p_Product_code;
END//

DELIMITER ;
