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
