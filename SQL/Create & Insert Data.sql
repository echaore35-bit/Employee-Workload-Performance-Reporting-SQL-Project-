-- Create new Database for this project
CREATE DATABASE EmployeesData;
-- Use the created database 
USE EmployeesData;

-- **WARNING** Drop the table if run and create a new one
IF OBJECT_ID('Employees', 'U') IS NOT NULL
	DROP TABLE Employees
GO
CREATE TABLE Employees
(
EmployeeID INT PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
Age INT,
Gender NVARCHAR(10),
Department NVARCHAR(50),
JobTitle NVARCHAR(50),
Email NVARCHAR(50),
HireDate DATE,
Salary INT
)
 -- Insert the csv file to the table 
BULK INSERT Employees
FROM 'C:\Projects\Employees\employees.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ','
)

-- **WARNING** Drop the table if run and create a new one
IF OBJECT_ID('WorkHours', 'U') IS NOT NULL
	DROP TABLE WorkHours
GO

CREATE TABLE WorkHours
(
RecordID INT PRIMARY Key,
EmployeeID INT ,
[Date] Date,
HoursWorked INT,
Project NVARCHAR(50),
Task NVARCHAR(50),
Location NVARCHAR(50),
Billable NVARCHAR(10),
Rate INT,
Cost INT,
FOREIGN KEY (EmployeeID)REFERENCES Employees(EmployeeID)
)
 -- Insert the csv file to the table 
BULK INSERT WorkHours
FROM 'C:\Projects\Employees\work_hours.csv'
WITH
(
	FIRSTROW = 2,
	FIELDTERMINATOR = ','
)