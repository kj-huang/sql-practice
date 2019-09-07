-- Cluster Index
USE sakila;

CREATE TABLE TestTable(
  ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(64) NOT NULL DEFAULT '',
  LastName VARCHAR(64) NOT NULL DEFAULT '',
  FullName VARCHAR(128) NOT NULL DEFAULT '',
  PRIMARY KEY (ID),
  KEY ix_TestTable_FN_LN (FirstName, LastName)
);

EXPLAIN TestTable;

-- Populate Table
INSERT INTO TestTable(FirstName, LastName, FullName)
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name)
FROM actor;

-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------
-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
ORDER BY ID;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
ORDER BY FirstName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
ORDER BY LastName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
ORDER BY FullName;

-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------
-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE ID = 100;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE ID = 100
ORDER BY FirstName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE ID = 100
ORDER BY LastName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE ID = 100
ORDER BY FullName;
-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------
-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE FirstName = 'ALBERT';

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE FirstName = 'ALBERT'
ORDER BY FirstName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE FirstName = 'ALBERT'
ORDER BY LastName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE FirstName = 'ALBERT'
ORDER BY FullName;
-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------
-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE LastName = 'GRANT';

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE LastName = 'GRANT'
ORDER BY FirstName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE LastName = 'GRANT'
ORDER BY LastName;

-- Select Statement
EXPLAIN SELECT FirstName, LastName
FROM TestTable
WHERE LastName = 'GRANT'
ORDER BY FullName;
-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------

-- Clean Up
DROP TABLE TestTable;