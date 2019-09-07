-- INSERT statement

USE sakila;

CREATE TABLE ActorSample(
  actor_id smallint(5) unsigned not null auto_increment,
  first_name varchar(45) not null,
  last_name varchar(45) null,
  last_update timestamp not null default current_timestamp
        on update current_timestamp,
  PRIMARY KEY (actor_id)
);

-- INSERT single row
INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
VALUES('Kevin', 'Huang', '1995-11-14');
-- check data
SELECT *
FROM sakila.ActorSample;

-- INSERT single row
INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
VALUES('Ken', 'Huang', '1998-11-04');
-- check data
SELECT *
FROM sakila.ActorSample;

-- INSERT single row
INSERT INTO sakila.ActorSample (first_name, last_name)
VALUES('Kevin', 'Huang');
-- check data
SELECT *
FROM sakila.ActorSample;

-- INSERT single row
INSERT INTO sakila.ActorSample (first_name)
VALUES('Kevin');
-- check data
SELECT *
FROM sakila.ActorSample;

-- INSERT single row
-- Error
INSERT INTO sakila.ActorSample (last_name)
VALUES('Huang');
-- check data
SELECT *
FROM sakila.ActorSample;

-- INSERT single row
INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
VALUES('Kevin', NULL, DEFAULT);
-- check data
SELECT *
FROM sakila.ActorSample;


-- ------------------------------------------------
-- INSERT multiple Values
-- ------------------------------------------------
INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
VALUES('Kevin', 'Huang', '1995-11-14'),
       ('Ken', 'Huang', '1998-11-04'),
       ('Dulce', 'Chang', DEFAULT);
-- check data
SELECT *
FROM sakila.ActorSample;

-- Subquery
INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
SELECT first_name, last_name, last_update
FROM actor
WHERE first_name = 'NICK';
-- check data
SELECT *
FROM sakila.ActorSample;

-- ------------------------------------------------
-- Do House Keeping After the insert statement try
-- ------------------------------------------------
DROP TABLE ActorSample;