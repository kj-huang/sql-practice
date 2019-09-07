-- Query Optimize

USE sakila;

-- ----
-- Retrieve film table with length less 50 minutes
-- ----
SELECT *
FROM film
WHERE length < 50;

EXPLAIN SELECT *
FROM film
WHERE length < 50;

CREATE INDEX idx_film_length ON film (length);

EXPLAIN SELECT *
FROM film
WHERE length < 50;

EXPLAIN SELECT *
FROM film
WHERE length < 100;

EXPLAIN SELECT film_id, length
FROM film
WHERE length < 100;

DROP INDEX idx_film_length ON film;