USE sakila;

EXPLAIN
SELECT *
FROM actor
INNER JOIN film_actor fa ON actor.actor_id = fa.actor_id;

SHOW WARNINGS;