-- Relationship across the tables

SELECT a.emp_no, CONCAT( a.first_name, a.last_name) as 'name', b.salary
FROM employees as a, salaries as b;

-- Add a WHERE clause to specify the ID to who the salary is linked to
-- this query gives the employee no name and salary

SELECT a.emp_no, CONCAT( a.first_name, a.last_name) as 'name', b.salary
FROM employees as a, salaries as b WHERE a.emp_no = b.emp_no;

-- this query gives employees no, salary, and from date
-- you need to add the where clause to avoid that data are aggregated to one employee

SELECT a.emp_no, b.salary, b.from_date FROM employees as a, salaries as b WHERE a.emp_no = b.emp_no order by a.emp_no;


