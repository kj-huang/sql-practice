-- Displaying Index
-- ------------------------------------------------
-- Cardinality means that column has how many data
-- ------------------------------------------------
SHOW INDEX FROM film FROM sakila;
SHOW INDEX FROM film;

SELECT *
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'film';


-- Creating Index
CREATE INDEX idx_film_length ON film (length);

-- Creating Index
CREATE INDEX idx_film_length_desc ON film (length DESC);

-- Creating Index
CREATE INDEX idx_film_rental_duration ON film (rental_duration);

-- Creating Index
CREATE INDEX idx_film_rental_duration_length ON film (rental_duration,length);

-- Creating Index
CREATE INDEX idx_film_rental_duration_length ON film (length,rental_duration);

-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE rental_duration = 6;

-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE length = 100;

-- -------------------------------------------------------------------------
--  MySQL index usage based on where clause and pick the optimal index
-- -------------------------------------------------------------------------
-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE rental_duration = 6 OR length = 100;

-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE length = 100 OR rental_duration = 6;

-- -------------------------------------------------------------------------
--  Use UNION keyword to rewrite the OR operator
-- -------------------------------------------------------------------------
-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE length = 100
UNION
SELECT title, rental_duration, length
FROM film
WHERE rental_duration = 6;

-- -------------------------------------------------------------------------
--  AND operator indexing
-- -------------------------------------------------------------------------
-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE rental_duration = 6 AND length = 100;

-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE length = 100 AND rental_duration = 6;

-- -------------------------------------------------------------------------
--  Column swap would not effect the search efficiency
-- -------------------------------------------------------------------------
-- SELECT Statement
EXPLAIN SELECT title, length, rental_duration
FROM film
WHERE length = 100 AND rental_duration = 6;

-- -------------------------------------------------------------------------
--  WHERE order swap would not effect the search efficiency
-- -------------------------------------------------------------------------
-- SELECT Statement
EXPLAIN SELECT title, length, rental_duration
FROM film
WHERE rental_duration = 6 AND length = 100;

-- DROP Index
DROP INDEX idx_film_length ON film;
DROP INDEX idx_film_length_desc ON film;
DROP INDEX idx_film_rental_duration ON film;
DROP INDEX idx_film_rental_duration_length ON film;