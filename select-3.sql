-- Retrieve results based on function

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.payment;

-- ----------------------------------------
-- Integer operations
-- ----------------------------------------

SELECT amount,
       ROUND(amount) Amnt,
       ROUND(amount, 1) Amnt1,
       FLOOR(amount) FloorAmnt,
       CEILING(amount) CeilingAmnt
FROM sakila.payment;


-- ----------------------------------------
-- String operations
-- ----------------------------------------
-- Concat
SELECT CONCAT(first_name, ' ', last_name) AS FullName
FROM sakila.actor;

-- LEFT function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       CONCAT(LEFT(first_name, 1), ' ', LEFT(last_name, 1)) AS FirstInitial
FROM sakila.actor;

-- Length function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       LENGTH(CONCAT(first_name, ' ', last_name)) AS Length,
       CONCAT(LEFT(first_name, 1), ' ', LEFT(last_name, 1)) AS FirstInitial
FROM sakila.actor;

-- Various Function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       REVERSE(CONCAT(first_name, ' ', last_name)) AS ReverseFullName,
       REPLACE(CONCAT(first_name, ' ', last_name), 'S', '$') AS ReplaceExample
FROM sakila.actor;


-- ----------------------------------------
-- Date operations
-- ----------------------------------------
-- DATE_FORMAT function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       DATE_FORMAT(last_update, '%m/%d/%y') AS LastUpdate1,
       DATE_FORMAT(last_update, '%d-%m-%Y') AS LastUpdate2,
       DATE_FORMAT(last_update, '%d %b %Y %T:%f') AS LastUpdate3
FROM sakila.actor;

-- DATE_FORMAT with GET_FORMAT function
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       DATE_FORMAT(last_update, GET_FORMAT(DATETIME, 'EUR')) AS LastUpdate1,
       DATE_FORMAT(last_update, GET_FORMAT(DATETIME, 'ISO')) AS LastUpdate2,
       DATE_FORMAT(last_update, GET_FORMAT(DATETIME, 'USA')) AS LastUpdate3
FROM sakila.actor;

-- Other function
SELECT rental_date,
       DAYOFWEEK(rental_date) AS DayOfWeek,
       QUARTER(rental_date) AS Quarter,
       WEEK(rental_date) AS Week,
       MONTHNAME(rental_date) AS MonthName
FROM sakila.rental;


-- ----------------------------------------
-- DISTINCT Operation
-- ----------------------------------------

SELECT first_name
FROM sakila.actor;

SELECT DISTINCT first_name
FROM sakila.actor;

SELECT last_name
FROM sakila.actor;

SELECT DISTINCT last_name
FROM sakila.actor