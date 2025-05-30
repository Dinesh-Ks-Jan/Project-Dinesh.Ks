CREATE TABLE employees(
    EMPLOYEE_ID INT PRIMARY KEY,
    NAME TEXT,
    DEPARTMENT VARCHAR(50),
    EMAIL TEXT,
    PHONE_NO BIGINT,
    JOINING_DATE DATE,
    SALARY DECIMAL(10, 2),
    BONUS DECIMAL(10, 2),
    TAX_PERCENTAGE DECIMAL(5, 2)
);

INSERT INTO employees (EMPLOYEE_ID, NAME, DEPARTMENT, EMAIL, PHONE_NO,
    JOINING_DATE, SALARY, BONUS, TAX_PERCENTAGE)
VALUES
(1, 'John Doe', 'HR', 'johndoe@example.com', 1234567890, '2025-04-15',
120000.00, 30000.00, 10.00),
(2, 'Jane Smith', 'Engineering', 'janesmith@example.com', 1234567891,
'2025-03-10', 110000.00, 25000.00, 15.00),
(3, 'Michael Brown', 'Marketing', 'michaelbrown@example.com',
1234567892, '2025-01-23', 95000.00, 15000.00, 12.00),
(4, 'Emily Davis', 'Sales', 'emilydavis@example.com', 1234567893,
'2025-02-15', 105000.00, 20000.00, 13.00),
(5, 'James Wilson', 'Finance', 'jameswilson@example.com', 1234567894,
'2025-05-05', 150000.00, 25000.00, 18.00),
(6, 'Olivia Taylor', 'HR', 'oliviataylor@example.com', 1234567895,
'2025-03-12', 55000.00, 4500.00, 10.00),
(7, 'David Anderson', 'Engineering', 'davidanderson@example.com',
1234567896, '2025-04-01', 85000.00, 7500.00, 14.00),
(8, 'Sophia Martinez', 'Marketing', 'sophiamartinez@example.com',
1234567897, '2025-05-10', 65000.00, 5500.00, 11.00),
(9, 'Daniel Garcia', 'Sales', 'danielgarcia@example.com', 1234567898,
'2025-01-25', 70000.00, 6000.00, 12.00),
(10, 'Charlotte Lee', 'Finance', 'charlottelee@example.com',
1234567899, '2025-02-05', 95000.00, 10000.00, 16.00),
(11, 'Alice Green', 'HR', 'alicegreen@example.com', 1234567801, '2025-03-20', 80000.00, 15000.00, 10.00),
(12, 'Robert Clark', 'Engineering', 'robertclark@example.com',
1234567802, '2025-04-10', 95000.00, 18000.00, 12.00),
(13, 'Eva White', 'Marketing', 'evawhite@example.com', 1234567803,
'2025-02-01', 75000.00, 12000.00, 11.00),
(14, 'Liam Johnson', 'Sales', 'liamjohnson@example.com', 1234567804,
'2025-01-15', 72000.00, 8000.00, 14.00),
(15, 'Sophia Harris', 'Finance', 'sophiaharris@example.com',
1234567805, '2025-04-25', 110000.00, 22000.00, 13.00),
(16, 'William Walker', 'HR', 'williamwalker@example.com', 1234567806,
'2025-03-05', 60000.00, 5000.00, 10.00),
(17, 'Mia Young', 'Engineering', 'miayoung@example.com', 1234567807,
'2025-04-30', 105000.00, 17000.00, 12.00),
(18, 'Henry King', 'Marketing', 'henryking@example.com', 1234567808,
'2025-01-25', 68000.00, 9000.00, 11.00),
(19, 'Amelia Scott', 'Sales', 'ameliascott@example.com', 1234567809,
'2025-02-10', 70000.00, 7500.00, 13.00),
(20, 'Oliver Adams', 'Finance', 'oliveradams@example.com', 1234567810,
'2025-05-01', 115000.00, 20000.00, 14.00);

-- Retrieve the list of employees sorted by salary in descending order:
SELECT NAME, SALARY
FROM employees
ORDER BY SALARY DESC;

-- Find employees with a total compensation (SALARY + BONUS) greater than $100,000:
SELECT NAME, (SALARY + BONUS) AS TOTAL_COMPENSATION
FROM employees
WHERE (SALARY + BONUS) >= 100000.00;

-- Update the bonus for employees in the Sales department by 10%:
UPDATE employees
SET BONUS = BONUS * 1.10
WHERE DEPARTMENT = 'Sales';
SELECT NAME, BONUS FROM employees;

-- Calculate the net salary after deducting tax for all employees:
UPDATE employees
SET SALARY = SALARY - (SALARY * (TAX_PERCENTAGE / 100));
SELECT NAME, SALARY FROM employees;

-- Retrieve the average, minimum, and maximum salary per department:
SELECT DEPARTMENT, AVG(SALARY) AS AVERAGE_SALARY, MIN(SALARY) AS
MINIMUM_SALARY, MAX(SALARY) AS MAXIMUM_SALARY
FROM employees
GROUP BY DEPARTMENT;

-- Retrieve employees who joined in the last 6 months:
SELECT EMPLOYEE_ID, NAME, DEPARTMENT, JOINING_DATE
FROM employees
WHERE JOINING_DATE >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Group employees by department and count how many employees each has:
SELECT DEPARTMENT, COUNT(EMPLOYEE_ID) AS EMPLOYEE_COUNT
FROM employees
GROUP BY DEPARTMENT;

-- Find the department with the highest average salary:
SELECT DEPARTMENT, AVG(SALARY) AS AVERAGE_SALARY
FROM employees
GROUP BY DEPARTMENT
ORDER BY AVERAGE_SALARY DESC;

-- Identify employees who have the same salary as at least one other employee:
SELECT E1.EMPLOYEE_ID, E1.NAME, E1.SALARY
FROM employees E1
JOIN employees E2 ON E1.SALARY = E2.SALARY AND E1.EMPLOYEE_ID != E2.EMPLOYEE_ID;
