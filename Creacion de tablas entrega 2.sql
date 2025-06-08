Create database sql_proyecto;

Use sql_proyecto;

-- Table: Crew_data
Create table Crew_data(
CrewID varchar(50) primary key NOT NULL,
Nombre varchar(50) NOT NULL,
BASE varchar(50) NOT NULL);

-- Table: Crew_jobs
Create table Crew_jobs(
CrewID varchar(50) primary key NOT NULL,
Job varchar(50) NOT NULL);

-- Table: IATA
Create table IATA(
Origin varchar(50) primary key NOT NULL,
Airport varchar(50) NOT NULL);

-- Table: Sales 
Create table Sales(
Key_FDOD varchar(50) primary key NOT NULL,
Sales int NOT NULL,
Orides varchar(50) NOT NULL,
Origin varchar(50) NOT NULL,
Destination varchar(50) NOT NULL,
Flight_date date NOT NULL,
foreign key (Origin) references iata(origin));

-- Table Crew_per_flight
Create table Crew_per_flight(
ID_CPF int primary key auto_increment NOT NULL,
CrewID varchar(50) NOT NULL,
Key_FDOD varchar(50) NOT NULL,
foreign key (CrewID) references Crew_data(CrewID),
foreign key (CrewID) references Crew_jobs(CrewID),
foreign key (Key_FDOD) references Sales(Key_FDOD));

use sql_proyecto;
-- Table Product_category
Create table Product_category(
Product_code varchar(50) primary key NOT NULL,
Product_category varchar(50) NOT NULL);

-- drop table Product_category;
-- select * from Product_category;

-- Table Product_COGS
Create table Product_COGS(
Product_code varchar(50) primary key not null,
Product_COGS int);

-- Table Product_ASP
Create table Product_ASP(
Product_code varchar(50) primary key not null,
Product_ASP int);

-- Table Product_detail
create table Product_detail(
Product_code varchar(50) primary key not null,
Product_detail varchar(50) NOT NULL);

-- Table Sales_details
create table Sales_details(
Sales_details_ID INT not null primary key,
Product_code varchar(50),
Units_sold INT,
Key_FDOD varchar(50),
foreign key (Key_FDOD) references Sales(Key_FDOD),
foreign key (Product_code) references Product_category(Product_code),
foreign key (Product_code) references Product_COGS(Product_code),
foreign key (Product_code) references Product_ASP(Product_code),
foreign key (Product_code) references Product_detail(Product_code));