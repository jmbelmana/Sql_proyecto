-- Creacion del trigger 1
DELIMITER //

CREATE TRIGGER trg_Prevent_Duplicate_Crew_Assignment
BEFORE INSERT ON Crew_per_flight
FOR EACH ROW
BEGIN
    DECLARE v_count INT;
    
    SELECT COUNT(*)
    INTO v_count
    FROM Crew_per_flight
    WHERE CrewID = NEW.CrewID AND Key_FDOD = NEW.Key_FDOD;
    
    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Crew member already assigned to this flight.';
    END IF;
END//

DELIMITER ;


-- Creacion del trigger 2 y tabla log auxiliar
CREATE TABLE Sales_details_log (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Sales_details_ID INT,
    Product_code VARCHAR(50),
    Units_sold INT,
    Inserted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_Log_Sales_Details_Insert
AFTER INSERT ON Sales_details
FOR EACH ROW
BEGIN
    INSERT INTO Sales_details_log (Sales_details_ID, Product_code, Units_sold)
    VALUES (NEW.Sales_details_ID, NEW.Product_code, NEW.Units_sold);
END//

DELIMITER ;

