SELECT * FROM departments;
SELECT * FROM location;
Select * from employees;

-- 1. Distinct Values: a query to retrieve distinct salaries from the Employees table.

SELECT DISTINCT salary from employees;

-- 2. Alias (AS): Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.

SELECT age AS Employee_Age, salary AS Employee_Salary 
FROM employees;

-- 3. Where Clause & Operators: ⦿ Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.
SELECT employee_name from employees
WHERE salary>50000 AND hire_date<'2016-01-01';

-- ⦿ Find the employee whose designation is missing and fill it with "Data Scientist"
SELECT * FROM employees
WHERE designation IS NULL;

UPDATE employees
SET designation = 'Data Scientist'
WHERE employee_id = 5004;

/*
Sorting and Grouping Data:
1. ORDER BY:
⦿ Find employees sorted by department ID in ascending order and salary in
descending order.
*/

SELECT * FROM employees
ORDER BY department_id ASC, salary DESC;

/*
2. LIMIT:
⦿ Display the first 5 employees hired in the year 2018.
*/
SELECT * FROM employees
WHERE YEAR(hire_date)=2018
ORDER BY hire_date
LIMIT 5;

-- 3. Aggregate Functions: ⦿ Calculate the sum of all salaries in the Finance department.
SELECT SUM(salary) AS Finance_total_Salary from employees
WHERE department_id ='7';

-- ⦿ Find the minimum age among all employees.
SELECT MIN(age) As Minimum_Age FROM employees;

-- GROUP BY: ⦿ List the maximum salary for each location.
SELECT location_id, MAX(salary) AS Maximum_salary from employees
GROUP BY location_id;

-- ⦿ Calculate the average salary for each designation containing the word'Analyst'.
SELECT designation,AVG(salary) AS Average_salary FROM employees
WHERE designation LIKE '%analyst%'
GROUP BY designation;

/*
5. HAVING:
⦿ Find departments with less than 3 employees.
*/
SELECT department_id,COUNT(department_id) AS Total_count FROM employees
GROUP BY department_id
HAVING Total_count<3;

--  Find locations with female employees whose average age is below 30.

SELECT location_id,AVG(age) AS average_age FROM employees
WHERE gender='F'
GROUP BY location_id
HAVING average_age<30;

/*
Joins:
1. Inner Join:
⦿ List employee names, their designations, and department names where
employees are assigned to a department.
*/
SELECT e.employee_name,e.designation,d.department_name
FROM employees AS e INNER JOIN departments AS d
ON e.department_id=d.department_id;

/*
2. Left Join:
⦿ List all departments along with the total number of employees in each
department, including departments with no employees.
*/
SELECT d.department_id,d.department_name, COUNT(e.employee_id) AS Total_employees
FROM departments AS d LEFT JOIN employees as e
ON d.department_id=e.department_id
GROUP BY d.department_id;

/*
3. Right Join:
⦿ Display all locations along with the names of employees assigned to each
location. If no employees are assigned to a location, display NULL for
employee name.
*/
SELECT l.location_id,l.location,e.employee_name
FROM location AS l RIGHT JOIN employees as e
ON l.location_id=e.location_id
ORDER BY location_id;