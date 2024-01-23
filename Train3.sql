--------------------------------------------------------------------------First Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
USE sql_store
SELECT * from sql_store.order_items;
SELECT * From order_items WHERE order_id = 1;
order by first_name;
SELECT first_name, last_name, points, points*10 as points10 from customers;
SELECT first_name, last_name, points, points*10 as "points 10" from customers;
SELECT DISTINCT first_name, last_name, points, points*10 as "points 10" from customers;
SELECT first_name as fname, last_name as lname from customers as cust;
SELECT DISTINCT first_name as fname, last_name as lname from customers as cust;
SELECT DISTINCT (*) first_name as fname, last_name as "l name" from customers as cust;
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT * FROM customers WHERE points > 3000;
SELECT * FROM customers WHERE points = 3000;
SELECT * FROM customers WHERE points != 3000;
SELECT * FROM customers WHERE points <> 3000;
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT * FROM customers WHERE birth_date > "1990-01-01"
SELECT * FROM customers WHERE birth_date < "1990-01-01"
SELECT * FROM customers WHERE birth_date < "1990-01-01" AND points>1000
SELECT * FROM customers WHERE points != 3000 AND points <> 1000
SELECT * FROM customers WHERE points != 3000 or points != 1000
SELECT * From customers WHERE NOT (birth_date > "1990-01-01" or points >1000)
SELECT * from order_items Where  order_id=6  and unit_price*quantity>30
SELECT * From customers WHERE NOT (birth_date <> "1990-01-01" or points !=1000) AND unit_price*quantity>30;
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT * from order_items WHere state = "Va" OR State = "Fl" or state ="Ga"
SELECT * from order_items WHERE State IN ("Va","Fl","Ga")
SELECT * from order_items WHERE State NOT IN ("Va","Fl","Ga")
SELECT * from order_items WHERE quantity_in_stock IN (49, 38,72)
SELECT * from order_items WHERE points BETWEEN 1090 AND 3000
WHERE birth_date BETWEEN "1990-81-81" AND "2000-01-01"
SELECT * From customers WHERE NOT (birth_date <> "1990-01-01" or points !=1000) AND unit_price*quantity>30 
OR T_date BETWEEN "1990-81-81" AND "2000-01-01" OR  State NOT IN ("Va","Fl","Ga");

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
WHERE last_name LIKE "brush%"  -- it means start with brush 
WHERE last_name LIKE "%brush%"  -- it means contain "brush" 
WHERE last_name LIKE "%b"  -- it means ends with "b"
WHERE last_name LIKE "-b"  -- it "b" is the second letter
WHERE last_name LIKE "--b"  -- it "b" is the third letter
WHERE last_name LIKE "y--b"  -- it starts with y and after 2 chaRACTERS ITS B "b" is the third letter
WHERE address LIKE "%trail%" OR address LIKE "avenue"
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
WHERE last_name REGEXP "fip" -- Means contains "fip"
WHERE last_name REGEXP "^fip" -- Means starts with  "fip"
WHERE last_name REGEXP "fip$" -- Means end with "fip"
WHERE last_name REGEXP "fipmaxvelar$" -- Means contains"fip" or "max" or "velar"
WHERE last_name REGEXP "[gim]e" -- means that it before "e" there should be "g"g or "i" or "m"
WHERE last_name REGEXP "e[a-f]" -- means that it after "e" there should be a  "a" or "b",..., "f"
WHERE last_name REGEXP "cyrus$Kal$" -- means end with "cyrus" or end with "Kal"
WHERE last_name REGEXP "^cyrusKal" -- means start with "cyrus" or  contains "Kal"
SELECT * FROM sql_store.customers WHERE first_name REGEXP "[a-z]{4}a$"; --means ends with "a" and there should be at least  4 letters before "a" 
SELECT * FROM sql_store.customers WHERE first_name REGEXP "^[a-z]{5}a$"; --means ends with "a" and there should be exact  4 letters before "a" 
SELECT * FROM sql_store.customers WHERE first_name REGEXP "^[a-z]{0,4}a$"; --means ends with "a" and there should be at most  4 letters before "a" 
SELECT * FROM sql_store.customers WHERE first_name REGEXP "^[A-Z]{4}a$"; --means ends with "a" and there should be exact  4 capital letters before "a" 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
WHERE phone IS NULL
WHERE phone IS NOT NULL
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ORDER BY first_name DESC
ORDER BY first_name, last_name, phone
ORDER BY first_name DESC, last_name DESC, phone 
ORDER BY first_name DESC, last_name DESC, quantity* unit_price 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT * from order_items limit 300
SELECT * from order_items limit 100, 300 -- means skip the first 100 records and...
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------End of First Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of Second Session----------------------------------------------------------------------------------------------------------------------------------------------------------
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT * FROM orders JOIN customers ON orders.customer_id = customers.customer_id
SELECT order_id, orders.customer_id, first_name, last_name FROM orders JOIN customers 
ON orders.customer_id = customers.customer_id -- if we have a column with a same name on the both table we should determine to SELECT which table should be that source of the selecting that column.

SELECT order_id, o.customer_id, first_name, last_name FROM orders o
JOIN customers q 
ON o.customer_id = c.customer_id -- we can add a nick name to the Tables as you can see
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
USE sql_inventory;
SELECT * FROM sql_storel.order_items oi JOIN sal_inventory.products p
ON oi.product_id = p.product_id -- Joining Tables from different data bases.

USE sql_hr;
SELECT e.employee_id, e.first_name, m.first_name
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id -- Self JOIN to find which employee should report to which employee (his boss)

SELECT *
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_statuses os
ON o.status = os.order_status_id -- Multiple Joining

SELECT *
FROM order_items oi
JOIN order_item_notes oin
ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id -- Joining with composite condition. 
--it is important when we have a composite promary key for the tables for eaxmple. "See session 2, 38":12"

SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id -- Implicit Join which can be considered as antother sytanx for join
-- INNER JOIN = JOIN

SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id 

SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id 

-- LEFT OUTER JOIN = LEFT JOIN, RIGHT OUTER JOIN = RIGHT JOIN

SELECT o.order_id, c.first_name
FROM orders o
JOIN customers c
1-- ON o.customer_id = c.customer_id
USING(customer_id) -- when the column name is equivalent on the both tables you can repalce the "ON" 
statment with "USING"

