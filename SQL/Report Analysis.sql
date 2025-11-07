SELECT * FROM vw_CleanEmployeeWorkHours

-- Which department has the highest total hours worked?
SELECT Department, SUM(HoursWorked) AS TotalWorkHours 
FROM vw_CleanEmployeeWorkHours
GROUP BY Department 
ORDER BY TotalWorkHours DESC;

-- Top 10 highest earning employees (based on revenue generated).
SELECT TOP 10 
	FullName, 
	SUM(RevenueGenerated) AS TotalRevenue
FROM vw_CleanEmployeeWorkHours
GROUP BY FUllName
ORDER BY TotalRevenue DESC

-- What is the average salary per department?
SELECT 
	Department,
	AVG(Salary) AS AvgSalary
FROM vw_CleanEmployeeWorkHours
GROUP BY Department
ORDER BY AvgSalary

-- Top 10 Employees by Total Hours Worked
SELECT TOP 10
	FullName,
	SUM(HoursWorked) AS TotalWorkHours,
	ROW_NUMBER() OVER(ORDER BY SUM(HoursWorked) DESC) as Ranking
FROM vw_CleanEmployeeWorkHours
GROUP BY FullName
ORDER BY TotalWorkHours DESC

-- Employee Tenure Segment vs Productivity
WITH EmployeeHours AS (
    SELECT
        EmployeeID,
        FullName,
        HireDate,
        SUM(HoursWorked) AS TotalHoursWorked
    FROM vw_CleanEmployeeWorkHours
    GROUP BY EmployeeID, FullName, HireDate
),
TenureSegment AS (
    SELECT
        EmployeeID,
        FullName,
        HireDate,
        TotalHoursWorked,
        DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsAtCompany,
        CASE
            WHEN DATEDIFF(YEAR, HireDate, GETDATE()) < 1 THEN 'Less than 1 Year'
            WHEN DATEDIFF(YEAR, HireDate, GETDATE()) BETWEEN 1 AND 3 THEN '1 to 3 Years'
            ELSE 'More than 3 Years'
        END AS TenureCategory
    FROM EmployeeHours
)
SELECT
    TenureCategory,
    COUNT(*) AS EmployeeCount,
    AVG(TotalHoursWorked) AS AvgHoursWorked
FROM TenureSegment
GROUP BY TenureCategory
ORDER BY AvgHoursWorked DESC;