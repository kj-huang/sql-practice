/*
A stored procedure is a subroutine available to applications that access a relational database system  
A Stored Procedure contains one or more SQL statements stored in the database  
Typical used for Data Validation as well Access Control Methods  
A Stored Procedure is often called a sproc or procedure  
Parameters are used to pass one or more values from calling program
*/

-- ------------------------------------------------------------
-- Create first store procedure
-- ------------------------------------------------------------

SELECT * FROM sakila.language;

-- Change Delimiter is required for creating store procedure
DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE GetLanguage()
BEGIN
	SELECT * FROM language;
END //
-- Change Delimiter again
DELIMITER ;

-- Call store procedure
CALL GetLanguage();

DROP PROCEDURE GetLanguage;

-- ------------------------------------------------------------
-- Create multiple result set with store procedure
-- ------------------------------------------------------------

-- Change Delimiter is required for creating store procedure
DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE WhileLoop()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i < 6 DO
		SELECT POW(i,i);
		SET i = i + 1;
	END WHILE;
END //
-- Change Delimiter again
DELIMITER ;

-- Call store procedure
CALL WhileLoop();

DROP PROCEDURE WhileLoop;

-- ------------------------------------------------------------
-- Store procedure with parameters
-- ------------------------------------------------------------

-- Change Delimiter is required for creating store procedure
DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE ConcatName(FirstName VARCHAR(100), LastName VARCHAR(100))
BEGIN
	DECLARE FullName VARCHAR(200);
	SET FullName = CONCAT(FirstName, ' ', LastName);
	SELECT FullName;
END //
-- Change Delimiter again
DELIMITER ;

-- Call store procedure
CALL ConcatName('Kevin', 'Huang');

DROP PROCEDURE ConcatName;

-- ------------------------------------------------------------
-- Store procedure with parameters-2
-- ------------------------------------------------------------
SELECT * FROM language;
-- Change Delimiter is required for creating store procedure
DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE InsertValue(NameofLang VARCHAR(100))
BEGIN
	INSERT INTO language(name, last_update)
	VALUES (NameofLang, NOW());

	SELECT LAST_INSERT_ID();
END //
-- Change Delimiter again
DELIMITER ;

-- Call store procedure
CALL InsertValue('Korean');
CALL InsertValue('Chinese');

SELECT * FROM language;

DROP PROCEDURE InsertValue;

-- ------------------------------------------------------------
-- Store procedure with INPUT and OUTPUT parameters
-- ------------------------------------------------------------
SELECT * FROM language;
DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE InsertValue(
	IN NameofLang VARCHAR(100),
	OUT LangID int
)
BEGIN
	INSERT INTO language(name, last_update)
	VALUES (NameofLang, NOW());

	SET LangID = LAST_INSERT_ID();
END //
-- Change Delimiter again
DELIMITER ;

-- Call store procedure
CALL InsertValue('Korean', @LangID);
SELECT CONCAT('Last Language ID is: ', @LangID);

SELECT * FROM language;

DROP PROCEDURE InsertValue;

-- ------------------------------------------------------------
-- Store procedure DROP and CREATE
-- ------------------------------------------------------------
DELIMITER //

DROP PROCEDURE IF EXISTS GetLanguage//

CREATE PROCEDURE GetLanguage()
BEGIN
	SELECT * FROM language;
END //
-- Change Delimiter again
DELIMITER ;

-- Call store procedure
CALL GetLanguage();

DROP PROCEDURE GetLanguage;