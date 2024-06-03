-- When using the DISTINCT keyword, you can give it one or multuple columns and it will evaluate 
-- based on the combination of columns and so it will remove any column that seemingly has the same
-- value if you used 

SELECT DISTINCT salary FROM salaries;

SELECT DISTINCT salary, from_date FROM salaries;

-- 
-- selecting unique titles do we have
SELECT DISTINCT titles from titles;

select DISTINCT birth_date from employees;

SELECT DISTINCT lifeexpectancy from country;

