/*
A Stored Function is an executable database object with SQL procedural code  
A Stored Function is often called a User Defined Functions (UDF) or just a function  
A function can’t modify or change anything in the database by executing INSERT, UPDATE or DELETE statements  
The code to call Stored Functions is similar to built-in functions  
MySQL supports a scalar functions, which returns a single value
*/

USE sakila;

-- ------------------------------------------------------------------------------------------------------------------------
-- Solve 1418 (HY000) Error
-- This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled
-- https://stackoverflow.com/questions/26015160/deterministic-no-sql-or-reads-sql-data-in-its-declaration-and-binary-logging-i
-- ------------------------------------------------------------------------------------------------------------------------
SET GLOBAL log_bin_trust_function_creators = 1;

/* Simple function demo */
-- Change Delimiter
DELIMITER //
-- Create Function
CREATE FUNCTION GetLanguage(lang_id INT)
	RETURNS VARCHAR(100)
	BEGIN
		DECLARE LangName VARCHAR(100);

		SELECT name
		INTO LangName
		FROM language
		WHERE language_id = lang_id;

		RETURN(LangName);
	END //
-- Change Delimiter
DELIMITER ;

-- Call Function
SELECT GetLanguage(1);
SELECT GetLanguage(2);
SELECT GetLanguage(3);
SELECT GetLanguage(4);

-- ------------------------------------------------------------
-- We can create function to aggregate different
-- things into table easily
-- ------------------------------------------------------------
SELECT title, language_id, GetLanguage(language_id)
FROM film;

SELECT title, language_id, GetLanguage(language_id)
FROM film
WHERE GetLanguage(language_id) = 'Italian';

DROP FUNCTION GetLanguage;

/* Function with aggregate demo */
-- Change Delimiter
DELIMITER //
-- Create Function
CREATE FUNCTION RentalCountsbyCust(cust_id INT)
	RETURNS INT
	BEGIN
		DECLARE RentalCounts INT;

		SELECT COUNT(*) NoRentals
		INTO RentalCounts
		FROM rental
		WHERE customer_id = cust_id;

		RETURN(RentalCounts);
	END //
-- Change Delimiter
DELIMITER ;

-- Call function
SELECT first_name, last_name, RentalCountsbyCust(customer_id) TotalMovieRented
FROM customer;

DROP FUNCTION RentalCountsbyCust;