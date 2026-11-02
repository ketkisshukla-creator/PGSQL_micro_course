	CREATE TABLE EMPLOYEE (
	EMP_ID SERIAL PRIMARY KEY,
	EMP_NAME VARCHAR(100) NOT NULL,
	EMP_POS VARCHAR(100),
	EMP_DEP VARCHAR(100),
		HIRE_DATE DATE,
	SALARY NUMERIC(10, 2)
	);

SELECT* FROM EMPLOYEE;

INSERT INTO
	EMPLOYEE (EMP_NAME, EMP_POS, EMP_DEP, HIRE_DATE, SALARY)
VALUES
	(
		'Ajit sharma',
		'data analyst',
		'data science',
		'2022-05-15',
		65000.00
	) (
		'Rajat Trivedi',
		'Business analyst',
		'data science',
		'2022-05-17',
		60000.00
	) (
		'Ketki Shukla',
		'data analyst',
		'data science',
		'2026-05-18',
		85000.00
	) (
		'A sharma',
		'data analyst',
		'data science',
		'2022-05-15',
		65000.00
	) (
		'Ajit sharma',
		'data analyst',
		'data science',
		'2022-05-15',
		65000.00
	)
CREATE TABLE STUDENT (
	STU_ID SERIAL PRIMARY KEY,
	STU_NAME VARCHAR(100) NOT NULL,
	EMAIL VARCHAR(100) UNIQUE,
	AGE INTEGER CHECK (AGE > 18),
	REG_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TAB

SELECT
	*
FROM
	STUDENT;

-----INSETING DATA INTO TABLE------
INSERT INTO
	STUDENT (STU_ID, full_name, EMAIL, AGE)
VALUES
	(10,'PRIYA DUBEY', 'PRIYA@gmail.com', 18)
	
SELECT
	STU_ID,
	STU_NAME,
	AGE
FROM
	STUDENT;

----UPDATE DATA IN TABLE
UPDATE STUDENT
SET
	AGE = AGE + 1
WHERE
	EMAIL LIKE '%@gmail.com';

SELECT *
FROM STUDENT
ORDER BY	STU_ID ASC;

----RENAME THE USENAME COLUMN
ALTER TABLE student
RENAME COLUMN stu_name TO full_name

--tochange the age  column data type from int to small int	
ALTER TABLE student
ALTER COLUMN age TYPE SMALLINT;

ALTER TABLE student
DROP CONSTRAINT age;

ALTER TABLE student
ADD CONSTRAINT age CHECK(age>=18);

COPY
STUDENT2 (STU_ID, STU_NAME,EMAIL,AGE)
FROM 'C:\Users\shail\OneDrive\Desktop\w.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE STUDENT3 (
	STU_ID SERIAL PRIMARY KEY,
	STU_NAME VARCHAR(100) NOT NULL,
	EMAIL VARCHAR(100) UNIQUE,
	AGE INTEGER CHECK (AGE > 18)
);


SELECT *
FROM STUDENT3
ORDER BY	STU_ID ASC;

DROP TABLE EMPLOYEE1;

CREATE  TABLE EMPLOYEE1
(
employee_id	SERIAL PRIMARY KEY,
first_name	VARCHAR(100) NOT NULL,
last_name	VARCHAR(100) NOT NULL,
department	VARCHAR(100) NOT NULL,
salary	    NUMERIC,
joining_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
age          INTEGER CHECK (AGE > 18)

);


COPY
EMPLOYEE1 (employee_id, first_name,last_name,department,salary,joining_date,age)
FROM 'C:\Users\shail\OneDrive\Desktop\employee_data.csv'
DELIMITER ','
CSV HEADER;


SELECT *
FROM employee1
ORDER BY	employee_id ASC;

---query1

SELECT first_name,last_name ,
salary,(salary *0.10) AS BONUS
FROM EMPLOYEE1;

----query2

SELECT first_name,last_name,salary,
(salary*12)AS ANNUAL_SALARY,
(salary*0.05)AS INCREMENT,
(salary+salary*0.05)AS NEW_SALARY
FROM EMPLOYEE1;

SELECT * FROM EMPLOYEE1
WHERE age=30;

