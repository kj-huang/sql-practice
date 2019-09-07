-- JOIN Operators

-- Create Table 1

USE sakila;

CREATE TABLE table1(
  ID INT,
  Value VARCHAR(10)
);

INSERT INTO table1 (ID, Value)
SELECT 1, 'First'
UNION ALL
SELECT 2, 'Second'
UNION ALL
SELECT 3, 'Third'
UNION ALL
SELECT 4, 'Fourth'
UNION ALL
SELECT 5, 'Fifth';

-- Create Table 2
CREATE TABLE table2(
  ID INT,
  Value VARCHAR(10)
);

INSERT INTO table2 (ID, Value)
SELECT 1, 'First'
UNION ALL
SELECT 2, 'Second-2'
UNION ALL
SELECT 3, 'Third'
UNION ALL
SELECT 6, 'Fourth'
UNION ALL
SELECT 7, 'Seventh'
UNION ALL
SELECT 8, 'Eighth';

SELECT *
FROM table1;

SELECT *
FROM table2;

/* INNER JOIN */
-- ------------------------------------------------------------
-- Intersection
-- ------------------------------------------------------------
SELECT t1.*, t2.*
FROM table1 t1
INNER JOIN table2 t2 ON t1.ID = t2.ID;

/* INNER JOIN */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
INNER JOIN table2 t2 ON t1.ID = t2.ID;

/* LEFT JOIN */
-- ------------------------------------------------------------
-- Normal we use left join
-- because we developer programming from left to right
-- ------------------------------------------------------------
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
LEFT JOIN table2 t2 ON t1.ID = t2.ID;

/* RIGHT JOIN */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.ID = t2.ID;

/* FULL OUTER JOIN */
-- --------------------------------------------------------------
-- MySQL not support this keywords
-- We use left join union right join to simulate full outer join
-- --------------------------------------------------------------
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
LEFT JOIN table2 t2 ON t1.ID = t2.ID
UNION
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.ID = t2.ID;

/* CROSS JOIN */
-- --------------------------------------------------------------
-- result is cartesian product
-- --------------------------------------------------------------
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
CROSS JOIN table2 t2;

/* SELF JOIN (TODO) */
-- --------------------------------------------------------------
-- use alias to create two different but source are the same table
-- --------------------------------------------------------------
SELECT t1.*, t2.*
FROM table1 t1
INNER JOIN table1 t2 ON t1.ID = t2.ID;

/* NATURAL JOIN */
-- --------------------------------------------------
-- We join the tables with those based on
-- all the columns in the tables with the same name
-- --------------------------------------------------
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
NATURAL JOIN table2 t2;

/* NATURAL LEFT JOIN */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
NATURAL LEFT JOIN table2 t2;

/* INNER JOIN - USING */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
INNER JOIN table2 t2 USING(ID);

/* INNER JOIN - USING */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
INNER JOIN table2 t2 USING(ID, Value);

/* LEFT JOIN - USING */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value,
       t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table1 t1
LEFT JOIN table2 t2 USING(ID, Value);

-- ------------------------------------------------
-- Do House Keeping After the insert statement try
-- ------------------------------------------------
DROP TABLE table1;
DROP TABLE table2;