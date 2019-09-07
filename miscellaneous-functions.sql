-- Miscellaneous functions

-- RAND() - Return a random floating-point value
SELECT RAND() AS RandomValue;
SELECT RAND()*10 AS RandomValue;

-- SLEEP() - Sleep for a number of seconds
SELECT NOW();
-- ------------------------------------------------------
-- SELECT SLEEP(5); Return 0 means successfully executed
-- ------------------------------------------------------
SELECT SLEEP(5);
SELECT NOW();

-- UUID() - Return a Universal Unique Identifier(UUID)
SELECT UUID();