SELECT o.order_id, c.first_name
FROM orders o 1
NATURAL JOIN customers c-- with the natural join, data base engine automatically select the condion columns

SELECT c.first_name AS customer, p.name AS product 
FROM customers c 
CROSS JOIN products p -- It is equivalent with  the follwing query (explicit Join)

SELECT c.first_name AS customer, p.name AS product 
FROM customers c products p

SELECT order_id, order_date, "Active" AS status
FROM orders
WHERE order_date >= "2019-01-01" -- This query gives a label to the rows who order_date >= "2019-01-01"
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT order_id, order_date, "Active" AS status
FROM orders
WHERE order_date >= "2019-01-01" -- This query gives a label to the rows who order_date >= "2019-01-01"
UNION
SELECT order_id, order_date, "Archive" AS status
FROM orders
WHERE order_date < "2019-01-01" -- This query gives a label to the rows who order_date < "2019-01-01"
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT name
FROM shippers
UNION
SELECT first_name
FROM customers -- UNION agregates the rows of  two queries even from differnt Tables or databases.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------End of Second Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of Third Session----------------------------------------------------------------------------------------------------------------------------------------------------------

*Data types in SQL are : 1- INT, 2-VARCHAR(n), 3- Date, 4- CHAR. VARCHAR is memory flexible while CHAR is not.

*In table configurations window the columns are: PK (primary key), NN (NOT null), AI (Auto increment), defualt value (assigns a defult val in case of there is no value assigned)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSERT INTO product VALUES(Defualt, "Cyrus", 20, 30) -- adds a new column to the table and the defult is for the primary key column. That is, since the product_id column ia auto increamented then by passing the defukt keyword we can lett the engine to fill the right id for the new row automatically

INSERT INTO customers(first_name, last_name, birth_date, address, city, state)
VALUES ("neon", "learn", "1990-01-01", "address","city", "Sa");

INSERT INTO customers(first_name, last_name, birth_date, address, city, state)
VALUES ("neon", "learn", "1990-01-01", "address","city", "Sa"), ("neon1", "learn1", "1990-01-01", "address","city", "Sa");
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
INSERT INTO orders Values(1, "2023-06-22", 1); -- When you want to add a row to parent and child table. you should take care of the id column. For this reason the LAST_INSERT_ID() do it automatically.

INSERT INTO order_items VALUES (LAST_INSERT_ID(), 1, 1, 2.95), (LAST_INSERT_ID(), 2, 3, 2.95 )
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CREATE TABLE CYRUS_K (id INT PRIMARY KEY , name VARCHAR(100) NOT NULL, DOB DATE);

CREATE TABLE CYRUS_K1 AS select * from customers; -- this will duplicalte customers table
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create table CK AS
select * from customers where  first_name regexp("^[B, I]"); -- conditional duplication of the customers table
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
update customers set first_name  = "Cyrus" where customer_id = 1; -- edits a table

update customers set first_name  = "Cyrus" , phone = "324-543-123" where customer_id = 1;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
UPDATE invoices
SET paynient_total = invoice_total * 0.5, payment_date = due_date 
WHERE client_id = (
SELECT client_id
FROM clients
WHERE name = "Myworks" 
) -- edits table with seconed state condtion

