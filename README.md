# Healthcare Patient Flow & Length of Stay Analytics (SQL Project)

## Project Overview

This project uses PostgreSQL to analyze healthcare operational data, including inpatient admissions, length of stay (LOS), patient volume, departmental performance, and 30-day readmissions. The objective is to generate operational insights that support data-driven decision-making within healthcare organizations.


## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- GitHub


## Database

Database Name: patient_flow_analytics

Tables:

- patients
- departments
- admissions

Schema:

patients <-- admissions --> departments

Key Relationships:

- admissions.patient_id → patients.patient_id
- admissions.department_id → departments.department_id


## Healthcare Analytics Knowledge Demonstrated

- Total Inpatient Admissions
- Monthly Admission Trends
- Average Length of Stay (LOS)
- Length of Stay Analysis by Department
- Monthly LOS Trends
- Length of Stay Summary Statistics
- Readmission Counts and Rates
- Readmission Rate by Department
- Departmental Patient Volume Analysis


## SQL Skills Demonstrated

- PostgreSQL
- Database Design & Relational Modeling
- Primary Keys & Foreign Keys
- SQL Joins
- Aggregate Functions (COUNT, AVG, MIN, MAX)
- CASE Statements
- GROUP BY & ORDER BY
- Date Functions & Time-Based Analysis
- Boolean Logic


## Analytics Queries

The project includes 18 healthcare analytics queries covering:

- Admissions Analysis
- Length of Stay (LOS) Analysis
- Readmission Analysis
- Department Performance Analysis
- Monthly Trend Analysis
- Summary Statistics


## SQL Script File

- patient_flow_analytics.sql


## Notes

This project uses entirely synthetic healthcare data created solely for demonstration and portfolio purposes. 
No real patient information, protected health information (PHI), or confidential healthcare data was used.