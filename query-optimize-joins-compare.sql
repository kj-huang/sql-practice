USE sakila;

-- What is the most optimal way to write queries - Subquery vs Exists vs Joins?

SELECT *
FROM film f
WHERE f.film_id IN (
SELECT i.film_id
FROM inventory i
WHERE inventory_id < 555);

EXPLAIN SELECT *
FROM film f
WHERE f.film_id IN (
SELECT i.film_id
FROM inventory i
WHERE inventory_id < 555);

-- Exists
SELECT *
FROM film f
WHERE EXISTS (
SELECT i.film_id
FROM inventory i
WHERE inventory_id < 555 AND i.film_id = f.film_id);

EXPLAIN SELECT *
FROM film f
WHERE EXISTS (
SELECT i.film_id
FROM inventory i
WHERE inventory_id < 555 AND i.film_id = f.film_id);

-- Joins
SELECT DISTINCT f.*
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id
WHERE inventory_id < 555;

EXPLAIN SELECT DISTINCT f.*
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id
WHERE inventory_id < 555;

-- Stored Procedures Performance test
CREATE TABLE `filmcopy` (
  `film_id` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `rental_rate` decimal(4,2) NOT NULL DEFAULT '4.99',
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) NOT NULL DEFAULT '19.99',
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;


delimiter //
CREATE PROCEDURE SubQ(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN
		INSERT INTO `sakila`.`filmcopy`
		(`film_id`,
		`title`,
		`description`,
		`release_year`,
		`language_id`,
		`original_language_id`,
		`rental_duration`,
		`rental_rate`,
		`length`,
		`replacement_cost`,
		`rating`,
		`special_features`,
		`last_update`)
		SELECT *
		FROM film f
		WHERE f.film_id IN (
		SELECT i.film_id
		FROM inventory i
		WHERE inventory_id < 555);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;

-- Loop to write
delimiter //
CREATE PROCEDURE ExistQ(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN
		INSERT INTO `sakila`.`filmcopy`
		(`film_id`,
		`title`,
		`description`,
		`release_year`,
		`language_id`,
		`original_language_id`,
		`rental_duration`,
		`rental_rate`,
		`length`,
		`replacement_cost`,
		`rating`,
		`special_features`,
		`last_update`)
		SELECT *
		FROM film f
		WHERE EXISTS (
		SELECT i.film_id
		FROM inventory i
		WHERE inventory_id < 555
		AND i.film_id = f.film_id);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;

-- Loop to write
delimiter //
CREATE PROCEDURE JoinQ(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN
		INSERT INTO `sakila`.`filmcopy`
		(`film_id`,
		`title`,
		`description`,
		`release_year`,
		`language_id`,
		`original_language_id`,
		`rental_duration`,
		`rental_rate`,
		`length`,
		`replacement_cost`,
		`rating`,
		`special_features`,
		`last_update`)
		SELECT DISTINCT f.*
		FROM film f
		INNER JOIN inventory i ON i.film_id = f.film_id
		WHERE inventory_id < 555;
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;

-- Execution Test

CALL SubQ(1000);
SHOW STATUS LIKE 'Last_Query_Cost';
TRUNCATE TABLE `sakila`.`filmcopy`;

CALL ExistQ(1000);
TRUNCATE TABLE `sakila`.`filmcopy`;

CALL JoinQ(1000);


-- Clean up
DROP PROCEDURE ExistQ;
DROP PROCEDURE SubQ;
DROP PROCEDURE JoinQ;
DROP TABLE `sakila`.`filmcopy`;

-- ----
-- small columns performance test
-- --

-- Stored Procedures Performance test
CREATE TABLE `sakila`.`inventorycopy` (
  `inventory_id` mediumint(8),
  `film_id` smallint(5) NOT NULL,
  `store_id` tinyint(3) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);


delimiter //
CREATE PROCEDURE SubQ(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN
		INSERT INTO `sakila`.`inventorycopy`
		(`inventory_id`,
		`film_id`,
		`store_id`,
		`last_update`)
		SELECT *
		FROM inventory i
		WHERE i.film_id IN (
		SELECT f.film_id
		FROM film f
		WHERE f.length < 55);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;

-- Loop to write
delimiter //
CREATE PROCEDURE ExistQ(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN
		INSERT INTO `sakila`.`inventorycopy`
		(`inventory_id`,
		`film_id`,
		`store_id`,
		`last_update`)
		SELECT *
		FROM inventory i
		WHERE EXISTS (
		SELECT f.film_id
		FROM film f
		WHERE f.length < 55
		AND i.film_id = f.film_id);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;

-- Loop to write
delimiter //
CREATE PROCEDURE JoinQ(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 - 1;
    IF p1 > 0 THEN
		INSERT INTO `sakila`.`inventorycopy`
		(`inventory_id`,
		`film_id`,
		`store_id`,
		`last_update`)
		SELECT i.*
		FROM inventory i
		INNER JOIN film f ON i.film_id = f.film_id
		WHERE f.length < 55;
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
END//
delimiter ;

-- Execution Test

CALL SubQ(1000);
TRUNCATE TABLE `sakila`.`filmcopy`;

CALL ExistQ(1000);
TRUNCATE TABLE `sakila`.`filmcopy`;

CALL JoinQ(1000);

-- Clean up
DROP PROCEDURE ExistQ;
DROP PROCEDURE SubQ;
DROP PROCEDURE JoinQ;
DROP TABLE `sakila`.`inventorycopy`;