UPDATE involces
SET paynient_total = invoice_total * 0.5, payment_date = due_date 
WHERE client_id IN (
SELECT client_id
FROM clients
WHERE state IN ("CA", "NY")
) -- edits table with seconed state condtion
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
UPDATE invoices
SET payment_total = invoice_total * 0.5, payment_date = due_date
WHERE client_id IN (
    SELECT client_id
    FROM (
        SELECT client_id
        FROM invoices
        WHERE payment_total > 60
    ) AS subquery
); -- edits table with seconed state condtion for when you want to use a same table in the where clause. If you use the previous syntax you will gen en error. the above syntax works when the Tables are not same
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELETE FROM invoices
WHERE client_id = (
  SELECT client_id
  FROM clients
  WHERE name = "Myworks"
);
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------End of Third Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 4th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
*****Builtins functions******
COUNT(): -- Returns the number of rows or non-null values in a specified column.
SUM(): -- Calculates the sum of values in a specified column.
AVG(): -- Calculates the average of values in a specified column.
MIN(): -- Returns the minimum value in a specified column.
MAX(): -- Returns the maximum value in a specified column.
UPPER(): -- Converts a string to uppercase.
LOWER(): -- Converts a string to lowercase.
CONCAT(): -- Concatenates two or more strings together.
SUBSTRING(): -- Extracts a substring from a string.
DATE(): -- Returns the current date.
NOW(): -- Returns the current date and time.
CAST(): -- Converts a value from one data type to another.
COALESCE(): -- Returns the first non-null value in a list.
TRIM(): -- Removes leading and trailing spaces from a string.
ROUND(): -- Rounds a number to a specified number of decimal places.
LTRIM(): -- Removes leading spaces from a string.
RTRIM(): -- Removes trailing spaces from a string.
LEFT(): -- Extracts a specified number of characters from the beginning of a string.
RIGHT(): -- Extracts a specified number of characters from the end of a string.
LENGTH(): -- Returns the length (number of characters) of a string.
REPLACE(): -- Replaces all occurrences of a specified string with another string.
INSTR(): -- Returns the position of a substring within a string.
TRIM(): -- Removes leading and trailing spaces from a string.
ABS(): -- Returns the absolute (positive) value of a number.
SQRT(): -- Calculates the square root of a number.
POWER(): -- Raises a number to a specified power.
RAND(): -- Generates a random number.
FLOOR(): -- Rounds a number down to the nearest integer.
CEILING(): -- Rounds a number up to the nearest integer.
MOD(): -- Returns the remainder after division.
COALESCE(): -- Returns the first non-null value in a list.
NULLIF(): -- Returns NULL if two expressions are equal, otherwise returns the first expression.
CASE: -- Evaluates conditions and returns a result based on the condition met.
WHEN: -- Part of the CASE statement, specifies a condition to evaluate.
ELSE: -- Part of the CASE statement, specifies the result if none of the conditions are met.
END: -- Marks the end of a CASE statement.
EXISTS(): -- Checks the existence of records satisfying a specified condition.
BETWEEN: -- Checks if a value is within a specified range.
LIKE: -- Matches a value against a specified pattern.
IN: -- Checks if a value matches any value in a specified list.
DISTINCT: -- Filters out duplicate values from a result set.
UNION: -- Combines the result sets of two or more SELECT statements.
INTERSECT: -- Returns the common records between two SELECT statements.
EXCEPT: -- Returns the records from the first SELECT statement that are not present in the result of the second SELECT statement.
GROUP BY: -- Groups rows based on specified columns.
HAVING: -- Filters groups based on a condition.
ORDER BY: -- Sorts the result set based on specified columns.
LIMIT: -- Specifies the maximum number of rows to return.
TOP (for Microsoft SQL Server): -- Specifies the maximum number of rows to return (Microsoft SQL Server syntax).
TRUNCATE(): -- Truncates a number to a specified number of decimal places.
UPPER(): -- Converts a string to uppercase.
LOWER(): -- Converts a string to lowercase.
INITCAP(): -- Converts the first letter of each word to uppercase.
TRIM(): -- Removes leading and trailing spaces from a string.
LTRIM(): -- Removes leading spaces from a string.
RTRIM(): -- Removes trailing spaces from a string.
CONCAT(): -- Concatenates two or more strings together.
SUBSTRING(): -- Extracts a substring from a string.
REPLACE(): -- Replaces all occurrences of a specified string with another string.
LENGTH(): -- Returns the length (number of characters) of a string.
INSTR(): -- Returns the position of a substring within a string.
ROUND(): -- Rounds a number to a specified number of decimal places.
FLOOR(): -- Rounds a number down to the nearest integer.
CEILING(): -- Rounds a number up to the nearest integer.
ABS(): -- Returns the absolute (positive) value of a number.
SQRT(): -- Calculates the square root of a number.
POWER(): -- Raises a number to a specified power.
MOD(): -- Returns the remainder after division.
EXP(): -- Calculates the exponential value of a number.
LOG(): -- Calculates the natural logarithm of a number.
LOG10(): -- Calculates the base-10 logarithm of a number.
SIN(): -- Calculates the sine of an angle.
COS(): -- Calculates the cosine of an angle.
TAN(): -- Calculates the tangent of an angle.
ASIN(): -- Calculates the inverse sine (arc sine) of a number.
ACOS(): -- Calculates the inverse cosine (arc cosine) of a number.
ATAN(): -- Calculates the inverse tangent (arc tangent) of a number.
CONCAT_WS(): -- Concatenates multiple strings together with a specified separator.
DATEPART(): -- Extracts a specific part (year, month, day, etc.) from a date or time.
DATEADD(): -- Adds a specific part (year, month, day, etc.) to a date or time.
DATEDIFF(): -- Calculates the difference between two dates or times.
GETDATE(): -- Returns the current date and time (equivalent to NOW() in some DBMS).
ISNULL(): -- Returns a specified value if an expression is NULL, otherwise returns the expression itself.
NULLIF(): -- Returns NULL if two expressions are equal, otherwise returns the first expression.
CAST(): -- Converts a value from one data type to another.
CONVERT(): -- Converts a value from one data type to another (DBMS-specific function).
COALESCE(): -- Returns the first non-null value in a list.
ROW_NUMBER(): -- Assigns a unique sequential number to each row in a result set.
RANK(): -- Assigns a rank to each row in a result set based on a specified order.
NTILE(): -- Divides a result set into a specified number of equally sized groups.
LEAD(): -- Returns the value of a column from the next row in a result set.
LAG(): -- Returns the value of a column from the previous row in a result set.
FIRST_VALUE(): -- Returns the value of a column from the first row in a result set.
LAST_VALUE(): -- Returns the value of a column from the last row in a result set.
STRING_AGG(): -- Concatenates values from multiple rows into a single string with a specified separator (DBMS-specific function).
FORMAT(): -- Formats a value with a specified format (DBMS-specific function).
JSON_VALUE(): -- Extracts a value from a JSON string based on a specified path (DBMS-specific function).
JSON_ARRAY(): -- Constructs a JSON array from a set of values (DBMS-specific function).
XML functions (e.g., XMLQUERY, XMLTABLE): -- Manipulates XML data and performs operations on XML elements and attributes (DBMS-specific functions).
Regular expression functions (e.g., REGEXP_LIKE, REGEXP_REPLACE): -- Perform pattern matching and manipulation using regular expressions (DBMS-specific functions).
UPPER(): -- Converts a string to uppercase.
LOWER(): -- Converts a string to lowercase.
INITCAP(): -- Converts the first letter of each word to uppercase.
TRIM(): -- Removes leading and trailing spaces from a string.
LTRIM(): -- Removes leading spaces from a string.
RTRIM(): -- Removes trailing spaces from a string.
CONCAT(): -- Concatenates two or more strings together.
SUBSTRING(): -- Extracts a substring from a string.
REPLACE(): -- Replaces all occurrences of a specified string with another string.
LENGTH(): -- Returns the length (number of characters) of a string.
INSTR(): -- Returns the position of a substring within a string.
ROUND(): -- Rounds a number to a specified number of decimal places.
FLOOR(): -- Rounds a number down to the nearest integer.
CEILING(): -- Rounds a number up to the nearest integer.
ABS(): -- Returns the absolute (positive) value of a number.
SQRT(): -- Calculates the square root of a number.
POWER(): -- Raises a number to a specified power.
MOD(): -- Returns the remainder after division.
EXP(): -- Calculates the exponential value of a number.
LOG(): -- Calculates the natural logarithm of a number.
LOG10(): -- Calculates the base-10 logarithm of a number.
SIN(): -- Calculates the sine of an angle.
COS(): -- Calculates the cosine of an angle.
TAN(): -- Calculates the tangent of an angle.
ASIN(): -- Calculates the inverse sine (arc sine) of a number.
ACOS(): -- Calculates the inverse cosine (arc cosine) of a number.
ATAN(): -- Calculates the inverse tangent (arc tangent) of a number.
CONCAT_WS(): -- Concatenates multiple strings together with a specified separator.
DATEPART(): -- Extracts a specific part (year, month, day, etc.) from a date or time.
DATEADD(): -- Adds a specific part (year, month, day, etc.) to a date or time.
DATEDIFF(): -- Calculates the difference between two dates or times.
GETDATE(): -- Returns the current date and time (equivalent to NOW() in some DBMS).
ISNULL(): -- Returns a specified value if an expression is NULL, otherwise returns the expression itself.
NULLIF(): -- Returns NULL if two expressions are equal, otherwise returns the first expression.
CAST(): -- Converts a value from one data type to another.
CONVERT(): -- Converts a value from one data type to another (DBMS-specific function).
COALESCE(): -- Returns the first non-null value in a list.
ROW_NUMBER(): -- Assigns a unique sequential number to each row in a result set.
RANK(): -- Assigns a rank to each row in a result set based on a specified order.
NTILE(): -- Divides a result set into a specified number of equally sized groups.
LEAD(): -- Returns the value of a column from the next row in a result set.
LAG(): -- Returns the value of a column from the previous row in a result set.
FIRST_VALUE(): -- Returns the value of a column from the first row in a result set.
LAST_VALUE(): -- Returns the value of a column from the last row in a result set.
STRING_AGG(): -- Concatenates values from multiple rows into a single string with a specified separator (DBMS-specific function).
FORMAT(): -- Formats a value with a specified format (DBMS-specific function).
JSON_VALUE(): -- Extracts a value from a JSON string based on a specified path (DBMS-specific function).
JSON_ARRAY(): -- Constructs a JSON array from a set of values (DBMS-specific function).
XML functions (e.g., XMLQUERY, XMLTABLE): -- Manipulates XML data and performs operations on XML elements and attributes (DBMS-specific functions).
Regular expression functions (e.g., REGEXP_LIKE, REGEXP_REPLACE): -- Perform pattern matching and manipulation using regular expressions (DBMS-specific functions).

