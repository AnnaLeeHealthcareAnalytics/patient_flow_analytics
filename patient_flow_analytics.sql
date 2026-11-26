/*
=====================================================
Healthcare Patient Flow & Length of Stay Analytics (SQL Project)
Database: patient_flow_analytics
Tool: PostgreSQL

Project Purpose:

This project leverages PostgreSQL, an open-source enterprise-grade relational database system,
to analyze inpatient admissions, length of stay (LOS), departmental utilization, and 30-day
readmissions to generate healthcare operational insights and support data-driven decision-making.
=====================================================
*/

/*
=====================================================
SECTION 1: DATABASE SETUP
=====================================================
*/

CREATE TABLE patients (
	patient_id INT PRIMARY KEY,
	patient_name VARCHAR(100),
	gender CHAR(1),
	date_of_birth DATE
);

CREATE TABLE departments (
    	department_id INT PRIMARY KEY,
    	department_name VARCHAR(100)
);

CREATE TABLE admissions (
    	admission_id INT PRIMARY KEY,
    	patient_id INT REFERENCES patients(patient_id),
    	admit_date DATE,
    	discharge_date DATE,
    	department_id INT REFERENCES departments(department_id),
    	readmitted_30_days BOOLEAN
);

/*
=====================================================
SECTION 2: DATA LOADING
=====================================================
*/
 
