
-- SQL is a data navigator, it helps us to answer questions asked by our boss or customers.

-- Now let's ask a question: Get me the most recent date that they got s salary bump.
-- How do we go about that?


-- fist step to figure out 
SELECT emp_no, salary, from_date FROM salaries;

-- second step to figure out 
SELECT emp_no, salary, MAX(from_date)
FROM salaries
GROUP BY emp_no, salary;

-- There are limitations to do get an answer in one query. But there are techniques and ways
-- that we will learn down the line of how to re use that and chain it on to do other things.

/*
We really need to take the data got as an answer from one query and chain it with onother
query to reproduce an answer. Actuallu once we get data back, we can take that data and do other things.

We just don't have this techniques yet?  That's where we have to learn this mental model of grouping
and retrieving data back.

// We need to understand that when we get a result, that result, that subset ofdata that we're getting back 
we can reuse later on.



*/