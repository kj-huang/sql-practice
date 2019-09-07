-- ABS() - Return the absolute value
SELECT ABS(66), ABS(-66);

-- CEILING() -- Return the smallest integer value not less than the argument
SELECT CEILING(12.34), CEILING(-12.34);

-- COS() - Return the cosine
SELECT DEGREES(PI()), DEGREES(PI() / 2);

-- FLOOR() -- Return the largest integer value not greater than the argument
SELECT FLOOR(12.34), FLOOR(-12.34);

-- PI() - Return the value of pi
SELECT PI();
SELECT PI() + 0.000000000000000000;

-- POW() - Return the argument raised to the specified power - synonym for POWER
SELECT POW(2,2);
SELECT POWER(8, -2);

-- SQRT() - Return the square root of the argument
SELECT SQRT(4), SQRT(64);
-- ---------------------------------------------
-- SQRT with negative argument will return NULL
-- ---------------------------------------------
SELECT SQRT(-256);

-- Table Column
SELECT amount,
			 ROUND(amount) AS Amount,
			 amount - 0.5,
			 ROUND(amount) R_Amount
FROM sakila.payment;