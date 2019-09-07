-- Retrieve column names using aliases

SELECT rental_date, inventory_id, return_date
FROM sakila.rental;

SELECT rental_date AS RentalRate,
       inventory_id AS FilmListId,
       return_date AS ReturnDate
FROM sakila.rental;

-- Retrieve values based on arithmetic expressions

SELECT replacement_cost-rental_rate,
       film_id AS FilmId,
       length/60
FROM sakila.film;

SELECT replacement_cost-rental_rate AS CostDiff,
       film_id AS FilmId,
       length/60 AS TimeHour
FROM sakila.film;

SELECT rental_rate AS RentalRate,
       rental_rate + 3 * 4 - 1 AS Result1,
       (rental_rate + 3)  * 4 - 1 AS Result2,
       (rental_rate + 3)  * (4 - 1) AS Result3,
       rental_rate + (3 * 4) - 1 AS Result4
FROM sakila.film;

SELECT replacement_cost AS ReplacementCost,
       replacement_cost/5 AS Result1,
       replacement_cost DIV 5 AS Result2,
       replacement_cost % 5 AS Result3
FROM sakila.film;