AGGREGATE FUNCTIONS (e.g., COUNT(), SUM(), AVG(), MIN(), MAX()): -- Perform calculations on a set of values and return a single result.
STRING FUNCTIONS (e.g., CHARINDEX(), LEFT(), RIGHT(), REPLICATE()): -- Manipulate and work with string data.
DATE AND TIME FUNCTIONS (e.g., DATEPART(), DATEADD(), DATEDIFF(), GETDATE()): -- Perform operations and calculations on date and time values.
TYPE CONVERSION FUNCTIONS (e.g., CAST(), CONVERT()): -- Convert values from one data type to another.
MATH FUNCTIONS (e.g., ABS(), CEILING(), FLOOR(), ROUND()): -- Perform mathematical operations on numeric values.
CONDITIONAL FUNCTIONS (e.g., CASE, COALESCE(), NULLIF()): -- Evaluate conditions and return a result based on the condition met.
WINDOW FUNCTIONS (e.g., ROW_NUMBER(), RANK(), LAG(), LEAD()): -- Perform calculations over a specific subset of rows in a result set.
BITWISE FUNCTIONS (e.g., BITAND(), BITOR(), BITXOR()): -- Perform bitwise operations on binary values.
GEOSPATIAL FUNCTIONS (e.g., ST_DISTANCE(), ST_INTERSECTS(), ST_AREA()): -- Perform calculations and operations on spatial data.
SYSTEM FUNCTIONS (e.g., DATABASE(), USER(), CURRENT_TIMESTAMP()): -- Retrieve information about the database system or current session.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT COUNT(invoice_total) FROM sql_invoicing.invoices;
SELECT SUM(invoice_total) as sum, MAX(invoice_total) as max, AVG(invoice_total) as min FROM sql_invoicing.invoices;
SELECT SUM( DISTINCT invoice_total) as sum, MAX(invoice_total) as max, AVG(invoice_total) as min FROM sql_invoicing.invoices;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT client_id, SUM(invoice_total) AS total_sales FROM invoices 
GROUP BY client_id -- showing invoice_total for each client

SELECT client_id, SUM(invoice_total) AS total_sales 
FROM invoices 
JOIN clients USING(client_id) 
WHERE invoice_date >= '2019-07-01' 
GROUP BY client_id 
ORDER BY total_sales DESC 

SELECT state, city, SUM(invoice_total) AS total_sales
FROM invoices
JOIN clients USING(client_id)
GROUP BY state, city

SELECT client_id, SUM(invoice_total) AS total_sales 
FROM invoices 
GROUP BY client_id 
HAVING total sales > 504 ; 

SELECT client_id, SUM(invoice_total) AS total_sales, 
COUNTI(*) AS number_of_invoices
FROM invoices
GROUP BY client_id 
HAVING total_sales > 500;

SELECT client_id, SUM(invoice_total) AS total_sales,
COUNT(*) AS number_of_invoices
FROM invoices
GROUP BY client_id
HAVING total_sales > 500 AND number_of_invoices > 5
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--In SQL, you cannot use aggregate functions like SUM() and COUNT() 
--directly in the WHERE clause. They can only be used in the HAVING 
--clause when filtering based on aggregated values. Here's the corrected 
--version of your query. FOR EXAMPLE the following query won't work:
SELECT client_id, SUM(invoice_total) AS total_sales,
COUNT(*) AS number_of_invoices
FROM invoices
WHERE SUM(invoice_total) > 500 AND number_of_invoices > 5
GROUP BY client_id
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT client_id, SUM(invoice_total) AS total_sales
FROM invoices
GROUP BY client_id WITH ROLLUP

SELECT state, city, SUM(invoice_total) AS total_sales 
FROM invoices 
JOIN clients c USING(client_id) 
GROUP BY state, city WITH ROLLUP 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------End of 4th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 5th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM products
WHERE unit_price > (
SELECT unit_price
FROM products
WHERE product_id = 3)

SELECT * 
FROM invoices 
WHERE invoice_total > ( 
SELECT MAX(invoice_total) 
FROM invoices 
WHERE client_id = 3 
) 
-- the above and below queries are equivalent.

SELECT *
FROM invoices
WHERE invoice_total > ALL (
SELECT invoice_total
FROM invoices
WHERE client id = 3) --  Thw 'ALL' keyword is used because the subquery 
--that is used won't retrieve a uniq value. it retrieves a list

