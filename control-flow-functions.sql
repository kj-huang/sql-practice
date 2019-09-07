-- CASE Operator

SET @Var = 1;
SELECT CASE @Var
				 WHEN 1 THEN 'one'
				 WHEN 2 THEN 'two'
			 ELSE 'more' END AS Result;

SELECT CASE WHEN @Var = 1 THEN 'one'
			 WHEN @Var = 2 THEN 'two'
			 ELSE 'more' END AS Result;

-- IF functions
SELECT IF(1>2, 2,3);
SELECT IF(1<2, 'yes','no');
SELECT IF(YEAR(NOW() = 2018), 'yes', 'no');

-- IFNULL functions - Return the first value if isn't null, else return seconf value
SELECT IFNULL(1, 0);
SELECT IFNULL(NULL, 0);
SELECT 1/0;
SELECT IFNULL(1/0, 'Yes');

-- NULLIF functions - Return null if parameters are equal
-- else return first parameter's value
SELECT NULLIF(1, 0);
SELECT NULLIF(1, 2);