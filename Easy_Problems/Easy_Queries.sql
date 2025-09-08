-- Create the employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE
);

-- Insert 20 sample rows
INSERT INTO employees (id, name, department, salary, join_date) VALUES
(1, 'Arun Kumar', 'Marketing', 55000.00, '2022-03-15'),
(2, 'Priya Raj', 'Sales', 62000.00, '2021-07-10'),
(3, 'Vikram Das', 'IT', 72000.00, '2020-11-01'),
(4, 'Meena Iyer', 'HR', 48000.00, '2023-01-20'),
(5, 'Ravi Shankar', 'Finance', 67000.00, '2019-06-25'),
(6, 'Divya Nair', 'Marketing', 53000.00, '2022-08-30'),
(7, 'Karthik M', 'Sales', 61000.00, '2021-12-05'),
(8, 'Sneha S', 'IT', 75000.00, '2020-04-18'),
(9, 'Ajay Dev', 'HR', 49000.00, '2023-03-10'),
(10, 'Lakshmi V', 'Finance', 66000.00, '2019-09-12'),
(11, 'Surya R', 'Marketing', 56000.00, '2022-05-22'),
(12, 'Anjali T', 'Sales', 60000.00, '2021-10-14'),
(13, 'Manoj B', 'IT', 73000.00, '2020-07-07'),
(14, 'Deepa K', 'HR', 47000.00, '2023-02-28'),
(15, 'Naveen J', 'Finance', 68000.00, '2019-03-19'),
(16, 'Ritika G', 'Marketing', 54000.00, '2022-09-05'),
(17, 'Siddharth P', 'Sales', 63000.00, '2021-05-17'),
(18, 'Pooja L', 'IT', 76000.00, '2020-01-23'),
(19, 'Rajesh N', 'HR', 50000.00, '2023-04-11'),
(20, 'Bhavana D', 'Finance', 69000.00, '2019-12-30');


-- 1. Retrieve all employees
SELECT * FROM employees;

-- 2. Get names and salaries of employees in 'Marketing'
SELECT name, salary FROM employees WHERE department = 'Marketing';

-- 3. Find employees who joined after 2022
SELECT * FROM employees WHERE join_date > '2022-01-01';

-- 4. Count how many employees are in each department
SELECT department, COUNT(*) AS total FROM employees GROUP BY department;

-- 5. Find the highest salary in the company
SELECT MAX(salary) AS max_salary FROM employees;

-- 6. List employees sorted by salary descending
SELECT name, salary FROM employees ORDER BY salary DESC;

-- 7. Update salary of employee with id = 7
UPDATE employees SET salary = 75000 WHERE id = 7;

-- 8. Delete employees from 'HR' department
DELETE FROM employees WHERE department = 'HR';

-- 9. Show average salary per department
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department;

-- 10. Find employees whose name starts with 'A'
SELECT * FROM employees WHERE name LIKE 'A%';
