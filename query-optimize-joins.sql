USE sakila;

-- Does the table order in join condition matter with different order

-- INNER JOIN
SELECT *
FROM film f
INNER JOIN film_actor f2 ON f.film_id = f2.film_id
INNER JOIN film_category fc ON fc.film_id = f2.film_id
WHERE f.film_id = 10;

SELECT *
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN film_actor fa ON fc.film_id = fa.film_id
WHERE f.film_id = 10;

SELECT *
FROM film_actor fa
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN film f ON fc.film_id = f.film_id
WHERE f.film_id = 10;

-- Explain

EXPLAIN SELECT *
FROM film f
INNER JOIN film_actor f2 ON f.film_id = f2.film_id
INNER JOIN film_category fc ON fc.film_id = f2.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

EXPLAIN SELECT *
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN film_actor fa ON fc.film_id = fa.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

EXPLAIN SELECT *
FROM film_actor fa
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN film f ON fc.film_id = f.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

-- Query Cost value are same: means that the inner join in different order will not effect the performance

-- OUTER JOIN
SELECT *
FROM film f
LEFT JOIN film_actor f2 ON f.film_id = f2.film_id
LEFT JOIN film_category fc ON fc.film_id = f2.film_id
WHERE f.film_id = 10;

SELECT *
FROM film f
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN film_actor fa ON fc.film_id = fa.film_id
WHERE f.film_id = 10;

SELECT *
FROM film_actor fa
LEFT JOIN film_category fc ON fa.film_id = fc.film_id
LEFT JOIN film f ON fc.film_id = f.film_id
WHERE f.film_id = 10;

-- Explain
EXPLAIN SELECT *
FROM film f
LEFT JOIN film_actor f2 ON f.film_id = f2.film_id
LEFT JOIN film_category fc ON fc.film_id = f2.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

EXPLAIN SELECT *
FROM film f
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN film_actor fa ON fc.film_id = fa.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';

EXPLAIN SELECT *
FROM film_actor fa
LEFT JOIN film_category fc ON fa.film_id = fc.film_id
LEFT JOIN film f ON fc.film_id = f.film_id
WHERE f.film_id = 10;
SHOW STATUS LIKE 'Last_Query_Cost';
-- OUTER JOIN Query Cost value are not same: means that the outer join in different order will effect the performance