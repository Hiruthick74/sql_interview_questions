-- 1. Top-Selling Product by Category
-- Table: Products
CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(50),
  category VARCHAR(50)
);

-- Table: Sales
CREATE TABLE Sales (
  sale_id INT,
  product_id INT,
  quantity INT
);

-- Query: Find top-selling product in each category
SELECT p.category, p.product_name, SUM(s.quantity) AS total_sold
FROM Products p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.category, p.product_name
QUALIFY RANK() OVER (PARTITION BY p.category ORDER BY SUM(s.quantity) DESC) = 1;

-- 2. Employees Earning More Than Their Manager
-- Table: Employees
CREATE TABLE Employees (
  employee_id INT,
  name VARCHAR(50),
  salary INT,
  manager_id INT
);

-- Query: Find employees whose salary is higher than their manager
SELECT e.employee_id, e.name, e.salary
FROM Employees e
JOIN Employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

-- 3. Second Highest Salary in Each Department
-- Table: Employees
CREATE TABLE Employees (
  employee_id INT,
  name VARCHAR(50),
  salary INT,
  department_id INT
);

-- Query: Find second highest salary in each department
WITH RankedSalaries AS (
  SELECT department_id, name, salary,
         DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
  FROM Employees
)
SELECT department_id, name, salary
FROM RankedSalaries
WHERE rnk = 2;

-- 4. Customers Who Ordered All Products
-- Table: Customers
CREATE TABLE Customers (
  customer_id INT,
  name VARCHAR(50)
);

-- Table: Products
CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(50)
);

-- Table: Orders
CREATE TABLE Orders (
  order_id INT,
  customer_id INT,
  product_id INT
);

-- Query: Find customers who ordered all products
SELECT c.customer_id
FROM Customers c
WHERE NOT EXISTS (
  SELECT p.product_id
  FROM Products p
  WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id AND o.product_id = p.product_id
  )
);

-- 5. Union of Active and Inactive Users
-- Table: ActiveUsers
CREATE TABLE ActiveUsers (
  user_id INT,
  name VARCHAR(50)
);

-- Table: InactiveUsers
CREATE TABLE InactiveUsers (
  user_id INT,
  name VARCHAR(50)
);

-- Query: Combine active and inactive users with status
SELECT user_id, name, 'Active' AS status FROM ActiveUsers
UNION
SELECT user_id, name, 'Inactive' AS status FROM InactiveUsers;

-- 6. Find Duplicate Emails
-- Table: Users
CREATE TABLE Users (
  user_id INT,
  email VARCHAR(100)
);

-- Query: Find duplicate emails
SELECT email, COUNT(*) AS count
FROM Users
GROUP BY email
HAVING COUNT(*) > 1;

-- 🧩 7. Latest Order per Customer
-- Table: Orders
CREATE TABLE Orders (
  order_id INT,
  customer_id INT,
  order_date DATE
);

-- Query: Get latest order per customer
SELECT customer_id, order_id, order_date
FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
  FROM Orders
) t
WHERE rn = 1;

-- 8. Products Never Ordered
-- Table: Products
CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(50)
);

-- Table: Orders
CREATE TABLE Orders (
  order_id INT,
  product_id INT
);

-- Query: Find products never ordered
SELECT p.product_id, p.product_name
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

-- 🧩 9. Average Salary by Department Excluding Interns
-- Table: Employees
CREATE TABLE Employees (
  employee_id INT,
  name VARCHAR(50),
  salary INT,
  department_id INT,
  role VARCHAR(50)
);

-- Query: Average salary by department excluding interns
SELECT department_id, AVG(salary) AS avg_salary
FROM Employees
WHERE role != 'Intern'
GROUP BY department_id;

-- 🧩 10. Monthly Revenue Trend
-- Table: Sales
CREATE TABLE Sales (
  sale_id INT,
  sale_date DATE,
  amount INT
);

-- Query: Monthly revenue trend
SELECT DATE_TRUNC('month', sale_date) AS month, SUM(amount) AS revenue
FROM Sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;