/* Table: patients */

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(1, 'John Smith', 'M', '1980-05-14'),
(2, 'Mary Johnson', 'F', '1975-09-22'),
(3, 'Robert Williams', 'M', '1990-03-11'),
(4, 'Patricia Brown', 'F', '1988-12-01'),
(5, 'Michael Jones', 'M', '1972-07-19'),
(6, 'Linda Garcia', 'F', '1985-04-28'),
(7, 'David Miller', 'M', '1993-06-15'),
(8, 'Barbara Davis', 'F', '1978-10-30'),
(9, 'James Rodriguez', 'M', '1982-01-08'),
(10, 'Jennifer Martinez', 'F', '1991-08-24');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(11, 'William Anderson', 'M', '1984-02-17'),
(12, 'Elizabeth Thomas', 'F', '1979-11-03'),
(13, 'Richard Jackson', 'M', '1987-06-25'),
(14, 'Susan White', 'F', '1992-09-14'),
(15, 'Joseph Harris', 'M', '1976-01-29'),
(16, 'Karen Martin', 'F', '1983-04-12'),
(17, 'Thomas Thompson', 'M', '1991-07-08'),
(18, 'Sarah Garcia', 'F', '1986-12-19'),
(19, 'Charles Martinez', 'M', '1974-05-31'),
(20, 'Nancy Robinson', 'F', '1989-10-22');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(21, 'Daniel Clark', 'M', '1981-03-16'),
(22, 'Lisa Lewis', 'F', '1987-08-27'),
(23, 'Matthew Lee', 'M', '1990-11-05'),
(24, 'Betty Walker', 'F', '1977-01-13'),
(25, 'Anthony Hall', 'M', '1985-06-21'),
(26, 'Sandra Allen', 'F', '1982-09-09'),
(27, 'Mark Young', 'M', '1993-12-02'),
(28, 'Donna Hernandez', 'F', '1978-04-18'),
(29, 'Steven King', 'M', '1986-07-30'),
(30, 'Carol Wright', 'F', '1991-10-11');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(31, 'Paul Scott', 'M', '1980-02-25'),
(32, 'Michelle Green', 'F', '1984-06-17'),
(33, 'Kevin Adams', 'M', '1992-09-04'),
(34, 'Laura Baker', 'F', '1987-12-28'),
(35, 'Brian Nelson', 'M', '1979-05-11'),
(36, 'Amy Carter', 'F', '1985-08-23'),
(37, 'Edward Mitchell', 'M', '1990-01-15'),
(38, 'Angela Perez', 'F', '1983-04-30'),
(39, 'Jason Roberts', 'M', '1988-07-19'),
(40, 'Rebecca Turner', 'F', '1991-10-06');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(41, 'Christopher Phillips', 'M', '1982-03-14'),
(42, 'Melissa Campbell', 'F', '1986-07-22'),
(43, 'Joshua Parker', 'M', '1991-11-09'),
(44, 'Stephanie Evans', 'F', '1984-01-27'),
(45, 'Andrew Edwards', 'M', '1978-05-16'),
(46, 'Deborah Collins', 'F', '1983-08-04'),
(47, 'Ryan Stewart', 'M', '1990-12-13'),
(48, 'Cynthia Sanchez', 'F', '1987-04-29'),
(49, 'Nicholas Morris', 'M', '1981-09-08'),
(50, 'Kathleen Rogers', 'F', '1989-06-21');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(51, 'Brandon Cook', 'M', '1985-02-18'),
(52, 'Sharon Morgan', 'F', '1980-07-11'),
(53, 'Justin Bell', 'M', '1992-10-25'),
(54, 'Carolyn Murphy', 'F', '1987-03-07'),
(55, 'Aaron Bailey', 'M', '1979-06-14'),
(56, 'Janet Rivera', 'F', '1984-09-29'),
(57, 'Patrick Cooper', 'M', '1991-12-17'),
(58, 'Ruth Richardson', 'F', '1982-04-21'),
(59, 'Gregory Cox', 'M', '1988-08-05'),
(60, 'Virginia Howard', 'F', '1986-11-12');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(61, 'Dennis Ward', 'M', '1981-01-24'),
(62, 'Maria Torres', 'F', '1985-05-16'),
(63, 'Jerry Peterson', 'M', '1990-08-27'),
(64, 'Theresa Gray', 'F', '1987-12-09'),
(65, 'Henry Ramirez', 'M', '1978-03-18'),
(66, 'Julie James', 'F', '1983-07-30'),
(67, 'Arthur Watson', 'M', '1992-10-11'),
(68, 'Frances Brooks', 'F', '1986-04-05'),
(69, 'Peter Kelly', 'M', '1989-09-22'),
(70, 'Christine Sanders', 'F', '1984-11-14');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(71, 'Ronald Price', 'M', '1982-02-08'),
(72, 'Pamela Bennett', 'F', '1985-06-19'),
(73, 'Gary Wood', 'M', '1990-09-27'),
(74, 'Laura Barnes', 'F', '1987-01-14'),
(75, 'Stephen Ross', 'M', '1979-04-30'),
(76, 'Shirley Henderson', 'F', '1983-08-21'),
(77, 'Eric Coleman', 'M', '1991-11-06'),
(78, 'Janice Jenkins', 'F', '1986-03-12'),
(79, 'Scott Perry', 'M', '1988-07-25'),
(80, 'Joyce Powell', 'F', '1984-12-18');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(81, 'Keith Long', 'M', '1981-05-09'),
(82, 'Anna Patterson', 'F', '1985-08-17'),
(83, 'Douglas Hughes', 'M', '1990-02-24'),
(84, 'Teresa Flores', 'F', '1987-06-13'),
(85, 'Carl Washington', 'M', '1978-10-31'),
(86, 'Evelyn Butler', 'F', '1983-01-22'),
(87, 'Sean Simmons', 'M', '1992-04-15'),
(88, 'Gloria Foster', 'F', '1986-09-07'),
(89, 'Wayne Gonzales', 'M', '1989-12-19'),
(90, 'Victoria Bryant', 'F', '1984-03-28');

INSERT INTO patients (patient_id, patient_name, gender, date_of_birth)
VALUES
(91, 'Bruce Alexander', 'M', '1982-01-12'),
(92, 'Martha Russell', 'F', '1985-05-23'),
(93, 'Philip Griffin', 'M', '1990-08-14'),
(94, 'Diane Diaz', 'F', '1987-11-30'),
(95, 'Harold Hayes', 'M', '1979-04-09'),
(96, 'Beverly Myers', 'F', '1983-07-26'),
(97, 'Craig Ford', 'M', '1991-10-18'),
(98, 'Alice Hamilton', 'F', '1986-02-03'),
(99, 'Russell Graham', 'M', '1988-09-21'),
(100, 'Cheryl Sullivan', 'F', '1984-12-07');

/* Table: departments */

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Medical-Surgical'),
(2, 'Cardiology'),
(3, 'ICU'),
(4, 'Obstetrics'),
(5, 'Neurology');

