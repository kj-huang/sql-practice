-- Sub-queries operator example
/*
A sub-query is a nested query where the results of one query can be used in another query via a relational operator or aggregation function  

A sub-query must be enclosed with parentheses

A sub-query can have only one column in the SELECT clause if used in  WHERE clause  

An ORDER BY clause is not allowed in a sub-query  

Sub-queries can be nested within other sub-queries

Sub-queries are used in WHERE, HAVING, FROM and SELECT clause
*/


/*
  Problem Statement:
  Find customers who like to watch action movie
*/

USE sakila;
-- Sub-query
/*
Can pass the aggregate values to the main query
Simplifies long and complex queries
*/
SELECT cust.customer_id, cust.first_name, cust.last_name
FROM customer cust
WHERE cust.customer_id IN
(
SELECT ren.customer_id
FROM rental ren
WHERE ren.inventory_id IN
(
SELECT inv.inventory_id
FROM inventory inv
WHERE inv.film_id IN
(
SELECT fl.film_id
FROM film fl
WHERE fl.film_id IN
(
SELECT fc.film_id
FROM film_category fc
WHERE fc.category_id IN
(
SELECT cat.category_id
FROM category cat
WHERE cat.name = 'Action'
)))))
ORDER BY cust.customer_id, cust.first_name, cust.last_name;


-- Joins
/*
Can include columns from joining tables in the SELECT clause
 Easy to read and more intuitive
*/
SELECT DISTINCT cust.customer_id, cust.first_name, cust.last_name
FROM customer cust
INNER JOIN rental ren USING(customer_id)
INNER JOIN inventory inv USING(inventory_id)
INNER JOIN film fl USING(film_id)
INNER JOIN film_category fc USING(film_id)
INNER JOIN category cat USING(category_id)
WHERE cat.name = 'Action'
ORDER BY cust.customer_id, cust.first_name, cust.last_name;

-- Join that must use the sub query
SELECT fm.title, cat.name, dt.CountOfCategory
FROM film fm
INNER JOIN film_category fc USING(film_id)
INNER JOIN category cat USING(category_id)
INNER JOIN (
    SELECT COUNT(*) AS CountOfCategory, fc.category_id
    FROM film_category fc
    GROUP BY fc.category_id) dt USING(category_id);


-- Correlated Sub-queries
/*
  - A correlated sub-query is a subquery that is executed once for each row
  - A correlated sub-query returns results based on the column of the main query
*/

/*
  Problem Statement:
  Find all the customer's payments which are over their average payment.
*/
SELECT  payment_id, cust.first_name, cust.last_name, amount
FROM payment pt
INNER JOIN customer cust ON cust.customer_id = pt.customer_id
WHERE amount <
		(	SELECT AVG(amount)
			FROM payment pt1
			WHERE pt1.customer_id = pt.customer_id)
ORDER BY cust.customer_id;

SELECT  cust.first_name, cust.last_name, COUNT(payment_id) CountofPayment
FROM payment pt
INNER JOIN customer cust ON cust.customer_id = pt.customer_id
WHERE amount >
		(	SELECT AVG(amount)
			FROM payment pt1
			WHERE pt1.customer_id = pt.customer_id)
GROUP BY cust.first_name, cust.last_name
ORDER BY cust.customer_id;

SELECT AVG(amount), cust.first_name, cust.last_name
FROM payment pt
INNER JOIN customer cust ON cust.customer_id = pt.customer_id
GROUP BY cust.first_name, cust.last_name
ORDER BY cust.customer_id;