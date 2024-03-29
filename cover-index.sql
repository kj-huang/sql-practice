-- Cover Index
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
CREATE INDEX idx_film_length_rental_duration ON film (length,rental_duration);

-- Creating Index
CREATE INDEX idx_film_length_rental_duration_title ON film (length,rental_duration, title);

-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE rental_duration = 6 AND length = 100;

-- SELECT Statement
EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE length = 100
UNION
SELECT title, rental_duration, length
FROM film
WHERE rental_duration = 6;

-- SELECT Statement
EXPLAIN SELECT *
FROM film
WHERE rental_duration = 6 AND length = 100;

-- DROP Index
DROP INDEX idx_film_length ON film;
DROP INDEX idx_film_length_desc ON film;
DROP INDEX idx_film_rental_duration ON film;
DROP INDEX idx_film_rental_duration_length ON film;
DROP INDEX idx_film_length_rental_duration_title ON film;