/* Table: admissions */
INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(1, 1, '2026-01-03', '2026-01-07', 1, FALSE),
(2, 2, '2026-01-05', '2026-01-08', 2, FALSE),
(3, 3, '2026-01-06', '2026-01-12', 3, TRUE),
(4, 4, '2026-01-08', '2026-01-10', 4, FALSE),
(5, 5, '2026-01-09', '2026-01-15', 5, TRUE),
(6, 6, '2026-01-11', '2026-01-14', 1, FALSE),
(7, 7, '2026-01-13', '2026-01-18', 2, FALSE),
(8, 8, '2026-01-15', '2026-01-17', 4, FALSE),
(9, 9, '2026-01-17', '2026-01-23', 3, TRUE),
(10, 10, '2026-01-20', '2026-01-24', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(11, 11, '2026-01-22', '2026-01-26', 1, FALSE),
(12, 12, '2026-01-24', '2026-01-29', 2, FALSE),
(13, 13, '2026-01-25', '2026-01-31', 3, TRUE),
(14, 14, '2026-01-27', '2026-01-30', 4, FALSE),
(15, 15, '2026-01-29', '2026-02-03', 5, FALSE),
(16, 16, '2026-02-01', '2026-02-05', 1, TRUE),
(17, 17, '2026-02-03', '2026-02-08', 2, FALSE),
(18, 18, '2026-02-04', '2026-02-07', 4, FALSE),
(19, 19, '2026-02-06', '2026-02-11', 3, TRUE),
(20, 20, '2026-02-08', '2026-02-12', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(21, 21, '2026-02-10', '2026-02-15', 1, FALSE),
(22, 22, '2026-02-12', '2026-02-16', 2, TRUE),
(23, 23, '2026-02-14', '2026-02-20', 3, FALSE),
(24, 24, '2026-02-16', '2026-02-19', 4, FALSE),
(25, 25, '2026-02-18', '2026-02-24', 5, TRUE),
(26, 26, '2026-02-20', '2026-02-23', 1, FALSE),
(27, 27, '2026-02-22', '2026-02-27', 2, FALSE),
(28, 28, '2026-02-24', '2026-02-28', 4, TRUE),
(29, 29, '2026-02-26', '2026-03-03', 3, FALSE),
(30, 30, '2026-02-28', '2026-03-05', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(31, 31, '2026-03-02', '2026-03-07', 1, FALSE),
(32, 32, '2026-03-04', '2026-03-08', 2, FALSE),
(33, 33, '2026-03-06', '2026-03-12', 3, TRUE),
(34, 34, '2026-03-08', '2026-03-11', 4, FALSE),
(35, 35, '2026-03-10', '2026-03-15', 5, FALSE),
(36, 36, '2026-03-12', '2026-03-16', 1, TRUE),
(37, 37, '2026-03-14', '2026-03-19', 2, FALSE),
(38, 38, '2026-03-16', '2026-03-20', 4, FALSE),
(39, 39, '2026-03-18', '2026-03-24', 3, TRUE),
(40, 40, '2026-03-20', '2026-03-25', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(41, 41, '2026-03-22', '2026-03-27', 1, FALSE),
(42, 42, '2026-03-24', '2026-03-29', 2, TRUE),
(43, 43, '2026-03-26', '2026-04-01', 3, FALSE),
(44, 44, '2026-03-28', '2026-03-31', 4, FALSE),
(45, 45, '2026-03-30', '2026-04-04', 5, TRUE),
(46, 46, '2026-04-02', '2026-04-06', 1, FALSE),
(47, 47, '2026-04-04', '2026-04-09', 2, FALSE),
(48, 48, '2026-04-06', '2026-04-10', 4, TRUE),
(49, 49, '2026-04-08', '2026-04-14', 3, FALSE),
(50, 50, '2026-04-10', '2026-04-15', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(51, 51, '2026-04-12', '2026-04-17', 1, FALSE),
(52, 52, '2026-04-14', '2026-04-19', 2, TRUE),
(53, 53, '2026-04-16', '2026-04-22', 3, FALSE),
(54, 54, '2026-04-18', '2026-04-21', 4, FALSE),
(55, 55, '2026-04-20', '2026-04-26', 5, TRUE),
(56, 56, '2026-04-22', '2026-04-25', 1, FALSE),
(57, 57, '2026-04-24', '2026-04-29', 2, FALSE),
(58, 58, '2026-04-26', '2026-04-30', 4, TRUE),
(59, 59, '2026-04-28', '2026-05-04', 3, FALSE),
(60, 60, '2026-04-30', '2026-05-05', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(61, 61, '2026-05-02', '2026-05-07', 1, FALSE),
(62, 62, '2026-05-04', '2026-05-09', 2, TRUE),
(63, 63, '2026-05-06', '2026-05-12', 3, FALSE),
(64, 64, '2026-05-08', '2026-05-11', 4, FALSE),
(65, 65, '2026-05-10', '2026-05-16', 5, TRUE),
(66, 66, '2026-05-12', '2026-05-15', 1, FALSE),
(67, 67, '2026-05-14', '2026-05-19', 2, FALSE),
(68, 68, '2026-05-16', '2026-05-20', 4, TRUE),
(69, 69, '2026-05-18', '2026-05-24', 3, FALSE),
(70, 70, '2026-05-20', '2026-05-25', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(71, 71, '2026-05-22', '2026-05-27', 1, FALSE),
(72, 72, '2026-05-24', '2026-05-29', 2, TRUE),
(73, 73, '2026-05-26', '2026-06-01', 3, FALSE),
(74, 74, '2026-05-28', '2026-05-31', 4, FALSE),
(75, 75, '2026-05-30', '2026-06-05', 5, TRUE),
(76, 76, '2026-06-02', '2026-06-05', 1, FALSE),
(77, 77, '2026-06-04', '2026-06-09', 2, FALSE),
(78, 78, '2026-06-06', '2026-06-10', 4, TRUE),
(79, 79, '2026-06-08', '2026-06-14', 3, FALSE),
(80, 80, '2026-06-10', '2026-06-15', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(81, 81, '2026-06-12', '2026-06-17', 1, FALSE),
(82, 82, '2026-06-14', '2026-06-19', 2, TRUE),
(83, 83, '2026-06-16', '2026-06-22', 3, FALSE),
(84, 84, '2026-06-18', '2026-06-21', 4, FALSE),
(85, 85, '2026-06-20', '2026-06-26', 5, TRUE),
(86, 86, '2026-06-22', '2026-06-25', 1, FALSE),
(87, 87, '2026-06-24', '2026-06-29', 2, FALSE),
(88, 88, '2026-06-26', '2026-06-30', 4, TRUE),
(89, 89, '2026-06-28', '2026-07-04', 3, FALSE),
(90, 90, '2026-06-30', '2026-07-05', 5, FALSE);

INSERT INTO admissions (admission_id, patient_id, admit_date, discharge_date, department_id, readmitted_30_days)
VALUES
(91, 91, '2026-07-02', '2026-07-07', 1, FALSE),
(92, 92, '2026-07-04', '2026-07-09', 2, TRUE),
(93, 93, '2026-07-06', '2026-07-12', 3, FALSE),
(94, 94, '2026-07-08', '2026-07-11', 4, FALSE),
(95, 95, '2026-07-10', '2026-07-16', 5, TRUE),
(96, 96, '2026-07-12', '2026-07-15', 1, FALSE),
(97, 97, '2026-07-14', '2026-07-19', 2, FALSE),
(98, 98, '2026-07-16', '2026-07-20', 4, TRUE),
(99, 99, '2026-07-18', '2026-07-24', 3, FALSE),
(100, 100, '2026-07-20', '2026-07-25', 5, FALSE);

/*
=====================================================
SECTION 3: ANALYTICS QUERIES
=====================================================
*/
 
/*
Query #1: Total Admissions
Business Question: How many inpatient admissions occurred?
*/

SELECT COUNT(*) AS total_admissions
FROM admissions;
 
/*
Query #2: Average Length of Stay (LOS)
Business Question: What is the average length of stay?
*/

SELECT ROUND(AVG(discharge_date - admit_date), 2 ) AS avg_los
FROM admissions;

/*
Query #3: Average Length of Stay (LOS) by Department
Business Question: What is the average length of stay by department?
*/

SELECT d.department_name, ROUND(AVG(a.discharge_date - a.admit_date),2) AS avg_los
FROM admissions a
INNER JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

/*
Query #4:  Total Admissions by Department
Business Question: Which departments receive the most patients?
*/

SELECT d.department_name, COUNT(*) AS total_admissions
FROM admissions a
INNER JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_admissions DESC;
 
/*
Query #5: Overall Readmission Count
Business Question: How many patients were readmitted within 30 days?
*/

SELECT COUNT(*) AS readmission_count
FROM admissions
WHERE readmitted_30_days = TRUE;

/*
Query #6:  Overall Readmission Rate (%)
Business Question: What percentage of admissions resulted in a 30-day readmission?
*/
-- Readmission Rate = (Readmissions / Total Admissions) * 100
SELECT ROUND(100.0 * SUM(CASE WHEN readmitted_30_days = TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS readmission_rate_pct
FROM admissions;

/*
Query #7: Readmission Rate by Department (%)
Business Question: What is the readmission rate at the departmental level?
*/
 
SELECT
d.department_name,
ROUND(100.0 * SUM(CASE WHEN a.readmitted_30_days = TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS readmission_rate_pct
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY readmission_rate_pct DESC;


/*
Query #8: Admissions by Month
Business Question: What is the inpatient admission trend over time?
*/

SELECT TO_CHAR(admit_date, 'YYYY-MM') AS month, COUNT(*) AS admissions
FROM admissions
GROUP BY TO_CHAR(admit_date, 'YYYY-MM')
ORDER BY month;

/*
Query #9: Average Length of Stay by Month
Business Question: How has the inpatient average length of stay changed over time?
*/

SELECT
TO_CHAR(admit_date, 'YYYY-MM') AS month,
ROUND(AVG(discharge_date - admit_date), 2) AS avg_los
FROM admissions
GROUP BY TO_CHAR(admit_date, 'YYYY-MM')
ORDER BY month;

/*
Query #10: Admissions by Department and by Month
Business Question: Which departments experience the highest patient volume each month?
*/

SELECT d.department_name, TO_CHAR(a.admit_date, 'YYYY-MM') AS month, 
COUNT(*) AS total_admissions
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name, TO_CHAR(a.admit_date, 'YYYY-MM')
ORDER BY d.department_name, month;

/*
Query #11: Average Length of Stay (LOS) by Department and Month
Business Question: How does patient length of stay vary across departments and over time?
*/

SELECT d.department_name,
TO_CHAR(a.admit_date, 'YYYY-MM') AS month, 
ROUND(AVG(discharge_date - admit_date), 2) AS avg_los
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name, TO_CHAR(a.admit_date, 'YYYY-MM')
ORDER BY d.department_name, month;

/*
Query #12: Longest Average LOS by Department
Business Question: Which department has the highest average patient length of stay?
*/

SELECT d.department_name, ROUND(AVG(a.discharge_date - a.admit_date), 2) AS avg_los
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_los DESC
LIMIT 1;

/*
Query #13: Readmission Rate by Department
Business Question: Which departments have the highest readmission rates?
*/

SELECT d.department_name,
ROUND(
SUM(CASE WHEN a.readmitted_30_days = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;

/*
Query #14: Top Department by Total Admissions
Business Question: Which department handles the greatest volume of inpatient admissions?
*/

SELECT d.department_name, COUNT(*) AS total_admissions
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_admissions DESC
LIMIT 1;

/*
Query #15: Average Length of Stay (LOS) for Readmitted vs Non-Readmitted Patients
Business Question: Do readmitted patients tend to have longer hospital stays than non-readmitted patients?
*/

SELECT readmitted_30_days, ROUND(AVG(discharge_date - admit_date), 2) AS avg_los
FROM admissions
GROUP BY readmitted_30_days;

/*
Query #16: Monthly Readmission Trend
Business Question: How do readmission counts change month over month?
*/

SELECT TO_CHAR(admit_date, 'YYYY-MM') AS month,
SUM( CASE WHEN readmitted_30_days = TRUE THEN 1 ELSE 0 END) AS readmissions
FROM admissions
GROUP BY TO_CHAR(admit_date, 'YYYY-MM')
ORDER BY month;

/* 
Query #17: Departmental Patient Volume Trend
Business Question: Which departments experience the highest overall patient volumes?
*/

SELECT d.department_name, COUNT(*) AS admissions_count
FROM admissions a
JOIN departments d
ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY admissions_count DESC;

/*
Query #18: Length of Stay Summary Statistics
Business Question: What are the minimum, maximum, and average patient lengths of stay?
*/

SELECT 
MIN(discharge_date - admit_date) AS min_los,
MAX(discharge_date - admit_date) AS max_los,
ROUND(AVG(discharge_date - admit_date), 2) AS avg_los
FROM admissions;