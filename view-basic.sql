-- VIEW operator example

USE sakila;

SELECT *
FROM actor;

CREATE VIEW vw_AllActor AS
SELECT *
FROM actor;

SELECT *
FROM vw_AllActor;

SELECT *
FROM vw_AllActor
WHERE first_name LIKE 'A%';

CREATE VIEW vw_ActorA AS
SELECT *
FROM actor
WHERE first_name LIKE 'A%';

SELECT *
FROM vw_ActorA
WHERE last_name LIKE '%A%';

CREATE VIEW vw_ActorAnA AS
SELECT *
FROM vw_ActorA
WHERE last_name LIKE '%A%';

SELECT *
FROM vw_ActorAnA
ORDER BY last_name;

DROP TABLE vw_AllActor;
DROP TABLE vw_ActorA;
DROP TABLE vw_ActorAnA;