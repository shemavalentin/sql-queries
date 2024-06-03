-- SELECT firstname, lastname, gender,state from customers where state = 'OR' and gender= 'F' or state = 'NY' and gender = 'F';

--  To simplify things we can write thid query like the following 

SELECT firstname, lastname, gender,state from customers where (state = 'OR' or state = 'NY') and gender = 'F';

-- by using the count command
SELECT COUNT(firstname)from customers where (state = 'OR' or state = 'NY') and gender = 'F';

-- Filtering using NOT  keyword

select COUNT (age) from customers where NOT  age = 55 and not 
age = 20;

select * from customers where customerid in(7888,1082,12808,9623);

-- to find how many records stats with 2 and have 1 at the third number
select count(zip) from customers WHERE zip::text like '2_1%'


select coalesce(state, 'No State') as "State" from customers where phone::text like '302%'; 

SELECT * FROM orders where purchaseDate <= now() - interval '30 days';