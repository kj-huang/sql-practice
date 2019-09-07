-- DELETE statement

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

-- DELETE single row
DELETE
FROM sakila.ActorSample
WHERE actor_id = 1;
-- check data
SELECT *
FROM sakila.ActorSample;


-- DELETE multiple rows
DELETE
FROM sakila.ActorSample
WHERE actor_id IN (3, 4, 5);
-- check data
SELECT *
FROM sakila.ActorSample;

-- DELETE using SELECT Statement
DELETE
FROM sakila.ActorSample
WHERE actor_id IN (SELECT actor_id
                  FROM film_actor
                  WHERE film_id = 1);
-- check data
SELECT *
FROM sakila.ActorSample;

-- DELETE all rows from table
DELETE
FROM sakila.ActorSample;
-- check data
SELECT *
FROM sakila.ActorSample;

-- ------------------------------------------------
-- Do House Keeping After the insert statement try
-- ------------------------------------------------
DROP TABLE ActorSample;