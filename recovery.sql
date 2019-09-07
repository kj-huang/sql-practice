-- Point time with log file recovery example

SELECT * FROM sakila.payment;

-- ---------------------------
-- Delect a data in accident
-- ---------------------------
-- Accident
DELETE FROM sakila.payment WHERE payment_id = 1;

/*
  Recover the data by following steps
*/
-- ------------------------------------------------------
-- First get all binary operation logs
-- ------------------------------------------------------
SHOW BINARY LOGS;

-- ------------------------------------------------------
-- Get the latest operation log
-- Dump the log file as backup.sql
-- to restore the delete data
-- ------------------------------------------------------
SHOW MASTER STATUS;