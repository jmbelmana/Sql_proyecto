-- Creacion,drop y prueba Vista 1
CREATE VIEW View_Crew_Schedule AS
SELECT 
    cpf.ID_CPF,
    cd.CrewID,
    cd.Nombre,
    s.Key_FDOD,
    s.Flight_date,
    s.Origin,
    s.Destination
FROM Crew_per_flight cpf
JOIN Crew_data cd ON cpf.CrewID = cd.CrewID
JOIN Sales s ON cpf.Key_FDOD = s.Key_FDOD
Order by cd.CrewID;
-- Drop view View_Crew_Schedule;
-- Select * from View_Crew_Schedule;

-- Creacion,drop y prueba Vista 2
CREATE VIEW View_Sales_by_Route AS
SELECT
    Origin,
    Destination,
    SUM(Sales) AS Total_Sales
FROM Sales
GROUP BY Origin, Destination
Order by Total_Sales desc;
-- Drop view View_Sales_by_ROute;
-- Select * from View_Sales_by_ROute;

-- Creacion,drop y prueba Vista 3
CREATE VIEW View_Product_Margin AS
SELECT
    pc.Product_code,
    pc.Product_category,
    pa.Product_ASP,
    c.Product_COGS,
    (pa.Product_ASP - c.Product_COGS) AS Margin
FROM Product_category pc
JOIN Product_ASP pa ON pc.Product_code = pa.Product_code
JOIN Product_COGS c ON pc.Product_code = c.Product_code
order by Margin desc;
-- Drop view View_Product_Margin;
-- Select * from View_Product_MArgin;

-- Creacion,drop y prueba Vista 4
CREATE VIEW View_Top_Selling_Products AS
SELECT
    sd.Product_code,
    SUM(sd.Units_sold) AS Total_Units_Sold
FROM Sales_details sd
GROUP BY sd.Product_code
ORDER BY Total_Units_Sold DESC;
-- Drop view View_Top_Selling_Products
-- select * from View_Top_Selling_Products;

-- Creacion,drop y prueba Vista 5
CREATE VIEW View_Flight_Product_Sales AS
SELECT
    s.Key_FDOD,
    s.Flight_date,
    sd.Product_code,
    SUM(sd.Units_sold) AS Total_Units_Sold
FROM Sales s
JOIN Sales_details sd ON s.Key_FDOD = sd.Key_FDOD
GROUP BY s.Key_FDOD, s.Flight_date, sd.Product_code;
-- drop view View_FLight_Product_Sales;
-- select * from View_FLight_Product_Sales;


