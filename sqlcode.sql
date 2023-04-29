/*------------------------------------------------------Basics------------------------------------------------------*/
-- Dropping database if already exits other wise it will give an error
drop database if exists SQLTutorial;

-- Creating Database
CREATE DATABASE SQLTutorial;
-- Using/Initializing SQLTutorial DataBase
USE SQLTutorial;

-- Creating Table 1. EmployeeDemographics
CREATE TABLE EmployeeDemographics
(
	EmployeeID int,
    FirstName varchar(50),
    LastName varchar(50),
    Age int,
    Gender varchar(50)
);

-- Creating Table 2. EmployeeSalary
CREATE TABLE EmployeeSalary
(
	EmployeeID int,
    JobTitle varchar(50),
    Salary int
);

-- Creating Table 3. WareHouseEmployeeDemographics
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
);

-- Inserting Data into the table EmployeeDemographics 
INSERT INTO EmployeeDemographics VALUES
(1001, "Asif", "Ali", 23, "Male"),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male'),
(1010, NULL, 'Mill', 34, 'Male'),
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male');

-- Inserting Data into the table EmployeeSalary
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

-- Inserting Data into the table WareHouseEmployeeDemographics
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female');

-- Data selection
-- Select every record
SELECT * FROM EmployeeDemographics;
-- Selecting 5 records using LIMIT
SELECT * FROM EmployeeDemographics LIMIT 5;
-- SELECT Distinct records
SELECT DISTINCT Gender FROM EmployeeDemographics;
-- Counting records and set it a new name
SELECT COUNT(*) as count_ FROM EmployeeDemographics;
-- FInding max salary
SELECT MAX(salary) FROM EmployeeSalary;
-- SELECTING records from unused dataset
SELECT * FROM db_ch3.course;


/* -----------WHERE-----------*/

-- Finding data if employee named 'Asif'
SELECT * FROM EmployeeDemographics WHERE FirstName = "Asif";

-- Finding data other than or except if employee named 'Asif'
SELECT * FROM EmployeeDemographics WHERE FirstName != "Asif";
-- OR 
SELECT * FROM EmployeeDemographics WHERE FirstName <> "Asif";

-- Finding people older than 30
SELECT * FROM EmployeeDemographics WHERE Age>30;

-- Finding people older than 30 & Gender Male
SELECT * FROM EmployeeDemographics WHERE Age>30 AND Gender="Male";

-- Finding Employees named start with 'A'
SELECT * FROM EmployeeDemographics WHERE FirstName LIKE "A%";

-- Finding Employees named contain 'A'
SELECT * FROM EmployeeDemographics WHERE FirstName LIKE "%A%";

-- Finding Employees named contain 'S & A'
SELECT * FROM EmployeeDemographics WHERE FirstName LIKE "S%A%";

-- Finding / Selecting non-null names
SELECT * FROM EmployeeDemographics  WHERE FirstName IS NOT NULL;

-- Finding / Selecting null names
SELECT * FROM EmployeeDemographics  WHERE FirstName IS NULL;

-- Selecting recoding of "Asif", "Toby", "Kevin"
SELECT * FROM EmployeeDemographics   WHERE FirstName IN ("Asif", "Toby", "Kevin");

/* 'GROUP BY' & 'ORDER BY' */
-- Group by Gender
SELECT Gender from EmployeeDemographics GROUP BY Gender;
-- Find Group count of Gender
SELECT Gender,COUNT(Gender) from EmployeeDemographics GROUP BY Gender;
-- Find Group Count of Gender or Age, or How many people are of same gender and age
SELECT Gender,Age, COUNT(Gender) FROM EmployeeDemographics GROUP BY Gender,AGE;
SELECT Gender,Age, COUNT(Gender) as Total FROM EmployeeDemographics GROUP BY Gender,AGE ORDER BY Gender,AGE ASC;
SELECT Gender,Age, COUNT(Gender) as Total FROM EmployeeDemographics GROUP BY Gender,AGE ORDER BY Gender,AGE DESC;
-- OR
SELECT Gender,Age, COUNT(Gender) as Total FROM EmployeeDemographics GROUP BY Gender,AGE ORDER BY Gender ASC,AGE DESC;
SELECT * FROM EmployeeDemographics ORDER BY 1 DESC,5 DESC;




