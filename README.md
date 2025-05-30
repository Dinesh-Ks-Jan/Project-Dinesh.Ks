Project Title: Library Management System (using SQL)
Project Description:
Design and develop a Library Management System using SQL. The project should
involve three tables: Books, Members, BorrowingRecords. The system will manage book
inventories, member details, and borrowing transactions.
The project will include the following tasks:
Database Creation:
a) Create Books table with columns BOOK_ID, TITLE, AUTHOR, GENRE,
YEAR_PUBLISHED, AVAILABLE_COPIES.
b) Create Members table with columns MEMBER_ID, NAME, EMAIL, PHONE_NO,
ADDRESS, MEMBERSHIP_DATE.
c) Create BorrowingRecords table with columns BORROW_ID, MEMBER_ID,
BOOK_ID, BORROW_DATE, RETURN_DATE. Set foreign key constraints linking
MEMBER_ID to Members and BOOK_ID to Books.
Data Creation:
Insert sample data into all three tables.
Information Retrieval:
a) Retrieve a list of books currently borrowed by a specific member.
b) Find members who have overdue books (borrowed more than 30 days ago, not
returned).
c) Retrieve books by genre along with the count of available copies.
d) Find the most borrowed book(s) overall.
e) Retrieve members who have borrowed books from at least three different genres.
Reporting and Analytics:
a) Calculate the total number of books borrowed per month.
b) Find the top three most active members based on the number of books
borrowed.
c) Retrieve authors whose books have been borrowed at least 10 times.
d) Identify members who have never borrowed a book.



Project: Employee Payroll Management System (PostgreSQL)
Objective:
Design and implement an employee payroll system to store, manage, and analyze
salary data.
The project will include the following tasks:
Database Setup:
Create a database named payroll_database.
Create a table employees with columns: EMPLOYEE_ID (integer), NAME (text),
DEPARTMENT (text), EMAIL (text), PHONE_NO (numeric), JOINING_DATE (date), SALARY
(numeric), BONUS (numeric), TAX_PERCENTAGE (numeric).
Data Entry:
Insert 10 sample employee records.
Payroll Queries:
a) Retrieve the list of employees sorted by salary in descending order.
b) Find employees with a total compensation (SALARY + BONUS) greater than
$100,000.
c) Update the bonus for employees in the ‘Sales’ department by 10%.
d) Calculate the net salary after deducting tax for all employees.
e) Retrieve the average, minimum, and maximum salary per department.
Advanced Queries:
a) Retrieve employees who joined in the last 6 months.
b) Group employees by department and count how many employees each has.
c) Find the department with the highest average salary.
d) Identify employees who have the same salary as at least one other employee.


Project: Online Store Order Management System (PostgreSQL)
Objective:
Create a system to manage orders, customers, and products for an online store.
The project will include the following tasks:
Database Creation:
Create a database named OnlineStore.
Create tables:
Customers (CUSTOMER_ID, NAME, EMAIL, PHONE, ADDRESS)
Products (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE, STOCK)
Orders (ORDER_ID, CUSTOMER_ID, PRODUCT_ID, QUANTITY, ORDER_DATE)
Set up foreign keys linking Orders to Customers and Products.
Data Creation:
Insert sample data for customers, products, and orders.
Order Management:
a) Retrieve all orders placed by a specific customer.
b) Find products that are out of stock.
c) Calculate the total revenue generated per product.
d) Retrieve the top 5 customers by total purchase amount.
e) Find customers who placed orders in at least two different product categories.
Analytics:
a) Find the month with the highest total sales.
b) Identify products with no orders in the last 6 months.
c) Retrieve customers who have never placed an order.
d) Calculate the average order value across all orders.



Project: Movie Rental Analysis System (using Redshift or PostgreSQL)
Objective:
Perform advanced analysis on movie rental data using OLAP operations.
The project will include the following tasks:
Database Creation:
Create a database named MovieRental.
Create table rental_data with columns:
MOVIE_ID (integer),
CUSTOMER_ID (integer),
GENRE (varchar),
RENTAL_DATE (date),
RETURN_DATE (date),
RENTAL_FEE (numeric).
Data Creation:
Insert 10–15 sample rental records.
OLAP Operations:
a) Drill Down: Analyze rentals from genre to individual movie level.
b) Rollup: Summarize total rental fees by genre and then overall.
c) Cube: Analyze total rental fees across combinations of genre, rental date, and
customer.
d) Slice: Extract rentals only from the ‘Action’ genre.
e) Dice: Extract rentals where GENRE = 'Action' or 'Drama' and RENTAL_DATE is in
the last 3 months.
