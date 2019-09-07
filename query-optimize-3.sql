USE sakila;

-- Retrieve all columns of the table film where length is less than 80 minutes

-- ------------------------------------------------------------------------
-- Break single query from big to small
-- ------------------------------------------------------------------------

SELECT *
FROM film
WHERE length < 80;

EXPLAIN SELECT *
FROM film
WHERE length < 80;

CREATE INDEX idx_film_length ON film (length);

EXPLAIN SELECT *
FROM film
WHERE length < 80;

--
-- ------------------------------------------------------------------------
-- magic number 61 is a try and error result
-- ------------------------------------------------------------------------

EXPLAIN SELECT *
FROM film
WHERE length < 61;
SHOW STATUS LIKE 'Last_Query_Cost';

EXPLAIN SELECT *
FROM film
WHERE length >= 61 AND length <=79;
SHOW STATUS LIKE 'Last_Query_Cost';

DROP INDEX idx_film_length ON film;