SELECT *
FROM products
WHERE product_id NOT IN (
SELECT DISTINCT product_id
FROM order_items)-- This query retrieves all the product that not have been ordered. 
--********************** Very Important: for solving a problem 1-break it down into small parts 2- write a subquery for each part 3- make sure each sub query is accurate 4- merge the subqueries.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT *
FROM invoices 
WHERE invoice_total > ANY ( 
SELECT invoice_total
FROM invoices 
WHERE client_id = 3 
) -- ANY is used when we want all the invoice_totals that are > 
--than at least one of the values that the sub query  is retiving

SELECT *
FROM invoices 
WHERE invoice_total > SOME( 
SELECT invoice_total
FROM invoices 
WHERE client_id = 3 
) -- SOME == ANY
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT *
FROM clients 
WHERE client_id = ANY ( 
SELECT client_id; 
FROM invoices
GROUP BY client_id 
HAVING COUNT(*) >= 2 
) -- all the clients that their id is equal to 
--at least one the values of the subquery
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- for each employee
-- calculate the average salary for employee.office
-- return the employee if salay > average
SELECT *
FROM employees e
WHERE salary > (
SELECT AVG(salary)
FROM employees
WHERE office_id = e.office_id
)

SELECT *
FROM clients c
WHERE EXISTS (
SELECT client_id
FROM invoices 
WHERE client_id = c.client_id
)

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT
invoice_id,
invoice_total,
(SELECT AVG(invoice_total) FROM invoices) AS invoice_average,
invoice_total - (sELECT invoice_average) AS difference
FROM invoices-- this query perpare a report for the orders

SELECT
  c.client_id,
  c.name,
  (SELECT SUM(invoice_total) FROM invoices WHERE client_id = c.client_id) AS total,
  (SELECT AVG(invoice_total) FROM invoices) AS average,
  (SELECT total - average) As difference
FROM clients c
 -- full report for clients
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CREATE TABLE client_report AS 
SELECT * FROM (
  SELECT
    c.client_id,
    c.name,
    (SELECT SUM(invoice_total) FROM invoices WHERE client_id = c.client_id) AS total,
    (SELECT AVG(invoice_total) FROM invoices WHERE client_id = c.client_id) AS average,
    (SELECT total - average) AS difference
  FROM clients c
) as D -- if you dont write 'as D' (if you dont assign a nick name to your subquery) 
--then you cant use select * from (your sub query) otherwise you'll get this error: 
--Error Code: 1248. Every derived table must have its own alias	
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------End of 5th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 6th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
select round(3.5445434, 4)
select truncate(3.5445434, 4)
select ceiling(3.5445434)
select RAND()
select LENGTH('Cyrus')
select LTRIM('   cyrus')
select RTRIM('cyrus   ')
select TRIM('  cyrus   ')
select TRIM('  cyrus   ', 3)
select SUBSTRING ('cyrus kalantarpour', 3, 5)--from third character return the next 5 charachters
select locate ('r', 'cyrus')-- return the position of the first match
select replace ('www.example.com', 'com', 'ir' )
select CONCAT ('cyrus' , 'kalantarpour')
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT CONCAT('first_name','  ', 'A last_name') AS full_name
FROM customers
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Select NOW()--current time and date
select CURDATE() -- current date
select CURTIME() -- current time
select year(now())
select month(now())
select second(now())
select dayname(now())
select monthname(now())
select EXTRACT (hour from now())
select date_format(now(), '%y')
select date_format(now(), '%Y')
select date_format(now(), '%y %m')
select date_format(now(), '%p')-- AM /PM
SELECT DATE_ADD(NOW(), INTERVAL 10 YEAR)-- shift the current year to year +10
SELECT DATE_SUB(NOW(), INTERVAL 10 YEAR)
SELECT DATEDIFF('2022-08-01',NOW())
TIME_TO_SEC('01:00') - TIME_TO_SEC('03:00')-- time difference in seconds
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT * 
FROM orders 
WHERE YEAR(order_date) >= YEAR(NOW()) 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT order_id, IFNULL(shipper_id, "Not assigned") AS shipper
FROM orders;-- assings null to your favorit string

SELECT order_id, COALESCE(shipper_id, comments, 'Not assigned') AS shipper
FROM orders; -- assings null to your favorit string
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
IF(expression, first, second)-- this is the if structure in sql. That is if the expression true then it rtrivrs 'first' and o.w 'second'

select order_id, 
order_date, 
IF(YEAR(order_date) = YEAR(NOW()), 'ACTIVE', 'ARCHIVED') as Category
FROM orders 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT
order_id,
order_date,
CASE
WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Last year'
WHEN YEAR(order_date) < YEAR(NOW()) - 1 THEN 'Archived'
ELSE 'Future'

END AS ctegory
FROM orders;-- switch if structure in SQL
--------------------------------------------------------------------------End of 6th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 7th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
USE sql_invoicing;
create VIEW sales_by_client AS-- creates a view. That is if you refresh the navigator section in mySQL then it the the Views' drop down you'll see the sales_by_client
SELECT c.client_id, c.name, SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id, name

-- Now you can use the sales_by_client as virtual table and this 
--will simplify your queries. For example:

SELECT *
FROM sales_by_client
JoIN clients USING(client_id)
WHERE total_sales > 500
ORDER BY total_sales DESC
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CREATE VIEW clients_balances AS
SELECT client_id, name, SUM(invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id, name
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Drop view clients_balances-- deletes the clients_balances

CREATE  OR REPLACE VIEW clients_balances AS
SELECT client_id, name, SUM(invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id, name -- modify the view
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT
number,
client_id,
invoice_id,
invoice_total, 
payment_total,
invoice_total - payment_total AS balance,
invoice_date,
due_date,
payment_date
FROM invoices 
WHERE (invoice_total - payment_total) > 0

DELETE FROM invoices_with_balance
WHERE invoice_id = 1
-- you can modify only updatable  views. what are those? 
--the views that do now have any agriggation function , groupby DISTINCT
-- GROUP BY clause, HAVING clause, UNION or UNION ALL clause.
--Left join or outer join, 
--Subquery in the SELECT clause or in the WHERE clause that refers to the table appeared in the FROM clause, 
--Reference to non-updatable view in the FROM clause, 
--Reference only to literal values,
--Multiple references to any column of the base table.

UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2-- also you can update
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
WITH CHECK UPDATE

--------------------------------------------------------------------------End of 7th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 8th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN 
SELECT * FROM clients;
END $$
DELIMITER ;

DROP PROCEDURE get_clients

DROP PROCEDURE IF EXISTS get_clients

-- in this part we want to create a procedure 
-- that takes the state name and retrive corresponding clients
DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN

SELECT * FROM clients c

WHERE c.state = state;
END $$

-- then in an other tab you should call it:
call get_clients_by_state('ca')
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DROP PROCEDURE IF EXISTS get_clients_by_state;
delimiter $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))

