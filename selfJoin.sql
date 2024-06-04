-- SELF JOIN: Joining a table to itself
/*This is unsual done but it occurs when a table has a foreign key
referencing its primary key 

Though this is not supper common but it can happen

What if we want to see the supervisors name (that is a foreign key in the table 
where there is a primary key)? Then we will run a query in the table containing these 
information.

Let's say you has 500000 employees and you had multiple levels of supervisors 
and you wanted to see the supervisor's name beside the person because you wantes to see who 
they report to.d

Well here is a solution ( self join )
*/

-- HOW IT IS DONE

SELECT a.id, a.name as "employee", b.name as "supervisor name" 
FROM employee as a, employee as b WHERE a.supervisorId = b.id;

-- This can also be done with INNER JOIN 

SELECT a.id, a.name as "employee", b.name as "supervisor name" 
FROM employee as a INNNER JOIN employee as b ON a.supervisorId = b.id;

--> Now a SELF JOIN is the same as INNER JOIN 
--> INNER JOINs are just joining data and trying tho find that middle intersection but a 
--> SELF JOIN is all about joining a table to itself because a primary key and foreiugn key are
--> in the same exact table 

-- This is a variant of inner join