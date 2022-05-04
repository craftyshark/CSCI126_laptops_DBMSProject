CREATE TABLE laptop_model_skews (
    laptop_ID        INT PRIMARY KEY,
    Company          VARCHAR (20),
    Product          VARCHAR (200),
    ScreenResolution VARCHAR (200),
    Cpu              VARCHAR (100),
    Ram              VARCHAR (20),
    Memory           VARCHAR (100),
    Gpu              VARCHAR (200) 
);

CREATE TABLE manufacturers (
    laptop_ID   INT PRIMARY KEY,
    Company     VARCHAR (20),
    Price_euros VARCAR (20) 
);

CREATE TABLE Cpus_used (
    laptop_ID INT PRIMARY KEY,
    Company   VARCHAR (20),
    Cpu       VARCHAR (100)
);


--run the above Queries to create a table, then import the formated data into the correct tables,
--then run the following queries

ALTER TABLE Cpus_used ADD COLUMN Cpu_oem VARCHAR (20);


UPDATE Cpus_used
   SET Cpu_oem = "Intel"
 WHERE Cpu LIKE "Intel%";

UPDATE Cpus_used
   SET Cpu_oem = "AMD"
 WHERE Cpu LIKE "AMD%";

UPDATE Cpus_used
   SET Cpu_oem = "Samsung"
 WHERE Cpu LIKE "Samsung%";

