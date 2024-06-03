-- Normally Relational Databases don't care about sorting.
-- we sort data with ORDER BY Command
-- sorting data either ascending or descending by column

 SELECT * FROM CUSTOMERS ORDER BY <column> [ASC/DESC]

--  Examples --

SELECT * FROM customers ORDER BY  name ASC;

SELECT * FROM customers ORDER BY name, last_name DESC;

-- Techincally speaking, when you don't give an identifier on the first column (Asc, or Desc) it takes the first column
-- assign it with ASC and the one you specified affect the right most column like the following '

SELECT first_name, last_name from employees order by first_name, last_name DESC;

-- the above will yields the same result

SELECT first_name, last_name from employees order by first_name ASC, last_name DESC;

-- the identifier  is linked to the column specified right beside it.

SELECT first_name, last_name from employees order by first_name DESC, last_name DESC;

-- We can also order by the length of the name or word by using the identifier LENGHT

SELECT * FRom customers order by LENGTH(name)

SELECT first_name, last_name from employees order by LENGTH (first_name) DESC;



