-- WHERE clause Comparison Operators

-- Equals(=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id = 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick';

-- Less then(<)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name < 'Nick';

-- Greater then(>)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id > 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name > 'Nick';

-- Less then or Equal to(<=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name <= 'Nick';

-- Greater then or Equal to(>=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id >= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name >= 'Nick';

-- Not equal (<> or !=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name != 'Nick';


-- AND
SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 AND last_name = 'TORN';

-- OR
SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100;

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR actor_id < 100 OR last_name = 'TEMPLE';

-- NOT
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT actor_id = 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 100;


-- ALL together
-- ------------------------------------
-- AND has precedence over OR
-- ------------------------------------
SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND actor_id < 100 OR last_name = 'TEMPLE';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR last_name = 'TEMPLE' AND actor_id < 100;

SELECT *
FROM sakila.actor
WHERE (first_name = 'KENNETH' AND actor_id < 100) OR last_name = 'TEMPLE';

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' AND (actor_id < 100 OR last_name = 'TEMPLE');

SELECT *
FROM sakila.actor
WHERE first_name = 'KENNETH' OR last_name = 'TEMPLE' AND actor_id < 100;