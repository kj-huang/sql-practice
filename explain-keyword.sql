USE sakila;

/*
  Column Return By EXPLAIN
  id:
  select_type:
  table:
  partitions:
  type:
  possible_keys:
  key:
  key_len:
  ref:
  rows:
  filtered:
  Extra:
*/

EXPLAIN SELECT *
FROM actor;

-- --
-- Two tables will return two rows.
-- --
EXPLAIN SELECT *
FROM actor
CROSS JOIN address;

EXPLAIN SELECT *
FROM actor
INNER JOIN film_actor fa ON actor.actor_id = fa.actor_id;