BEGIN
	IF state IS NULL THEN 
		SET state = 'CA';
	END IF;
SELECT * FROM clients c
WHERE c.state = state;
END $$


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
DROP PROCEDURE IF EXISTS get_clients_by_state;
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
SELECT * FROM clients c
WHERE c.state = IFNULL(state, c.state);
END $$
DELIMITER ;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
USE sql_invoicing;

DELIMITER $$

CREATE PROCEDURE make_payment (invoice_id INT, payment_amount DECIMAL(10, 2), payment_date DATE)
BEGIN
  UPDATE invoices i
  SET
    i.payment_total = payment_amount,
    i.payment_date = payment_date
  WHERE i.invoice_id = invoice_id;
END$$

DELIMITER ;

USE sql_invoicing;
drop procedure if exists make_payment;
DELIMITER $$

CREATE PROCEDURE make_payment (invoice_id INT, payment_amount DECIMAL(10, 2), payment_date DATE)
BEGIN
	IF payment_amount < 0 THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Payment amount cannot be negative';
	END IF;

	UPDATE invoices i
	SET
		i.payment_total = payment_amount,
		i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END$$

DELIMITER ;


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_client (
  p_client_id INT, -- <-- renamed parameter
  OUT invoices_count INT,
  OUT invoices_total DECIMAL(9, 2)
)
BEGIN
  SELECT COUNT(*), COALESCE(SUM(invoice_total), 0)
  INTO invoices_count, invoices_total
  FROM invoices i
  WHERE i.client_id = p_client_id AND i.payment_total = 0; -- <-- use the renamed parameter
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_risk_factor ()
BEGIN
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
DECLARE invoices_total DECIMAL(9,2);-- when you wabt to defice temporary variable for inside function of procedure calculations use DECLARE. then the varible is stored into RAM
DECLARE invoices_count INT;
SELECT COUNT(*), SUM(invoice_total)
INTO invoices_count, invoices_total
FROM invoices;
SET risk_factor = invoices_total / invoices_count * 5;
SELECT risk_factor;
-- riks_factor = invoices_total / invoices_count * 5

END $$
DELIMITER ;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- defining a function. function are used when re return value is single foe example, 'sum()' returns only one value. 

--Functions:
--Functions return a value and are typically used in SQL expressions or as part of a SELECT statement.
--They accept parameters as inputs and compute and return a single value based on those inputs.
--Functions can be used in a variety of SQL statements, including SELECT, WHERE, and JOIN clauses.
--Examples of functions include aggregate functions (e.g., SUM, AVG), string manipulation functions (e.g., UPPER, SUBSTRING), and mathematical functions (e.g., ABS, ROUND).
--Use functions when you need to compute a value based on given inputs and incorporate it directly into a SQL statement or expression.

--Procedures:
--Procedures are designed to perform a series of actions or operations and may or may not return a value.
--They accept parameters as inputs but do not necessarily return a result.
--Procedures are typically used for tasks that involve data manipulation, such as inserting, updating, or deleting records.
--Procedures are executed using the CALL statement or invoked from another SQL statement or programming code.
--Use procedures when you want to perform a specific set of actions that may not directly produce a value but involve interacting with the database.

--In summary, use functions when you need to compute and return a value 
--within a SQL statement or expression. Use procedures when you want to 
--execute a series of actions or operations that may or may not produce 
--a result, typically involving data manipulation tasks.

DELIMITER $$
CREATE FUNCTION get_risk_factor_for_client (client_id INT)
RETURNS INTEGER 
DETERMINISTIC -- when you want to the function be a deterministic function
READS SQL DATA 
MODIFY SQL DATA
BEGIN
DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
DECLARE invoices_total DECIMAL(9,2);
DECLARE invoices_count INT; 
SELECT COUNT(*), SUM(invoice_total) 
INTO invoices_count, invoices_total 
FROM invoices i 
WHERE i.client_id = client_id;
SET risk_factor = invoices_total / invoices_count * 5; 
RETURN risk_factor; 
END  $$
DELIMITER ;

SELECT client_id, name, get_risk_factor_for_client(client_id)
FROM clients ; -- for callinf the function 

DROP FUNCTION IF EXISTS get_risk_factor_for_client;-- For deleting the function
--------------------------------------------------------------------------End of 8th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 9th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS are used when  intended to automatically update column b,c,... by updading  column a.
DELIMITER $$
CREATE TRIGGER payments_after_insert
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
UPDATE invoices
SET payment_total = payment_total + NEW.amount
WHERE invoice_id = NEW.invoice_id;
END $$

-- For using the above trigger:
INSERT INTO payments
VALUES(DEFAULT, 5, 3, '2020-01-1', 10, 1)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DELIMITER $$ 
CREATE TRIGGER payments_after_insert 
AFTER INSERT ON payments 
FOR EACH ROW 
BEGIN 
UPDATE invoices 
SET payment_total = payment_total + NEW.amount
WHERE invoice_id = NEW.invoice_id; 
END $$ 
DELIMITER ; 

drop trigger payments_after_insert ;

SHOW TRIGGERS

SHOW TRIGGERS LIKE "payments%"
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- for creation of the a log table (a table that shows for example what )
-- first we need to create table with favorit columns
USE sql_invoicing; 

CREATE TABLE payments_audit
(
	client_id 		INT 			NOT NULL, 
    date 			DATE 			NOT NULL,
    amount 			DECIMAL(9, 2) 	NOT NULL,
    action_type 	VARCHAR(50) 	NOT NULL,
    action_date 	DATETIME 		NOT NULL
)

