-- UPDATE statement

USE sakila;

CREATE TABLE ActorSample(
  actor_id smallint(5) unsigned not null auto_increment,
  first_name varchar(45) not null,
  last_name varchar(45) null,
  last_update timestamp not null default current_timestamp
        on update current_timestamp,
  PRIMARY KEY (actor_id)
);

INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
SELECT first_name, last_name, last_update
FROM sakila.actor;

-- UPDATE single row single column
UPDATE sakila.ActorSample
SET first_name = 'Kevin'
WHERE actor_id = 1;

UPDATE sakila.ActorSample
SET last_name = 'Huang'
WHERE actor_id = 1;
-- check data
SELECT *
FROM sakila.ActorSample;

-- UPDATE single row multiple column
UPDATE sakila.ActorSample
SET first_name = 'Kevin', last_name = 'Huang'
WHERE actor_id = 2;
-- check data
SELECT *
FROM sakila.ActorSample;

-- UPDATE multiple row single column
UPDATE sakila.ActorSample
SET first_name = 'Kevin'
WHERE actor_id IN (3, 4, 5);
-- check data
SELECT *
FROM sakila.ActorSample;

-- UPDATE multiple row multiple column
UPDATE sakila.ActorSample
SET first_name = 'Kevin', last_name = 'Huang', last_update = DEFAULT
WHERE actor_id IN (6, 7, 8);
-- check data
SELECT *
FROM sakila.ActorSample;

-- UPDATE using SELECT Statement
-- ------------------------------------------------
-- This example is not a save update
-- ------------------------------------------------
UPDATE sakila.ActorSample
SET first_name = 'Kevin'
WHERE actor_id IN (SELECT actor_id
                  FROM film_actor
                  WHERE film_id = 1);
-- check data
SELECT *
FROM sakila.ActorSample;

-- ------------------------------------------------
-- Do House Keeping After the insert statement try
-- ------------------------------------------------
DROP TABLE ActorSample;