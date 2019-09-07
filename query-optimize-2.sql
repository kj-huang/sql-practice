USE sakila;

-- When to use Complex query vs Many queries?

-- ---------------------------------------------------------------
-- Example 1

SELECT *
FROM film f
INNER JOIN film_actor f2 ON f.film_id = f2.film_id
INNER JOIN film_category fc ON fc.film_id = f2.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

SELECT *
FROM film
WHERE film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

SELECT *
FROM film_actor
WHERE film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

SELECT *
FROM film_category
WHERE film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

-- Complex Query =
-- Multiple Query =

-- ---------------------------------------------------------------
-- Example 2

SELECT *
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id
INNER JOIN store s on i.store_id = s.store_id
INNER JOIN address a on s.address_id = a.address_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

SELECT *
FROM film
WHERE film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

SELECT *
FROM inventory
WHERE film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

SELECT *
FROM store
WHERE store_id IN(1,2);
SHOW STATUS LIKE 'Last_Query_Cost';

SELECT *
FROM address
WHERE address_id IN(1,2);
SHOW STATUS LIKE 'Last_Query_Cost';

-- Complex Query =
-- Multiple Query =