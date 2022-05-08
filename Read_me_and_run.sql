--Run these three create table queries, then load the correct respective data into them

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
--then run the following 4 queries to finish up database set up

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

--And you're done! We can now use this database to run some intresting queries

--Intresting listed query
select A.laptop_ID,Company, Product,price_euros from laptop_model_skews A  join manufacturers B
where A.laptop_ID <=50 and price_euros<(
select AVG(price_euros) from manufacturers);


--New Laptop just dropped
INSERT INTO laptop_model_skews values (1321, "Asus", "ROG Flow X13", "1920 x 1200", "AMD Ryzen 9 5900HS", "16GB", "1TB SSD", "Nvidia GeForce RTX 3050 Ti");
INSERT INTO manufacturers VALUES (1321, "Asus", 1499); 
INSERT INTO Cpus_used VALUES (1321, "Asus", "AMD Ryzen 9 5900HS" , "AMD");


--neat little aggregation queries

--How many laptops do we have here altogether
SELECT COUNT(laptop_ID) 
  FROM laptop_model_skews;

--How much does the average Asus cost? 
SELECT AVG(Price_euros) 
  FROM manufacturers
 WHERE Company = "Asus";
 
--How much would it cost to buy ALL Apple laptops? 
SELECT SUM(Price_euros)
FROM manufacturers
WHERE Company = "Apple";

--Cheapest Asus? 
SELECT MIN(Price_euros) 
  FROM manufacturers
 WHERE Company = "Asus";

--Most Expensive? 
SELECT MAX(Price_euros) 
  FROM manufacturers
 WHERE Company = "Asus";
 
 
--Fire sale on macbooks
UPDATE manufacturers
   SET Price_euros = Price_euros * 0.7
 WHERE laptop_ID IN (
    SELECT p.laptop_ID
      FROM laptop_model_skews p
     WHERE p.Product LIKE "Macbook%"
);


SELECT Product
  FROM laptop_model_skews
 WHERE Product LIKE "Macbook%";
