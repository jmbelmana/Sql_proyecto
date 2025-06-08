-- Creacion y testeo de la funcion 1
DELIMITER //

CREATE FUNCTION fn_Product_Margin(p_product_code VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_margin INT;
    
    SELECT (pa.Product_ASP - c.Product_COGS)
    INTO v_margin
    FROM Product_ASP pa
    JOIN Product_COGS c ON pa.Product_code = c.Product_code
    WHERE pa.Product_code = p_product_code;
    
    RETURN v_margin;
END//

DELIMITER ;

SELECT 
    Product_code,
    fn_Product_Margin(Product_code) AS Margin
FROM Product_category
order by margin desc;

-- Creacion y testeo de la funcion 2
DELIMITER //

CREATE FUNCTION fn_Total_Units_Sold(p_product_code VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total_units INT;
    
    SELECT SUM(sd.Units_sold)
    INTO v_total_units
    FROM Sales_details sd
    WHERE sd.Product_code = p_product_code;
    
    RETURN IFNULL(v_total_units, 0);
END//

DELIMITER ;
-- drop function fn_Total_Units_Sold;
SELECT 
    pc.Product_code,
    fn_Total_Units_Sold(pc.Product_code) AS Total_Units_Sold
FROM Product_category pc
order by Total_Units_Sold desc;



