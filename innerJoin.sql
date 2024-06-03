--If you have columns that link to a column from another table, you can use an inner join.

/*
What the inner join does is to find the intersection of two data sets based on a
link and it returns you that subset.
*/

SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary
FROM employees as a INNER JOIN salaries as b ON b.emp_no = a.emp_no;

/*
The inner join syntax is generally considered a best practice,
It's more readable than using the where syntax,
It shows you what's being joined
It's great than using WHERE clause!
But the result always come unsorted as the SQL doesn't care about sorting
*/

SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary
FROM employees as a INNER JOIN salaries as b ON b.emp_no = a.emp_no ORDER BY a.emp_no ASC;

-- What if we want to join 3 tables and want to know the title of the promoted employees
-- and their title. Note that the title change always follows 2 days of raise

SELECT a.emp_no,
CONCAT(a.first_name, a.last_name) as "name",
b.salary, 
c.title,
c.from_date AS "promoted on" FROM  employees AS a 
INNER JOIN salaries AS b ON a.emp_no = b.emp_no
INNER JOINT titles AS c ON c.emp_no = a. emp_no
AND c.from_date = (b.from_date + interval '2 days') ORDER BY  a.emp_no;

-- --------------------------------------------------------------------------
-- the ON keyword used here replaces the WHERE clause  
SELECT a.emp_no, b.salary, b.from_date, c.title FROM  employees AS a 
INNER JOIN salaries AS b ON a.emp_no = b.emp_no
INNER JOIN titles AS c ON c.emp_no = a. emp_no ORDER BY a.emp_no ASC, b.from_date ASC;

--  ------------------------------------------------------------------------
 /* To find all employees who have been promoted in 2 days*/

SELECT a.emp_no, b.salary, b.from_date, c.title FROM  employees AS a 
INNER JOIN salaries AS b ON a.emp_no = b.emp_no
INNER JOIN titles AS c ON c.emp_no = a. emp_no ORDER BY a.emp_no ASC, b.from_date ASC;

--  ------------------------------------------------------------------------
 /* To find all employees who have been promoted in 2 days*/
SELECT a.emp_no, b.salary, b.from_date, c.title FROM  employees AS a 
INNER JOIN salaries AS b ON b.emp_no = a.emp_no
INNER JOIN titles AS c ON c.emp_no = a. emp_no AND (b.from_date + INTERVAL '2 days') = c.from_date ORDER BY a.emp_no ASC, b.from_date ASC;


-- PROBLEM -----
/*
What if you want to know the original salary and also know the salary at promotion
I can see the salary they started on and the salary they got after a raise and the title change
*/
SELECT a.emp_no, b.salary, b.from_date, c.title FROM  employees AS a 
INNER JOIN salaries AS b ON b.emp_no = a.emp_no
INNER JOIN titles AS c 
ON c.emp_no = a. emp_no 
AND (
b.from_date  = c.from_date
OR (b.from_date + INTERVAL '2 days') = c.from_date 
)
ORDER BY a.emp_no ASC, b.from_date ASC;

-- Note that the ON keyword is used in the place of WHERE clause
/* We can narrow down the matched data in the inner join in the ON clause
IT ID THE WAY WE CAN DETERMINE, HEY ONLY MATCH THE DATA WHEN THESE PARAMETERS ARE MEET


Joining the data also works as filter, we can join the data but structure the way the data will be


Note:  inner joins can become more complicated as you add more tables that you want to combine.

But we need to always ise inner join as a best practice.  the ON is where you start to link data together

