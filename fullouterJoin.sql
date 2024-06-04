
-- THIS RETURN RESULSTS FROM BOTH WHERER THEY MATCH OR NOT

-- What the fullouter join does is to return all the results from 
-- both sets wheter they match or not

CREATE TABLE "cartesianA"(id INT);
CREATE TABLE "cartesianB"(id INT);

INSERT INTO "cartesianA" VALUES (1);
INSERT INTO "cartesianA" VALUES (2);
INSERT INTO "cartesianA" VALUES (3);

INSERT INTO "cartesianB" VALUES (1);
INSERT INTO "cartesianB" VALUES (2);
INSERT INTO "cartesianA" VALUES (4);
INSERT INTO "cartesianA" VALUES (5);
INSERT INTO "cartesianB" VALUES (20);
INSERT INTO "cartesianB" VALUES (30);

-- Now let's generate the cartesian product

SELECT * FROM "cartesianA" AS a FULL JOIN "cartesianB" AS b ON a.id = b.id;
-- the command will return the data whether it is matching and data which don't 
-- match from both of the tables
