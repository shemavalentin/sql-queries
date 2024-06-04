/*
WHAT IF I ALSO NEED THE ROWS THAT DON'T MATCH?

In the inner join we solved the problem of intersection looking for the data that 
intersect through primary key an foreign key.

In our filter, what we basically we towards is that middle point

Now: what if I also need all the rows that don't match?? what if I also want to see those?
--> What outer joins try to do as opposed inner join is also take into account everything outside.
*/

-- Outer Joins add the data that don't have a match
/*
When joining tables you need to decide which table to put at the right side and left side
Basing on that there are two types of OUTER JOIN

 1.  LEFT OUTER JOIN 
 2.  RIGHT OUTER JOIN

in the inner join we wanted the thingd that matched our join. (where two tables intersect)
*/

-- OUTER JOIN Syntax

SELECT * FROM <table A> AS a LEFT [OUTER] JOIN <table B> AS b ON a.id = b.id; -- you can remove that OUTER

-- The data that don't found in the left rows becouse they are in the intesection are 
-- represented as null values but no prob as long as it is the OUTER JOIN


--> PROBLEM STATEMENT

/* What if you want to know how many employees aren't managers?*/
SELECT COUNT(emp.emp_no) FROM employees AS emp LEFT JOIN dept_manager AS 
dep ON emp.emp_no = dep.emp_no WHERE dep.emp_no IS NULL;

-- Now we can avoid these NULL values by using WHERE clause

SELECT emp.emp_no, dep.emp_no FROM employees as emp left join dept_manager AS dep ON emp.emp_no = dep.emp_no
WHERE dep.emp_no IS NOT NULL

-- But if we did ISNULL and COUNT to find the number of employees who are not managers 

SELECT COUNT(emp.emp_no) FROM employees as emp left join dept_manager AS dep ON emp.emp_no = dep.emp_no
WHERE dep.emp_no IS NULL


-- Let's say you want to know every salary raise and also know which ones were a promotion
-- Retrieving the employees who got a raise and their titles after two days
SELECT a.emp_no, b.salary, c.title FROM employees AS a 
INNER JOIN salaries AS b ON b.emp_no = a.emp_no
INNER JOIN titles AS c ON c.emp_no = a. emp_no AND (c.from_date = b.from_date OR c.from_date = b.from_date + INTERVAL '2 days') ORDER BY a.emp_no;

-- Now what if we wanted to also include all of the salaries that didn't account for a title change?
SELECT a.emp_no, b.salary, c.title FROM employees AS a 
INNER JOIN salaries AS b ON b.emp_no = a.emp_no
LEFT JOIN titles AS c ON c.emp_no = a. emp_no 
AND (c.from_date = b.from_date OR c.from_date = b.from_date + INTERVAL '2 days') ORDER BY a.emp_no;

-- Let's COALESCE the title to replace the NULL value with a text to look some how prettier
SELECT a.emp_no, b.salary, COALESCE(c.title, 'No title change') FROM employees AS a 
INNER JOIN salaries AS b ON b.emp_no = a.emp_no
LEFT JOIN titles AS c ON c.emp_no = a. emp_no 
AND (c.from_date = b.from_date OR c.from_date = b.from_date + INTERVAL '2 days') ORDER BY a.emp_no;