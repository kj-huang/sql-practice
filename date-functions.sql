-- DateTIme Functions

-- ADDDATE() or DATE_ADD() - Add time values(intervals) to a date value
SELECT ADDDATE('2018-10-10', INTERVAL 45 DAY), DATE_ADD('2018-10-10', INTERVAL 45 DAY);

-- SUBDATE() or DATE_SUB() - Subtract a time value (intervals) from a date value
SELECT SUBDATE('2018-10-10', INTERVAL 45 DAY), DATE_SUB('2018-10-10', INTERVAL 45 DAY);

-- Return the current_date
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- Return the current_time
SELECT NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP;

-- Various date and time part of datetime
SELECT NOW(),
			 DATE(NOW()),
			 TIME(NOW()),
			 YEAR(NOW()),
			 QUARTER(NOW()),
			 MONTH(NOW()),
			 WEEK(NOW()),
			 DAY(NOW()),
			 DAYNAME(NOW()),
			 HOUR(NOW()),
			 MINUTE(NOW()),
			 SECOND(NOW());

-- Format Date and Time
SELECT DATE_FORMAT('2018-10-10 10:10:10', '%W %M %Y'),
			 DATE_FORMAT('2018-10-10 10:10:10', '%d %b %Y %T:%f'),
			 DATE_FORMAT('2018-10-10 10:10:10', '%b %d %Y %h:%i %p');

-- Table Column
SELECT rental_date, DATE_FORMAT(rental_date, '%W %M %Y')
FROM sakila.rental;

/*
Format	Description
%a	Abbreviated weekday name (Sun to Sat)
%b	Abbreviated month name (Jan to Dec)
%c	Numeric month name (0 to 12)
%D	Day of the month as a numeric value, followed by suffix (1st, 2nd, 3rd, ...)
%d	Day of the month as a numeric value (01 to 31)
%e	Day of the month as a numeric value (0 to 31)
%f	Microseconds (000000 to 999999)
%H	Hour (00 to 23)
%h	Hour (00 to 12)
%I	Hour (00 to 12)
%i	Minutes (00 to 59)
%j	Day of the year (001 to 366)
%k	Hour (0 to 23)
%l	Hour (1 to 12)
%M	Month name in full (January to December)
%m	Month name as a numeric value (00 to 12)
%p	AM or PM
%r	Time in 12 hour AM or PM format (hh:mm:ss AM/PM)
%S	Seconds (00 to 59)
%s	Seconds (00 to 59)
%T	Time in 24 hour format (hh:mm:ss)
%U	Week where Sunday is the first day of the week (00 to 53)
%u	Week where Monday is the first day of the week (00 to 53)
%V	Week where Sunday is the first day of the week (01 to 53). Used with %X
%v	Week where Monday is the first day of the week (01 to 53). Used with %X
%W	Weekday name in full (Sunday to Saturday)
%w	Day of the week where Sunday=0 and Saturday=6
%X	Year for the week where Sunday is the first day of the week. Used with %V
%x	Year for the week where Monday is the first day of the week. Used with %V
%Y	Year as a numeric, 4-digit value
%y	Year as a numeric, 2-digit value
*/