CREATE TABLE Books (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(50),
    AUTHOR VARCHAR(30),
    GENRE VARCHAR(20),
    YEAR_PUBLISHED DATE,
    AVAILABLE_COPIES INT
);

CREATE TABLE Members (
    MEMBER_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    EMAIL VARCHAR(30),
    PHONE_NO BIGINT,
    ADDRESS VARCHAR(80),
    MEMBERSHIP_DATE DATE
);

CREATE TABLE BorrowingRecords (
    BORROW_ID INT PRIMARY KEY,
    MEMBER_ID INT,
    BOOK_ID INT,
    RETURN_DATE DATE,
    BORROW_DATE DATE,
    FOREIGN KEY (MEMBER_ID) REFERENCES Members(MEMBER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES Books(BOOK_ID)
);

INSERT INTO Books (BOOK_ID, TITLE, AUTHOR, GENRE, YEAR_PUBLISHED, AVAILABLE_COPIES) 
VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11', 3),
(2, '1984', 'George Orwell', 'Dystopian', '1949-06-08', 5),
(3, 'Moby-Dick', 'Herman Melville', 'Adventure', '1851-10-18', 2),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 4),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1925-04-10', 6),
(6, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '1951-07-16', 3),
(7, 'Brave New World', 'Aldous Huxley', 'Dystopian', '1932-08-01', 4),
(8, 'War and Peace', 'Leo Tolstoy', 'Historical Fiction', '1869-03-01', 1),
(9, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '1937-09-21', 8),
(10, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', '1954-07-29', 2),
(11, 'The Invisible Man', 'H.G. Wells', 'Fiction', '1897-01-01', 3),
(12, 'The Picture of Dorian Gray', 'Oscar Wilde', 'Fiction', '1890-06-01', 4),
(13, 'The Stranger', 'Albert Camus', 'Fiction', '1942-05-01', 5),
(14, 'The Bell Jar', 'Sylvia Plath', 'Fiction', '1963-01-14', 2),
(15, 'One Hundred Years of Solitude', 'Gabriel García Márquez', 'Fiction', '1967-06-05', 4);

INSERT INTO Members (MEMBER_ID, NAME, EMAIL, PHONE_NO, ADDRESS, MEMBERSHIP_DATE) 
VALUES
(1, 'John Doe', 'johndoe@email.com', 1234567890, '123 Elm St, Springfield', '2022-01-15'),
(2, 'Jane Smith', 'janesmith@email.com', 2345678901, '456 Oak St, Springfield', '2021-08-22'),
(3, 'Alice Johnson', 'alicej@email.com', 3456789012, '789 Pine St, Springfield', '2023-03-10'),
(4, 'Bob Lee', 'boblee@email.com', 4567890123, '321 Maple St, Springfield', '2022-05-01'),
(5, 'Charlie Brown', 'charlieb@email.com', 5678901234, '654 Birch St, Springfield', '2022-09-17'),
(6, 'David White', 'davidw@email.com', 6789012345, '987 Cedar St, Springfield', '2023-02-07'),
(7, 'Emily Davis', 'emilyd@email.com', 7890123456, '123 Spruce St, Springfield', '2021-06-19'),
(8, 'Frank Green', 'frankg@email.com', 8901234567, '432 Willow St, Springfield', '2023-01-30'),
(9, 'Grace Black', 'graceb@email.com', 9012345678, '876 Chestnut St, Springfield', '2021-11-11'),
(10, 'Henry King', 'henryk@email.com', 1234987650, '246 Redwood St, Springfield', '2023-04-25'),
(11, 'Isabel Martinez', 'isabelm@email.com', 1122334455, '543 Redwood St, Springfield', '2022-07-17'),
(12, 'Jack White', 'jackw@email.com', 9988776655, '654 Oak St, Springfield', '2023-05-12'),
(13, 'Kathy Brown', 'kathyb@email.com', 7766554433, '234 Birch St, Springfield', '2021-12-05'),
(14, 'Liam Turner', 'liamt@email.com', 6655443322, '876 Pine St, Springfield', '2022-11-28'),
(15, 'Megan Clark', 'meganc@email.com', 5544332211, '345 Cedar St, Springfield', '2023-02-19'),
(16, 'Sophia Turner', 'sophiat@email.com', 1234509876, '123 Birch St, Springfield', '2023-05-20');

INSERT INTO BorrowingRecords (BORROW_ID, MEMBER_ID, BOOK_ID, RETURN_DATE, BORROW_DATE)
VALUES
(1, 1, 5, '2023-06-30', '2023-06-01'),
(2, 1, 7, '2023-07-15', '2023-07-01'),
(3, 1, 8, '2023-08-01', '2023-07-05'),
(4, 2, 8, '2023-07-15', '2023-07-01'),
(5, 2, 6, '2023-06-25', '2023-06-05'),
(6, 2, 9, '2023-07-10', '2023-06-20'),
(7, 3, 1, '2023-05-15', '2023-05-01'),
(8, 3, 3, '2023-07-01', '2023-04-15'),
(9, 3, 2, NULL, '2023-06-05'),
(10, 4, 4, '2023-08-01', '2023-07-05'),
(11, 4, 1, '2023-07-10', '2023-06-15'),
(12, 4, 5, '2023-07-15', '2023-07-01'),
(13, 5, 7, '2023-06-25', '2023-06-05'),
(14, 5, 3, '2023-07-10', '2023-06-25'),
(15, 5, 1, NULL, '2023-07-15'),
(17, 7, 1, '2023-09-01', '2023-08-10'),
(18, 8, 1, '2023-08-10', '2023-07-25'),
(19, 9, 1, '2023-09-15', '2023-08-20'),
(20, 10, 1, '2023-08-20', '2023-08-01'),
(21, 1, 5, '2023-09-01', '2023-08-15'),
(22, 2, 5, '2023-09-05', '2023-08-18'),
(23, 3, 5, '2023-09-10', '2023-08-20'),
(24, 4, 5, '2023-09-15', '2023-08-22'),
(25, 5, 5, '2023-09-20', '2023-08-25'),
(26, 6, 5, '2023-09-25', '2023-08-30'),
(27, 7, 5, '2023-10-01', '2023-09-05'),
(28, 8, 5, '2023-10-05', '2023-09-10'),
(29, 9, 5, '2023-10-10', '2023-09-15'),
(30, 10, 5, '2023-10-15', '2023-09-20');

-- Information Retrieval--

-- Retrieve a list of books currently borrowed by a specific member
SELECT B.BOOK_ID, B.TITLE
FROM BorrowingRecords BR
JOIN Books B ON BR.BOOK_ID = B.BOOK_ID
WHERE BR.MEMBER_ID = 2;

-- Find members who have overdue books (borrowed more than 30 days ago, not returned)
SELECT B.BOOK_ID, B.TITLE, B.AUTHOR, B.GENRE, B.YEAR_PUBLISHED, BR.BORROW_DATE
FROM BorrowingRecords BR
JOIN Books B ON BR.BOOK_ID = B.BOOK_ID
WHERE BR.RETURN_DATE IS NULL
AND BR.BORROW_DATE <= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Retrieve books by genre along with the count of available copies.
SELECT b.GENRE,
       COUNT(b.BOOK_ID) AS BOOK_COUNT,
       SUM(b.AVAILABLE_COPIES) AS TOTAL_AVAILABLE_COPIES
FROM Books b
GROUP BY b.GENRE;

-- Find the most borrowed book(s) overall.
SELECT b.TITLE, b.AUTHOR, COUNT(br.BORROW_ID) AS BORROW_COUNT
FROM BorrowingRecords br
JOIN Books b ON br.BOOK_ID = b.BOOK_ID
GROUP BY b.BOOK_ID, b.TITLE, b.AUTHOR
ORDER BY BORROW_COUNT DESC
LIMIT 1;

-- Retrieve members who have borrowed books from at least three different genres.
SELECT M.MEMBER_ID, M.NAME
FROM BorrowingRecords BR
JOIN Books B ON BR.BOOK_ID = B.BOOK_ID
JOIN Members M ON BR.MEMBER_ID = M.MEMBER_ID
GROUP BY M.MEMBER_ID, M.NAME
HAVING COUNT(DISTINCT B.GENRE) >= 3;

-- Reporting and Analytics --

-- Calculate the total number of books borrowed per month
SELECT MONTH(BORROW_DATE) AS Month, COUNT(*) AS Total_Books_Borrowed
FROM BorrowingRecords
GROUP BY MONTH(BORROW_DATE)
ORDER BY Month;

-- Find the top three most active members based on the number of books borrowed
SELECT br.MEMBER_ID, COUNT(br.BORROW_ID) AS No_of_Books_Borrowed, m.NAME
FROM BorrowingRecords br
JOIN Members m ON br.MEMBER_ID = m.MEMBER_ID
GROUP BY br.MEMBER_ID, m.NAME
ORDER BY No_of_Books_Borrowed DESC, m.NAME ASC
LIMIT 3;

-- Retrieve authors whose books have been borrowed at least 10 times
SELECT b.AUTHOR, COUNT(br.BOOK_ID) AS Total_Borrow
FROM BorrowingRecords br
JOIN Books b ON b.BOOK_ID = br.BOOK_ID
GROUP BY b.AUTHOR
HAVING COUNT(br.BOOK_ID) >= 10;

-- Identify members who have never borrowed a book
SELECT m.MEMBER_ID, m.NAME, m.EMAIL
FROM Members m
LEFT JOIN BorrowingRecords br ON m.MEMBER_ID = br.MEMBER_ID
WHERE br.BORROW_ID IS NULL;