--Then we should assign teriggers to the table

DELIMITER $$
DROP TRIGGER IF EXISTS payments_after_insert;
CREATE TRIGGER payments_after_insert
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
UPDATE invoices
SET payment_total = payment_total + NEW.amount
WHERE invoice_id = NEW.invoice_id;
INSERT INTO payments_audit
VALUES(NEW.client_id, NEW.date, NEW.amount, 'Insert', WOW());
END $$
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
show VARIABLES -- shows all the system variables
show VARIABLES LIKE 'event%' --shows evants
SET GLOBAL  event_scheduler = on -- The event_scheduler is a feature in MySQL that allows you 
--to schedule and execute recurring events or tasks within the database server. It can be useful for 
--automating various database operations or running periodic maintenance tasks.

CREATE EVENT my_event
  ON SCHEDULE EVERY 1 HOUR
  DO
    CALL my_stored_procedure();


SHOW EVENTS;
SHOW EVENTS LIKE 'yearly%';
DROP EVENTS LIKE 'yearly%';
ALTER EVENT 'eventname' DISABLE-- disable an EVENT
ALTER EVENT 'eventname' ENABLE
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
CREATE EVENT yearly_delete_stale_audit_rows 
ON SCHEDULE
-- AT '2022-08-01'-- for one time start at a specefic date

-- EVERY 2 DAY 

EVERY 1 YEAR STARTS '2022-08-01' ENDS ‘2030-01-01 |

DO BEGIN
DELETE FROM payments_audit 
WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ALTER EVENT yearly_delete_stale_audit_rows-- to modify an existing  event. now you can edit the following code to edit your event 
ON SCHEDULE
-- AT '2022-08-01'-- for one time start at a specefic date

-- EVERY 2 DAY 

EVERY 1 YEAR STARTS '2022-08-01' ENDS ‘2030-01-01 |

DO BEGIN
DELETE FROM payments_audit 
WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
--------------------------------------------------------------------------End of 9th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 10th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRIGGERS are used when  intended to automatically update column b,c,... by updading  column a.

START TRANSACTION;-- TRANSACTIONs are a series of operations the all the operations should be succesful otherwise all the transaction will be faild.
INSERT INTO orders(customer,_id, order_date, status)
VALUES(1, '2022-01-01', 1)
INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);
COMMIT;--this means end of the transaction

START TRANSACTION;-- TRANSACTIONs are a series of operations the all the operations should be succesful otherwise all the transaction will be faild.
INSERT INTO orders(customer,_id, order_date, status)
VALUES(1, '2022-01-01', 1)
INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);
ROLLBACK; --to REVERSE all the operantions of the above transaction
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SHOW VARIABLES LIKE "autocommit"-- autocommit is a programe that controlls the builtins sql  transactios. 
--for example: whenever you will use 'Insert INTO' the SQL run this command in a transaction.
-- if 2 or more clients run a same transaction on a same target(for example a row from a table), then the transcations 
--will be qued. That is, the first the second transaction will be pending untill the first one is comited or rollbacked.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--concurrency probelms:
-- lost of updates
-- dirty reads
-- none repeatable reads 
-- phantom reads 

-- In the following tables you can see the concurrency problems (columns) and the SQL secure layers (Rows) to fix them

-------------------------------------------------------------------------------------------------------------
|                    |   Lost of Updates   |   Dirty Reads   |   Non-repeatable Reads   |   Phantom Reads   |
-------------------------------------------------------------------------------------------------------------
| READ UNCOMMITTED    |          -          |        -       |            -             |         -         |
-------------------------------------------------------------------------------------------------------------
| READ COMMITTED      |          -          |        +       |            -             |         -         |
-------------------------------------------------------------------------------------------------------------
| REPEATABLE READ     |          +          |        +       |            +             |         -         |
-------------------------------------------------------------------------------------------------------------
| SERIALIZABLE        |          +          |        +       |            +             |         +         |
-------------------------------------------------------------------------------------------------------------
-- note that the perfomance decreases while using the more powerful layers 
-- MYSQL default layer is REPEATABLE READ
SHOW VARIABLES LIKE 'transaction_isolation'-- to see the defult  layer
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE -- change the layer		  
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE -- change the layer whitin a session 		  
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE -- change the layer	  globaly 	  

--------------------------------------------------------------------------End of 10th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 11th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARCHAR(n)can stores upto 65k characters
-- TINYTEXT can stores upto 255 characters
-- TEXT can stores upto 65k characters
-- MEDIUMTEXT can stores upto 16m chars
--LONGTEXT can stores upto 4gb chars	
-- TINYINT can stores upto 1 b int. you can store from -128 to 128			  
-- UNSIGNED TINYINT can stores upto 1 b int. you can store from 0 to 255
-- SMALLINT can stores upto 2 b int. you can store from -32000 to 32000	
-- INT can store up to 4 billion integers. You can store from -2,147,483,648 to 2,147,483,647.
-- UNSIGNED INT can store up to 4 billion integers. You can store from 0 to 4,294,967,295.
-- BIGINT can store up to 18 quintillion integers. You can store from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807.
-- UNSIGNED BIGINT can store up to 18 quintillion integers. You can store from 0 to 18,446,744,073,709,551,615.
-- FLOAT can store a floating-point number with up to 7 digits of precision.
-- DOUBLE can store a floating-point number with up to 15 digits of precision.
-- DECIMAL can store a decimal number with high precision and scale.
-- DATE can store a date value in the format 'YYYY-MM-DD'.
-- TIME can store a time value in the format 'HH:MM:SS'.
-- DATETIME can store a date and time value in the format 'YYYY-MM-DD HH:MM:SS'.
-- TIMESTAMP can store a timestamp value representing a specific point in time.
-- BOOLEAN (or BOOL) can store a boolean value (true or false).
-- ENUM can store one value from a predefined list of values.
-- SET can store multiple values from a predefined list of values.		
-- DECIMAL(p,s) shows number of the digits and s is the number of the decimals. and pholds up to 9. there are synonyms for DECIMAL(p,s) such as: FIXED, NUMERIC, DEC
-- ENUM (a,b,c,...)-- holds multi-state variables. for example: ENUM('low', 'medium', 'large')  
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
JSON_OBJECT(k0,v0,k1,v1, k2,v2,...)-- creates a json format where ki is key and vi is value
JSON_EXTRACT(column name, '$.key')-- it gives you the corresponding value 
the above function has an other shorter syntax : column_name -> '$.key'
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT product_id, properties -> '$.dimentions[0]' AS weight-- it retrives the first element of the dimentions
SELECT product_id, properties -> '$.dimentions.name' AS weight-- it retrives the key
SELECT product_id, properties ->> '$.dimentions.name' AS weight-- it retrives the key. it also remove the quotations mark
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++					  
UPDATE products
SET properties = JSON_SET(properties, 'S.weight', 20)
WHERE product_id = 1;

