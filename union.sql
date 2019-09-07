-- UNION operator example

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
SELECT 2, 'Second - 2'
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

/* UNION ALL */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value
FROM table1 t1
UNION ALL
SELECT t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table2 t2;

/* UNION ALL */
-- ERROR
SELECT t1.ID AS T1ID
FROM table1 t1
UNION
SELECT t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table2 t2;

/* UNION */
-- ----------------------------------------
-- UNION ALL not select distinct
-- ----------------------------------------
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value
FROM table1 t1
UNION
SELECT t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table2 t2;

-- ----------------------------------------
-- Order by
-- ----------------------------------------
/* UNION ALL */
SELECT t1.ID AS T1ID,
       t1.Value AS T1Value
FROM table1 t1
UNION ALL
SELECT t2.ID AS T2ID,
       t2.Value AS T2Value
FROM table2 t2
ORDER BY T1Value DESC;

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