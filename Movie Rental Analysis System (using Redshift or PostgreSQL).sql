CREATE DATABASE MovieRental;
Use MovieRental;

CREATE TABLE rental_data (
MOVIE_ID INTEGER,
CUSTOMER_ID INTEGER,
GENRE VARCHAR(50),
RENTAL_DATE DATE,
RETURN_DATE DATE,
RENTAL_FEE NUMERIC(10, 2)
);
INSERT INTO rental_data (MOVIE_ID, CUSTOMER_ID, GENRE, RENTAL_DATE,
RETURN_DATE, RENTAL_FEE)
VALUES
(1, 101, 'Action', '2025-05-01', '2025-05-05', 4.99),
(2, 102, 'Comedy', '2025-05-02', '2025-05-07', 3.49),
(3, 103, 'Drama', '2025-05-03', '2025-05-10', 5.99),
(4, 104, 'Horror', '2025-05-04', '2025-05-11', 6.49),
(5, 105, 'Romance', '2025-05-05', '2025-05-12', 3.99),
(6, 106, 'Action', '2025-05-06', '2025-05-13', 4.49),
(7, 107, 'Comedy', '2025-05-07', '2025-05-14', 2.99),
(8, 108, 'Action', '2025-05-08', '2025-05-15', 5.49),
(9, 109, 'Drama', '2025-05-09', '2025-05-16', 4.99),
(10, 110, 'Horror', '2025-05-10', '2025-05-17', 7.99),
(11, 111, 'Romance', '2025-05-11', '2025-05-18', 3.49),
(12, 112, 'Comedy', '2025-05-12', '2025-05-19', 2.49),
(13, 113, 'Action', '2025-05-13', '2025-05-20', 5.99),
(14, 114, 'Drama', '2025-05-14', '2025-05-21', 6.49),
(15, 115, 'Horror', '2025-05-15', '2025-05-22', 7.49);
SELECT * FROM rental_data;
--Drill Down: Analyze rentals from genre to individual movie level.
SELECT GENRE, MOVIE_ID, SUM(RENTAL_FEE) AS TOTAL_RENTAL_FEE
FROM rental_data
GROUP BY GENRE, MOVIE_ID
ORDER BY GENRE, TOTAL_RENTAL_FEE DESC;

--Rollup: Summarize total rental fees by genre and then overall
SELECT GENRE, SUM(RENTAL_FEE) AS TOTAL_RENTAL_FEE
FROM rental_data
GROUP BY GROUPING SETS ((GENRE), ())
ORDER BY TOTAL_RENTAL_FEE DESC;

--Cube: Analyze total rental fees across combinations of genre, renta date, and customer.
SELECT GENRE, RENTAL_DATE, CUSTOMER_ID,SUM(RENTAL_FEE) AS
TOTAL_RENTAL_FEE
FROM rental_data
GROUP BY cube(GENRE, RENTAL_DATE, CUSTOMER_ID)
ORDER BY TOTAL_RENTAL_FEE;

--Slice: Extract rentals only from the ‘Action’ genre
SELECT GENRE, MOVIE_ID, CUSTOMER_ID, RENTAL_DATE, RETURN_DATE,
RENTAL_FEE
FROM rental_data
WHERE GENRE = 'Action';

--Dice: Extract rentals where GENRE = 'Action' or 'Drama' and RENTAL_DATE is in the last 3 months.
SELECT GENRE, MOVIE_ID, CUSTOMER_ID, RENTAL_DATE, RETURN_DATE,
RENTAL_FEE
FROM rental_data
WHERE (GENRE = 'Action' OR GENRE = 'Drama') AND RENTAL_DATE >=
current_date - interval '3 months';