/*
Table Creation (CREATE): Write the SQL statements to create a database named
“employee” and the following tables based on the provided schema:
⦿ Departments
⦿ Location
⦿ Employees
*/

CREATE DATABASE employee;

USE employee;

CREATE TABLE departments
( 
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100)
);
SELECT * FROM departments;

CREATE TABLE location
(
  location_id INT PRIMARY KEY,
  location VARCHAR(30)
);
SELECT * FROM location;

CREATE TABLE employees
(
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50),
  gender ENUM('M','F'),
  age INT,
  hire_date DATE,
  designation VARCHAR(100),
  department_id INT,
  location_id INT,
  salary DECIMAL(10,2),
  FOREIGN KEY (department_id) REFERENCES departments(department_id),
  FOREIGN KEY (location_id) REFERENCES location(location_id)
);
Select * from employees;
DESCRIBE departments;
DESCRIBE location;
DESCRIBE employees;


/*
2. Table Alteration (ALTER): Consider the following scenarios and write the SQL
statements to alter the structure of the tables accordingly:
*/
-- ⦿ Add a new column named "email" to the Employees table to store employee email addresses.

ALTER TABLE employees 
ADD COLUMN email VARCHAR(50);

-- ⦿ Modify the data type of the "designation" column in the Employees table to support a wider range of values.

ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(250);

-- ⦿ Drop the “age” column from the Employees table.

ALTER TABLE employees
DROP COLUMN age;

-- ⦿ Rename the “hire_date” column to “date_of_joining”.

ALTER TABLE employees
RENAME COLUMN hire_date TO date_of_joining;

/*
3.Table Renaming (RENAME): Rewrite the SQL statements to rename the following tables: 
*/
-- ⦿ Rename the "Departments" table to "Departments_Info".
RENAME TABLE departments to Departments_Info;
SELECT * FROM Departments_Info;

-- ⦿ Rename the "Location" table to "Locations". 
RENAME TABLE location to Locations;
SELECT * FROM Locations;

INSERT INTO departments_info VALUES
(1,'operation');
INSERT INTO locations VALUES
(99,'kochi');
INSERT INTO Employees VALUES
(101,'Fazil','M','2026-10-10','Engineer',1,99,5000,'fazilnazeer13@gmail.com');
Select * from employees;

-- 4.	Table Truncation (TRUNCATE): Write an SQL statement to truncate the Employees table.
TRUNCATE TABLE employees;

-- Database & Table Dropping (DROP): Write the SQL statements to drop the Employees table and then the “employee” database.
DROP TABLE employees;
DROP DATABASE employee;
-----
/*
Constraints :
1. Database Recreation:
⦿ Drop the 'employee' database if it exists and recreate it using the
provided schema, ensuring that all tables are created with the
appropriate constraints as instructed.
2. Departments Table:
⦿ Ensure that the "department_id" uniquely identifies each department.
⦿ Set up constraints on the "department_name" to avoid duplicate and null
entries.
*/
CREATE DATABASE IF NOT EXISTS employee;
USE employee;

CREATE TABLE departments
( 
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100) UNIQUE NOT NULL
);
SELECT * FROM departments;

/*
3. Location Table:
⦿ Establish a mechanism to automatically generate unique identifiers for
each location, ensuring that they are incremented sequentially.
⦿ Implement constraints to prevent the insertion of null and duplicate
locations.
*/

CREATE TABLE location
(
  location_id INT AUTO_INCREMENT PRIMARY KEY,
  location VARCHAR(30) UNIQUE NOT NULL
);
SELECT * FROM location;

/*
4. Employees Table:
⦿ Guarantee that each employee has a distinct identifier.
⦿ Create a restriction to ensure that the employee's name is always
provided.
⦿ Limit the acceptable values for the "gender" field to only 'M' or 'F'.
⦿ Enforce a condition to ensure that the employee's age is 18 or above.
⦿ Automatically assign the current date to the "hire_date" field if not
specified.
⦿ Establish links between the "department_id" and "location_id" fields in
the "employees" table and their respective tables.
*/

CREATE TABLE employees
(
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50) NOT NULL,
  gender ENUM('M','F') CHECK(gender IN ('M','F')),
  age INT CHECK(age >= 18),
  hire_date DATE DEFAULT(CURRENT_DATE),
  designation VARCHAR(100),
  department_id INT,
  location_id INT,
  salary DECIMAL(10,2),
  FOREIGN KEY (department_id) REFERENCES departments(department_id),
  FOREIGN KEY (location_id) REFERENCES location(location_id)
);
Select * from employees;
DESCRIBE departments;
DESCRIBE location;
DESCRIBE employees;

INSERT INTO departments VALUES
(1,'operation');
INSERT INTO location VALUES
(99,'kochi');
INSERT INTO Employees VALUES
(101,'Fazil','M',18,DEFAULT,'Engineer',1,99,5000);
Select * from employees;
Select * from departments;
Select * from location;



