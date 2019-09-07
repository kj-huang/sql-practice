-- String Functions

-- ASCII - Return numeric value of left-most character
SELECT ASCII('a'), ASCII('A');

-- CHAR() - Return the character for each integer passed
SELECT CHAR(77,121,83,81,76);
SELECT CHAR(65);

-- LENGTH() - Return the length of a a string in bytes
SELECT LENGTH('SQLAuthority'), LENGTH('SQLAuthority  ');

-- CONCAT() - Return concatenated string
SELECT CONCAT('Kevin', 'Huang', 'Good');
-- ----------------------------------------------------------------
-- CONCAT() with NULL will return the entire result set as NULL
-- ----------------------------------------------------------------
SELECT CONCAT('Kevin', NULL, 'Good');

-- LCASE() - Return the argument in lowercase - Synonym for LOWER()
SELECT LCASE('SQLAuthority'), LOWER('KeVin');

-- UCASE() - Return the argument in uppercase - Synonym for UPPER()
SELECT UCASE('SQLAuthority'), UPPER('KeVin');

-- LEFT() - Return the leftmost number of characters as specified
SELECT LEFT('SQLAuthority', 4), LEFT('Kevin', 3);

-- RIGHT() - Return the rightmost number of characters as specified
SELECT RIGHT('SQLAuthority', 4), RIGHT('Kevin', 3);


-- --------------------------------------
-- USE LENGTH to check the string trim
-- --------------------------------------
SELECT LENGTH('SQLAuthority');
-- RTRIM() - Remove trailing spaces
SELECT RTRIM('    SQLAuthority      '), LENGTH(RTRIM('    SQLAuthority      '));

-- LTRIM() - Remove leading spaces
SELECT LTRIM('    SQLAuthority      '), LENGTH(LTRIM('    SQLAuthority      '));

-- TRIM() - Remove leading and trailing spaces
SELECT TRIM('SQLAuthority'), LENGTH(TRIM('    SQLAuthority      '));

-- STRCMP() - Return 0 if the strings are the same
-- -1 if the first argument is smaller than the second according to the current strings
-- 1 if the first argument is larger than the second according to the current strings

SELECT STRCMP('MySQLAuthority', 'SQLAuthority'),
			 STRCMP('SQLAuthority', 'MySQLAuthority'),
			 STRCMP('MySQLAuthority', 'MySQLAuthority');


-- REVERSE() - Reverse the characters in a string
SELECT REVERSE('SQLAuthority');

-- Table Column
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name,
			 REVERSE(CONCAT(first_name, ' ', last_name))  AS RFull_Name
FROM sakila.actor;