SELECT * FROM EMPLOYEE1
WHERE age!=30;

SELECT * FROM EMPLOYEE1
WHERE salary<=50000;

SELECT *  FROM EMPLOYEE1
WHERE SALARY  BETWEEN 40000 AND 60000;

SELECT *  FROM EMPLOYEE1
WHERE FIRST_NAME  LIKE '%e' ;


SELECT *  FROM EMPLOYEE1
WHERE DEPARTMENT IN ('Finance','Marketing')

SELECT * FROM 
STUDENT3
WHERE email IS NULL;

SELECT *  FROM EMPLOYEE1
WHERE OR

select * from products;

----uppercase
SELECT UPPER(CATEGORY) AS CATEGORY_UPPER 
FROM PRODUCTS;

-----LOWERCASE
SELECT LOWER(CATEGORY) AS CATEGORY_LOWER
FROM PRODUCTS;

---CONCATENATE

SELECT CONCAT(PRODUCT_NAME,'-',CATEGORY)AS PRODUCT_DETAILS
FROM PRODUCTS;

-----SUBSTRING
SELECT SUBSTRING(PRODUCT_NAME,2,5)AS SHORT_NAME
FROM PRODUCTS;
--------COUNT LENGTH
SELECT PRODUCT_NAME, LENGTH(PRODUCT_NAME) AS COUNT_OF_CHAR
FROM PRODUCTS;

-------REMOVE SPACES FROM STRING
SELECT  TRIM(' MONITOR    ')AS CLEAN_TEXT
FROM PRODUCTS;

-------REPLACE
select REPLACE(PRODUCT_NAME,'PHONE','DEVICE') AS NEW_NAME
from products;


-------LEFT

SELECT LEFT(CATEGORY,3) AS CATEGORY_CHARACTER
FROM PRODUCTS;

---JSON study
CREATE TABLE books (
 id SERIAL PRIMARY KEY,
 client TEXT NOT NULL,
 DATA JSONb NOT NULL
);


INSERT INTO books(client, DATA) VALUES (
 'Joe',
 '{ "title": "Siddhartha", "author": { "first_name": "Herman", "last_name": "Hesse" } }'
),(
 'Jenny',
 '{ "title": "Dharma Bums", "author": { "first_name": "Jack", "last_name": "Kerouac" } }'
),(
 'Jenny',
 '{ "title": "100 años de soledad", "author": { "first_name": "Gabo", "last_name": "Marquéz" }
}'
);


SELECT * FROM BOOKS;

SELECT client,
 DATA->'title' AS title
 FROM BOOKS;

 SELECT client,
 DATA->'author'->'last_name' AS author
 FROM BOOKS;


 SELECT
 client,
DATA->'title' AS title
FROM books
 WHERE DATA->'author'->>'last_name' = 'Kerouac';


 SELECT
 client,
DATA->'title' AS title
FROM books
 WHERE DATA->'author'->>'first_name' = 'Jack';

-----real life eg

CREATE TABLE events (
 NAME varchar(200),
 visitor_id varchar(200),
 properties json,
 browser json
);



INSERT INTO events (NAME, visitor_id, properties, browser) VALUES
(
 'pageview', '1',
 '{ "page": "/" }',
 '{ "name": "Chrome", "os": "Mac", "resolution": { "x": 1440, "y": 900 } }'
),(
 'pageview', '2',
 '{ "page": "/" }',
 '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1920, "y": 1200 } }'
),(
 'pageview', '1',
 '{ "page": "/account" }',
 '{ "name": "Chrome", "os": "Mac", "resolution": { "x": 1440, "y": 900 } }'
),(
 'purchase', '5',
 '{ "amount": 10 }',
 '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1024, "y": 768 } }'
),(
 'purchase', '15',
 '{ "amount": 200 }',
 '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1280, "y": 800 } }'
),(
 'purchase', '15',
 '{ "amount": 500 }',
 '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1280, "y": 800 } }'
);


SELECT * FROM events;

SELECT browser->>'name' AS BROWSER,COUNT(BROWSER)
FROM EVENTS
GROUP BY browser->>'name';