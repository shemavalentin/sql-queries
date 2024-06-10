
-- order of operation 

--  FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER

SELECT coll, COUNT(col2) FROM <table> WHERE col2 > X GROUP BY col1 HAVING col1 === Y;

-- WHERE : applies filters to each individual rows

-- HAVING: Applies filters to a group as a whole 

-- Let's take an example of a complex query

SELECT d.dept_name, COUNT(e.emp_no) AS " # of employees"
FROM employees AS e INNER JOIN dept_emp AS  de ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
-- WHERE e.gender = 'F'
GROUP BY d.dept_name
--HAVING count(e.emp_no) > 25000


--  now want to know which department have above 25000 employees

SELECT d.dept_name, COUNT(e.emp_no) AS " # of employees"
FROM employees AS e INNER JOIN dept_emp AS  de ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
-- WHERE e.gender = 'F'
GROUP BY d.dept_name
HAVING count(e.emp_no) > 25000

-- I can even want to know how many female above 25000  in the company

SELECT d.dept_name, COUNT(e.emp_no) AS " # of employees"
FROM employees AS e INNER JOIN dept_emp AS  de ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE e.gender = 'F'
GROUP BY d.dept_name
HAVING count(e.emp_no) > 25000


-- WHERE spacifically is used to filter each indivisual
-- while HAVING is used to filiter by groups


-- EXERCISES 

/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

SELECT e.emp_no, count(t.title) as "amount of titles"
FROM employees as e
JOIN titles as t USING(emp_no)
WHERE EXTRACT (YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
HAVING count(t.title) > 2
ORDER BY e.emp_no;

/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/

SELECT e.emp_no, count(s.from_date) as "amount of raises"
FROM employees as e
JOIN salaries as s USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no
HAVING count(s.from_date) > 15
ORDER BY e.emp_no;

/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

SELECT e.emp_no, count(de.dept_no) as "worked for # departments"
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
GROUP BY e.emp_no
HAVING count(de.dept_no) > 1
ORDER BY e.emp_no;