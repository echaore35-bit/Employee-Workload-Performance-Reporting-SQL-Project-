SELECT * FROM Employees;

SELECT * FROM WorkHours;

-- Check for Leading / Trailing Spaces
SELECT 
	EmployeeID,
	FirstName,
	LastName
FROM Employees
WHERE FirstName <> TRIM(FirstName)
	OR LastNAME <> TRIM(LastName)

SELECT 
	EmployeeID,
	Project,
	Task
FROM WorkHours
WHERE Project <> TRIM(Project)
	OR Task <> TRIM(Task)

-- Check for Duplicate Employee Records (should not happen if PK is set)
SELECT EmployeeID, COUNT(*) AS CountRows
FROM Employees
GROUP BY EmployeeID
HAVING COUNT(*) > 1;

-- Check for Invalid Numbers
SELECT *
FROM Employees
WHERE Age < 15 OR Age > 80;

SELECT * 
FROM WorkHours
WHERE HoursWorked <= 0;

-- Check if there are unsual Categories
SELECT Department, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY Department
ORDER BY TotalEmployees DESC;

SELECT Location, COUNT(*) AS RecordsCount
FROM WorkHours
GROUP BY Location
ORDER BY RecordsCount DESC;

-- Check for Inconsistent Casing (Gender, Project Names, etc.)
SELECT DISTINCT Gender
FROM Employees
ORDER BY Gender;

SELECT DISTINCT Project
FROM WorkHours
ORDER BY Project;

CREATE VIEW vw_CleanEmployeeWorkHours AS
WITH CleanEmployees AS
(
SELECT
	EmployeeID,
	TRIM(CONCAT(FirstName,' ',LastName))AS FullName,
	Age,
	CASE 
		WHEN LOWER(Gender) IN ('m','male') THEN 'Male'
		WHEN LOWER(Gender) IN ('f','female') THEN 'Female'
		ELSE 'Other'
	END AS Gender,
	Department,
	JobTitle,
	Email,
	HireDate,
	Salary
FROM Employees
),

CleanWorkHours AS
(
SELECT 
	RecordID,
	EmployeeID,
	[Date],
	HoursWorked,
	UPPER(REPLACE(TRIM(Project), ' ','')) as Project,
	Task,
	Location,
	Billable,
	Rate,
	Cost
FROM WorkHours
)

SELECT
    e.EmployeeID,
    e.FullName,
    e.Department,
    e.JobTitle,
    e.Gender,
    e.Age,
    e.Salary,
    e.HireDate,
    w.RecordID,
    w.HoursWorked,
    w.Project,
    w.Task,
    w.Location,
    w.Billable,
    w.Rate,
    w.Cost,
    (w.HoursWorked * w.Rate) AS RevenueGenerated
FROM CleanEmployees e
LEFT JOIN CleanWorkHours w
    ON e.EmployeeID = w.EmployeeID;