/*------------------------------------------------------Intermediate------------------------------------------------------*/

/* Inner Join */
SELECT * FROM EmployeeDemographics INNER JOIN EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;
-- OR 
SELECT * FROM EmployeeDemographics JOIN EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

/* Left Outer Join*/
SELECT * FROM EmployeeDemographics LEFT OUTER JOIN EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

/* Right Outer Join*/
SELECT * FROM EmployeeDemographics RIGHT OUTER JOIN EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT ed.EmployeeID, FirstName, LastName, JobTitle, Salary 
FROM EmployeeDemographics as ed JOIN EmployeeSalary as  es 
ON ed.EmployeeID=es.EmployeeID;

-- List Hige Payes Employees Except Michael
SELECT ed.EmployeeID, FirstName, LastName,Salary FROM EmployeeDemographics as ed INNER JOIN
EmployeeSalary as  es ON ed.EmployeeID=es.EmployeeID WHERE FirstName<>"Michael" ORDER BY Salary DESC;

-- Average Saleries of Salesman
SELECT JobTitle, AVG(Salary) FROM EmployeeDemographics as ed INNER JOIN EmployeeSalary as es
ON ed.EmployeeID=es.EmployeeID WHERE JobTitle="Salesman" GROUP BY JobTitle;

/* Union : 2 tables must have the same number of columns/features/attributes */
SELECT * FROM WareHouseEmployeeDemographics;
SELECT * FROM EmployeeDemographics;
(SELECT * FROM WareHouseEmployeeDemographics) 
UNION 
(SELECT * FROM EmployeeDemographics);

(SELECT * FROM WareHouseEmployeeDemographics) 
UNION ALL 
(SELECT * FROM EmployeeDemographics) 
ORDER BY EmployeeID;


/* Case Statement */
-- SELECT * FROM WareHouseEmployeeDemographics;
-- SELECT * FROM EmployeeDemographics;
-- Finding Age Status of Employees
SELECT FirstName, LastName, Age,
CASE
	WHEN Age>30 THEN "Old"
    WHEN Age BETWEEN 27 AND 30 THEN "Peak Young"
    ELSE "Young"
END as "Age Status"
FROM EmployeeDemographics
WHERE Age IS NOT NULL ORDER BY Age DESC;

-- Finding Age Salary Status of Employees
SELECT FirstName, LastName, Age, Salary,
CASE
	WHEN Salary>48555.56 THEN "Above Average"
    ELSE "On or Below Average"
END as "Salary Status"
FROM EmployeeDemographics as ed INNER JOIN EmployeeSalary as es
ON ed.EmployeeID=es.EmployeeID ORDER BY Salary DESC, Age DESC;

-- Finding Salary Raise
SELECT FirstName, LastName, Age, Salary, JobTitle,
CASE
	WHEN JobTitle="Salesman" THEN Salary + (Salary * 0.10)
    WHEN JobTitle="Accountant" THEN Salary + (Salary * 0.05)
    WHEN JobTitle="HR" THEN Salary + (Salary * 0.00001)
    ELSE Salary + (Salary  * 0.03)
END as Salary_After_Raise
FROM EmployeeDemographics as ed INNER JOIN EmployeeSalary as es
on ed.EmployeeID=es.EmployeeID ORDER BY Salary_After_Raise DESC;



/* Having Clause */
-- Find JobTitle where more than 1 employee work
SELECT JobTitle, COUNT(JobTitle) as Total 
FROM EmployeeDemographics as ed INNER JOIN EmployeeSalary as es
ON ed.EmployeeID = es.EmployeeID 
GROUP BY JobTitle HAVING COUNT(JobTitle)>1 ORDER BY Total DESC;

-- Find JobTitle where Average salary of JobTitle is more than average of the total salaries
SELECT JobTitle, AVG(Salary) 
FROM EmployeeDemographics as ed INNER JOIN EmployeeSalary as es
ON ed.EmployeeID = es.EmployeeID
GROUP BY JobTitle HAVING AVG(Salary)>50000
ORDER BY AVG(Salary) DESC ;


/*Inserting/Updating/Deleting Data*/
SELECT * FROM EmployeeDemographics;
-- Please Off the SafeMode before Updating Data once done and them Must Turn it On, Other it will give error
-- Turning Off SafeMode
SET SQL_SAFE_UPDATES = 0;
-- Updating data for Holly Flax

