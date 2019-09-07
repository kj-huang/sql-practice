-- CAST() or CONVERT()

SELECT 1-2;
-- ------------------------------------------------------------------------------------
-- PUT the SELECT CAST(1-2 AS UNSIGNED) result as input for the following query
-- SELECT CAST(18446744073709551615 AS SIGNED);
-- ------------------------------------------------------------------------------------
SELECT CAST(1-2 AS UNSIGNED);
SELECT CAST(1-2 AS SIGNED);

SELECT CONVERT('2018-10-10 10:10:10', DATE) AS DATE1,
			 CONVERT('18-10-10 10:10:10', DATE) AS DATE2,
			 CONVERT('20181010', DATE) AS DATE3,
			 CONVERT('181010', DATE) AS DATE4;

SELECT CONVERT('10:10:10', TIME) AS TIME1,
			 CONVERT('101010', TIME) AS TIME2;

SELECT CONVERT('11.1', DECIMAL(4,2)) AS Dec1;