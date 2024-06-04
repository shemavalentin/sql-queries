-- these are the Joins commands that are not often used but cana be used sometimes

-- 1.  CROSS JOIN

--  it creates a combination of every row with every othwer row
-- For example if you had 1,2,3,4 and you had 1,2 you are basically going to create a table
-- that is going to add every row from table B with every row from table A.

-- We call this a CARTISIAN product : this is a combination of every thing with every thing from another table/set

-- After the combination what you are going to see a very very big data set.

CREATE TABLE "cartesianA"(id INT);
CREATE TABLE "cartesianB"(id INT);

INSERT INTO "cartesianA" VALUES (1);
INSERT INTO "cartesianA" VALUES (2);
INSERT INTO "cartesianA" VALUES (3);

INSERT INTO "cartesianB" VALUES (1);
INSERT INTO "cartesianB" VALUES (2);

-- Now let's generate the cartesian product

SELECT * FROM "cartesianA" CROSS JOIN "cartesianB" -- it will produce 1,1 1,2  2,1  2,2 ...