UPDATE EmployeeDemographics 
SET Age=40, Gender="Female"
WHERE FirstName="Holly";

DELETE FROM EmployeeDemographics WHERE EmployeeID IS NULL;

-- Turning ON SafeMode
SET SQL_SAFE_UPDATES = 1;


/* Partion By */
SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM
EmployeeDemographics  as Demo INNER JOIN EmployeeSalary as Sal
ON Demo.EmployeeID=Sal.EmployeeID;

SELECT FirstName, LastName, Gender, JobTitle, Salary,
COUNT(JobTitle) OVER(PARTITION BY JobTitle) as JobTitleTotal 
FROM 
EmployeeDemographics  as Demo INNER JOIN EmployeeSalary as Sal
ON Demo.EmployeeID=Sal.EmployeeID
ORDER BY JobTitleTotal  DESC;


/* CTEs (Common Table Expressions)*/
/*------------------------------------------------------Advance------------------------------------------------------*/
WITH CTE_Employee as
(
	SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
    FROM EmployeeDemographics as Demo INNER JOIN EmployeeSalary as Sal
    ON Demo.EmployeeID = Sal.EmployeeID
) SELECT * FROM CTE_Employee;

WITH CTE_Employee as
(
	SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
    FROM EmployeeDemographics as Demo INNER JOIN EmployeeSalary as Sal
    ON Demo.EmployeeID = Sal.EmployeeID
) SELECT FirstName, LastName, Gender, Salary FROM CTE_Employee;


/* Temp(Temporary) Tables*/
-- CREATE TABLE #temp_Employee /*In Windows*/
DROP TABLE IF EXISTS temp_Employee;
CREATE TEMPORARY TABLE temp_Employee /*In Oracle*/
(
	EmployeeID int,
    JobTitle varchar(100),
    Salary int
);
SELECT * FROM temp_Employee;

INSERT INTO temp_Employee VALUES
(1000, "HR", 45000);

INSERT INTO temp_Employee
SELECT * FROM EmployeeSalary;

SELECT * FROM temp_Employee;

DROP TABLE IF EXISTS Temp_Employee2;
CREATE TEMPORARY TABLE Temp_Employee2
(
	JobTitle varchar(50),
    EmployeesPerJob int,
    AvgAge int,
    AvgSalary int
);
INSERT INTO Temp_Employee2
(
	SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
    FROM EmployeeDemographics as Demo INNER JOIN EmployeeSalary as Sal
    ON Demo.EmployeeID = Sal.EmployeeID
    GROUP BY JobTitle
);
SELECT * FROM Temp_Employee2;

/* String Fucntions + Use Cases */
CREATE TABLE EmployeeErrors
(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50)
);

INSERT INTO EmployeeErrors VALUES
("1001", "Jimbo", "Halbert"),
("       1002", "Pamela", "Beasely"),
("1005", "TOby", "Flenderson - Fired");

SELECT * FROM EmployeeErrors;

/*
	TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/
-- TRIM, LTRIM, RTRIM
SELECT * FROM EmployeeErrors;
SELECT EmployeeID, TRIM(EmployeeID), LTRIM(EmployeeID), RTRIM(EmployeeID) FROM EmployeeErrors;


-- REPLACE
SELECT LastName, REPLACE(LastName, "- Fired","") FROM EmployeeErrors;

-- SUBSTRING
SELECT FirstName, SUBSTRING(FirstName,1,3) FROM EmployeeErrors;

-- UPPER
SELECT FirstName, UPPER(FirstName) FROM EmployeeErrors;

-- LOWER
SELECT FirstName, LOWER(FirstName) FROM EmployeeErrors;

/* Store Procedures */
DROP PROCEDURE IF EXISTS TEST;
DELIMITER $$
CREATE PROCEDURE TEST()
BEGIN
	SELECT * FROM EmployeeDemographics;
END $$
DELIMITER ;
CALL TEST();
DROP PROCEDURE IF EXISTS Temp_Employee;
DELIMITER $$
CREATE PROCEDURE Temp_Employee()
BEGIN
DROP TABLE IF EXISTS temp_employee;
Create TEMPORARY table temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
);
END $$
DELIMITER ;

CALL temp_employee();

Insert into temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle;

/* SUB QUERIES*/
