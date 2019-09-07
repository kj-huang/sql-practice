/*
A view is not updatable if it contains any of the following:

Aggregate functions (SUM(), MIN(), MAX(), COUNT(), and so forth)
DISTINCT 
GROUP BY 
HAVING
UNION or UNION ALL
 Subquery in the select list 
Certain joins (see additional join discussion later in this section)
Nonupdatable view in the FROM clause 
A subquery in the WHERE clause that refers to a table in the FROM clause
Refers only to literal values 
Uses ALGORITHM = TEMPTABLE 
Multiple references to any column of a base table.
*/

-- Simplified Queries

/*
Problem Statement:
Find all the customer's payments which are over their average payment.
*/
SELECT pt.payment_id, cust.first_name, cust.last_name, amount, pt.rental_id
FROM payment pt
INNER JOIN customer cust ON cust.customer_id = pt.customer_id
WHERE amount <
		(	SELECT AVG(amount)
			FROM payment pt1
			WHERE pt1.customer_id = pt.customer_id);

CREATE VIEW CustPayment
AS
SELECT pt.payment_id, cust.first_name, cust.last_name, amount, pt.rental_id
FROM payment pt
INNER JOIN customer cust ON cust.customer_id = pt.customer_id
WHERE amount <
		(	SELECT AVG(amount)
			FROM payment pt1
			WHERE pt1.customer_id = pt.customer_id);

SELECT *
FROM CustPayment;

SELECT *
FROM CustPayment cp
INNER JOIN Rental r ON r.rental_id = cp.rental_id;

DROP VIEW CustPayment;