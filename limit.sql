-- Limit Keyword

SELECT *
FROM sakila.actor
ORDER BY actor_id;

SELECT *
FROM sakila.actor
ORDER BY actor_id
LIMIT 10;

-- ------------------------------------------------
-- LIMIT 15, 10 means start actor_id from 16,
-- and retrieve 10 rows.
-- ------------------------------------------------
SELECT *
FROM sakila.actor
ORDER BY actor_id
LIMIT 15, 10;
