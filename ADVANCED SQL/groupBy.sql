/*  ----- GROUP BY ------------
Here come an interesting query that is used to group data by groups
let's say logical groups, department by salary, category by gender

This query is mostly used when SUMMARIZING OR AGGREGATING DATA BY GROUPS

It allows us to group data into logical backets 

So, why do we need to group data? 

 ==>  The answer is to get in depth information by group.
*/

/* WHAT IF WE WANTED TO KNOW HOW MANY EMPLOYEES WORKED IN EACH DEPARTMENT?
HOW WOULD WE DO THAT?  It sounds somehow confusing
*/

--- SYNTHAX

SELECT dept_no, COUNT(emp_no) FROM dept_emp;  -- This will raise an error

--  we need to use MIN, SUM, MAX RETURN 1 RECORD and these like aggregate data.
-- So, if they are returning 1 record what is GROUP BY for?
-- we need to group these data by the mentioned column in the error

/*
GROUP BY SPOITS DATA INTO GROUPS OR CHINKS SO WE CAN APPLY FUNCTIONS AGAIONST THE 
GROUP RATHER THAN THE INTIRE TABLE
*/

SELECT dept_no FROM dept_emp ORDER BY dept_no;

--  Then group by dept_no 

SELECT dept_no FROM dept_emp GROUP BY dept_no; 

-- Then what is the power of this GROUP BY?
-- Thr purpose of it is to run functions against some other part of the data 
-- we really want to run a function

-- For example if we need to count employees in each department 

SELECT dept_no, COUNT(emp_no) FROM dept_emp GROUP BY dept_no;


-- We use group by almost exclusively woth aggregate functions

-- When we GROUP BY we apply the function per group, not on the entire data set


-- THINGS TO REMEMBER 

--> Every column not in the group-by clause must apply a function.

-- WHY? This query??

--> To reduce all records found for the matching ' Group' to a single record.

         -- HOW DOES IT WORK?
        
--  GROUP BY UTILIZES A SPLIT-APPLY-COMBINE STRATEGY

--> we always apply aggregate functions( min, max, count,...) which produce a single output on 
 -- a set and then combine the groups with the singular output

 -- we split by the groups, we apply an aggregate function to the columns we want they generate a summed single output
 -- , then combine to generate a singular out put.


/* SUMMARY*/

-- SPLIT PHASE:  devide into groups with values 
-- APPLY PHASE:  apply aggregate function against ungrouped columns the ones that we specify
-- COMBINE PHASE: combines groups with a single value into single value
              -- Now what does this mean?  it means,the sql engine is going to say hey, I haave
              -- this group B I have this group C and I have all of these things I applied an 
              -- aggregate function to that also outputted a single value and now I'm going to
              -- visualize group value, Group value, Group value 


/* ORDER OF OPERATIONS*/

-- this is how sql does things

--  FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY

        

