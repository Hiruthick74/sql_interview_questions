CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE
);

-- 1. What's wrong here?
-- SELECT name salary FROM employees;
-- ❌ Missing comma
-- ✅ SELECT name, salary FROM employees;

-- 2. Table name typo
-- SELECT * FROM employee;
-- ❌ Table 'employee' doesn't exist
-- ✅ SELECT * FROM employees;

-- 3. Comparing number with string
-- SELECT * FROM employees WHERE salary = '60000';
-- ❌ Quotes around number
-- ✅ WHERE salary = 60000;

-- 4. Grouping without selecting grouped column
-- SELECT COUNT(name) FROM employees GROUP BY department;
-- ❌ Missing department in SELECT
-- ✅ SELECT department, COUNT(name) FROM employees GROUP BY department;

-- 5. Update with unquoted string
-- UPDATE employees SET salary = salary + 5000 WHERE department = IT;
-- ❌ IT should be in quotes
-- ✅ WHERE department = 'IT';

-- 6. Date comparison without quotes
-- DELETE FROM employees WHERE join_date > 2022-01-01;
-- ❌ Date should be quoted
-- ✅ WHERE join_date > '2022-01-01';

-- 7. ORDER clause typo
-- SELECT name FROM employees ORDER salary DESC;
-- ❌ Missing BY
-- ✅ ORDER BY salary DESC;

-- 8. GROUP BY conflict
-- SELECT DISTINCT name, department FROM employees GROUP BY department;
-- ❌ name not aggregated or grouped
-- ✅ SELECT department, COUNT(name) FROM employees GROUP BY department;

-- 9. ALTER TABLE missing datatype
-- ALTER TABLE employees ADD salary;
-- ❌ No datatype
-- ✅ ADD salary DECIMAL(10,2);

-- 10. LIKE pattern without quotes
-- SELECT * FROM employees WHERE name LIKE A%;
-- ❌ Pattern must be quoted
-- ✅ WHERE name LIKE 'A%';
