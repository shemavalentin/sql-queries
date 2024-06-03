-- SELECT emp_no as "employee #",birth_date as "Birthday", first_name as " First Name " FROM employees;
-- select emp_no as " Employee ID", title as " Title", from_date as " Prevous Promotion", to_date as " Current Promotion" from titles
-- SELECT count (emp_no) from employees
-- SELECT * from salaries
-- SELECT max(salary) from salaries;
-- SELECT avg(salary) from salaries;
-- SELECT * FROM employees
-- SELECT max(birth_date) from employees;

--filter on first name AND last name to limit the amout of fata returned  and focus
--the filtering onn a single person. 

select first_name, last_name from employees where first_name = 'Mayumi'  AND last_name = 'Schueller'; --Find here  Mayumi Schueller
-- Filtering
 select first_name, gender from employees where gender = 'F'
 select first_name, last_name,gender, hire_date from employees where first_name = 'Georgi' and gender = 'M'and hire_date = '1986-06-26' and last_name = 'Facello';
 select first_name, last_name,gender, hire_date from employees where first_name = 'Georgi' and gender = 'M'and hire_date = '1986-06-26' and last_name = 'Facello' and first_name = 'Bezelel';
-- use the OR 
SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE first_name = 'Georgi'
AND hire_date = '1986-06-26'
AND last_name = 'Facello'
OR first_name = 'Bezalel'
AND last_name = 'Simmel';

--Its better to use paranthesis () this helps to order operations. ORDER OF OPERATION
SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE ( first_name = 'Georgi' and hire_date = '1986-06-26' and last_name = 'Facello' )
OR ( first_name = 'Bezalel' and last_name = 'Simmel' );

SELECT
  first_name
FROM
  employees
WHERE first_name = 'Georgi'
OR first_name = 'Bezalel';

SELECT
  first_name,
  last_name
FROM
  users
WHERE first_name = 'Valentin'
OR first_name = 'Andrei';

-- Using IN  keyword  to filter values in shorthand
SELECT
  *
FROM
  employees
WHERE emp_no IN ( 100001,100006,11008 ) /*  PERTEN MATCHING */ -- Let's use LIKE keyword: this is used when we don't know what we are looking for.
-- For example when we don't know what we are looking for
-- Get everyone who's name start with 'V''
SELECT first_name from employees where first_name LIKE 'V%';

/*  CASTING => changing something from one data type to another */ --CAST(salary as text); or salary::text
/* Using keyword ILIKE *   => note that it is case insensitive */ --name ILIKE 'MO';
SELECT
  *
FROM
  employees
WHERE first_name LIKE 'A%R';

SELECT
  *
FROM
  employees
WHERE first_name Ilike 'A%R';

/* using DATE AND TIME */ --  SET TIME ZONE 'UTC';
-- always use UTC: Universal Time Cordinate 
-- even thogh it is one of the most hard in software development and in database management
-- we always have to use UTC as it is the standard and is universal
/*  TIME ZONR - TIME STAMP */

CREATE TABLE timezones
(
  ts TIMESTAMP WITHOUT TIME ZONE,
  tz TIMESTAMP WITH TIME ZONE
)
INSERT INTO timezones VALUES
(
  TIMESTAMP WITHOUT TIME ZONE '2000-01-01 10:00:00-05',
  TIMESTAMP WITH TIME ZONE '2000-01-01 10:00:00-05'
)
;

SELECT
  *
FROM
  timezones;

/*  we need to pay attention on storing data about time zones 
becouse it is alwayse advised to store these information correctly
you need to remembet to store the time zone

*/
SELECT
  now( )::date;

-- to know the today's date
SELECT CURRENT_DATE;

-- this also can work
-- And we can format the date to start by the day
SELECT TO_CHAR(CURRENT_DATE,'dd/mm/yyyy');

-- To know which week of the year we are on.
SELECT TO_CHAR(CURRENT_DATE,'ww');


/*DATES DIFFERENCE AND CASTING*/

select now() - '180/01/01';

-- When we calculate dates we need to cast it with dates otherwize it will error out. write the following query wothout a date key and see.
select AGE(date '1800-01-01');


-- The AGE  clause can take many parameters 
select AGE(date '1988/10/11',date '1800/01/01');

-- Extracting information; we can extract days in dates

SELECT EXTRACT (YEAR FROM date '1992/11/13') as YEAR;

SELECT EXTRACT (DAY FROM date '1992/11/13') as DAY;

SELECT EXTRACT (MONTH FROM date '1992/11/13') as MONTH;

-- What is if we need to ROUND DOWN OR UP (It will take down the given date to the first day of the first month of that year)
select  date_trunc( 'year', date '1992/11/13')

-- The same to month
select  date_trunc( 'month', date '1992/11/13');

-- Passing days
select  date_trunc('day', date '1992/11/13');


/*INTERVAL

Let's say we need to get the date of purchase in last 30 days

*/


SELECT * FROM orders where purchaseDate <= now() - interval '30 days';

SELECT * FROM orders where purchaseDate <= now() - interval '1 year 2 months 3 days';

SELECT * FROM orders where purchaseDate <= now() - interval '2 weeks ago';

SELECT * FROM orders where purchaseDate <= now() - interval '1 year 3 hours 20 minutes'

-- Can we EXTRACT with INTERVAL??
SELECT EXTRACT (year from interval '4 years 20 months');

-- It can store and manipulate a period of time in years, months, days, hours, minutes, seconds, etc.