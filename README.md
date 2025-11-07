# 🧹 SQL Data Cleaning and Employee Workload Analysis

This project demonstrates beginner-level **SQL data cleaning, transformation, and reporting** using two related employee datasets.  
It shows how to turn raw HR and work logs into meaningful business insights.

---

## 🧩 Project Overview

**Goal:** Clean, join, and analyze employee and work hour data to understand productivity, revenue contribution, and workforce distribution.

**Tools Used:**
- SQL Server Management Studio (SSMS)
- Git & GitHub
- CSV datasets: `employees.csv`, `work_hours.csv`

---

## ⚙️ Project Steps

| Step | Description |
|------|-------------|
| 1️⃣ | Import raw CSV data into SQL Server tables |
| 2️⃣ | Clean data (standardize formatting, validate values, handle inconsistencies) |
| 3️⃣ | Create a consolidated analytical view |
| 4️⃣ | Run reporting queries for business insights |

---

## 🧹 Data Cleaning Summary

| Cleaning Task | Action Taken |
|--------------|--------------|
| Remove leading/trailing spaces | Used `TRIM()` on names and projects |
| Standardize gender values | Converted variations to `Male`, `Female`, `Other` |
| Normalize project names | Applied `UPPER()` and removed spaces |
| Validate numerical fields | Ensured logical age and hour values |
| Resolved inconsistencies | Converted data types & enforced referential integrity |
| Joined tables | Linked `Employees` ↔ `WorkHours` by `EmployeeID` |

🧠 Skills Demonstrated

Data Modeling (PK / FK relationships)

SQL Data Cleaning and Standardization

Aggregation & Categorization

CTEs for Structured Transformations

Window Functions for Ranking Analytics

Business Insight Interpretation

🚀 How to Run This Project

Clone the repository

Open SQL Server Management Studio

Run in order:

1_create_tables_and_import.sql

2_clean_and_join_view.sql

3_reporting_analysis.sql

View results in SSMS or export to Excel/Power BI

👨‍💻 Author

Justin Noel Echaore
Beginner Data Engineer | SQL • ETL • Data Analytics
📧 jnechaore@gmail.com

🌐 GitHub: https://github.com/echaore35-bit