UPDATE products
SET properties = D=JSON_REMOVE(properties, 'S.weight', 20)
WHERE product_id = 1;
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Database design widely accepeted steps from GPT and Neonlearn: 

-Requirements Analysis: This is the initial stage where the goals of the database are defined. This stage typically involves meetings with management, end users, and other stakeholders to identify what needs the database must fulfill.

-Conceptual Design: In this phase, you will determine which data items are to be stored and how they should be organized. This typically involves creating an Entity-Relationship (ER) diagram or a Unified Modeling Language (UML) diagram, which are used to represent data and its relationships in a high-level, database-independent way.

-Logical Design: In the logical design phase, you translate the conceptual model into a logical data model, such as the relational model. This model is independent of any specific database management system, but it represents the structure of the data more concretely than the conceptual model.

-Physical Design: Here, youll consider the specifics of the DBMS that will be used to store and manage the data. You'll need to design physical structures like tables, indexes, and constraints. It's during this phase that performance considerations will largely come into play, such as the decision of which fields should be indexed.

-Implementation: In this phase, the physical design is implemented using the DBMS Data Definition Language (DDL). This involves creating tables, setting up relationships, and defining indexes and constraints.

-Testing: Once the database has been implemented, it needs to be thoroughly tested to ensure data integrity, performance, and security. Testing often involves adding sample data to the database and performing a variety of operations to make sure everything works as expected.

-Operation: After testing, the database goes live and starts serving real data. During operation, monitoring is important to ensure continued performance and reliability.

-Maintenance and Evolution: Over time, the requirements for the database may change, or issues may arise that require adjustments to the design. This is the phase where those adjustments are made.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- For database design you need to go to draw.io and use its tools. There are 2 models there that are very useful. 1-Entity Relation 2-UML
-- FOREIGN KEY in a table means that it gonna be use on as promary key in other table.
--------------------------------------------------------------------------End of 11th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of 12th Session----------------------------------------------------------------------------------------------------------------------------------------------------------
It is very important session and you must see whole the video again and again
--------------------------------------------------------
CREATE DATABASE IF NOT EXISTS sql_store2;
USE sql_store2; I
CREATE TABLE customers
(
customer_id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(58) NOT NULL, 
points INT NOT NULL DEFAULT 0, 
email VARCHAR(255) NOT NULL UNIQUE 
);
------------------------------------------------------
ALTER TABLE customers
ADD last_name VARCHAR(50) NOT NULL AFTER first_name,
ADD city VARCHAR(50) NOT NULL,
MODIFY COLUMN first_name VARCHAR(55) DEFAULT "",
DROP points;
------------------------------------------------------
DROP TABLE IF EXISTS orders; 
CREATE TABLE IF NOT EXISTS orders 
(
order_id INT PRIMARY KEY,
customer_id INT NOT NULL, 
FOREIGN KEY fk_orders_customers(customer_id)
REFERENCES customers (customer_id)-- you should always mention the reference for foreign key

ON UPDATE CASCADE

ON DELETE NO ACTION

)

----------------------------------------------------------------------
ALTER TABLE orders
DROP PRIMARY KEY, 

ADD PRIMARY KEY (order_id), 
DROP FOREIGN KEY fk_orders_customers, 

ADD FOREIGN KEY fk_orders_customers(customer_id)
REFERENCES customers(customer_id)

ON UPDATE CASCADE 

ON DELETE NO ACTION 
----------------------------------------------------------------------
SHOW ENGINS
--------------------------------------------------------------------------End of 12th Session--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------Start of the last Session----------------------------------------------------------------------------------------------------------------------------------------------------------
--load the sql file that is attached to the video.s
EXPLAIN SELECT customer_id FROM customers WHERE state = 'CA'-- this gives you a meta information that howmysql engine selects the customers with satate 'CA'

CREATE INDEX idx_state ON customers (state);-- Indexes are a datastructure that significanlty reduced the query processing by reducing disk/ram I/O calls. They act like phone book that you only need to find the tab with the same later of the client last name.
-- to see how much indexes are effective, run the "EXPLAIN SELECT customer_id FROM customers WHERE state = 'CA'" with and without  this line./

SHOW INDEXES in customers
ANALYZE TABLE customers;
------------------------------------------------------------------------------------
--The below query is count the number of distinct values 
--in the last_name column by considering only the first character 
--of each last_name value.
SELECT COUNT(DISTINCT LEFT(last_name, 1));

-- you can gradually increase the '1' in the above 
--query to see what would be the minimum number of the 
--characters that represents the all last_name recodrds
--then you can use that number for example 'm' in the below query to make sure your indexing is optimum.
Create INDEX ON customers (last_name(m))
--------------------------------------------------------------------------------
CREATE FULLTEXT INDEX idx_title_body ON post(title, body)

select * from 
post 
WHERE MATCH (title, body) AGAINST (react, redux)
--------------------------------------------------------------------------------
CREATE FULLTEXT INDEX idx_title_body ON post(title, body)

select *,  MATCH (title, body) AGAINST (react, redux) from 
post 
WHERE MATCH (title, body) AGAINST (react, redux)-- this query also shows the matching score
---------------------------------------------------------------------------------
-- this query defines a composite index to make it more efficient.
SHOW INDEXES IN customers; 
CREATE INDEX idx_state_points ON customers(state, points);
EXPLAIN SELECT customer_id FROM customers
WHERE state = 'CA’ AND points > 1000; 