CREATE DATABASE LIBRARY;
USE LIBRARY;
CREATE TABLE MEMBER (
MEMBER_ID INT NOT NULL PRIMARY KEY,
USER_NAME VARCHAR(20) NOT NULL,
PASSWORD VARCHAR(25) NOT NULL,
MEMBER_NAME VARCHAR(15) NOT NULL,
AGE INT NOT NULL,
AREA_OF_INTEREST VARCHAR(35),
READING_LEVEL VARCHAR(15) 
);
INSERT INTO MEMBER(MEMBER_ID,USER_NAME,PASSWORD,MEMBER_NAME,AGE,AREA_OF_INTEREST,READING_LEVEL)
VALUES
(1, 'USER1', 'PASSWORD1', 'ALICE', 25, 'READING', 'INTERMEDIATE'),
(2, 'USER2', 'PASSWORD2', 'BOB', 30, 'GAMING', 'BEGINNER'),
(3, 'USER3', 'PASSWORD3', 'CHARLIE', 22, 'COOKING', 'ADVANCED'),
(4, 'USER4', 'PASSWORD4', 'DAVID', 28, 'TRAVELING', 'INTERMEDIATE'),
(5, 'USER5', 'PASSWORD5', 'EVE', 35, 'PHOTOGRAPHY', 'BEGINNER'),
(6, 'USER6', 'PASSWORD6', 'FRANK', 27, 'MUSIC', 'ADVANCED'),
(7, 'USER7', 'PASSWORD7', 'GRACE', 24, 'SPORTS', 'INTERMEDIATE'),
(8, 'USER8', 'PASSWORD8', 'HANK', 32, 'WRITING', 'BEGINNER'),
(9, 'USER9', 'PASSWORD9', 'IVY', 29, 'ART', 'ADVANCED'),
(10, 'USER10', 'PASSWORD10', 'JACK', 26, 'TECHNOLOGY', 'INTERMEDIATE');
SELECT * FROM MEMBER;

CREATE TABLE ADMIN(
ADMIN_ID INT NOT NULL PRIMARY KEY,
USER_NAME VARCHAR(25) NOT NULL,
PASSWORD VARCHAR(25) NOT NULL,
AGE INT,
LANGUAGES VARCHAR(23)
);
INSERT INTO ADMIN (ADMIN_ID, USER_NAME, PASSWORD, AGE, LANGUAGES) VALUES
(1, 'ADMIN1', 'ADMINPASS1', 45, 'ENGLISH, TAMIL,');

CREATE TABLE BOOK (
BOOK_ID VARCHAR(10) NOT NULL PRIMARY KEY,
BOOK_NAME VARCHAR(50) NOT NULL,
BOOK_AUTHOR VARCHAR(50),
GENRE VARCHAR(30) NOT NULL,
BOOK_STATUS VARCHAR(30) NOT NULL,
COMMENTS VARCHAR(100)
);
INSERT INTO BOOK (BOOK_ID, BOOK_NAME, BOOK_AUTHOR, GENRE, BOOK_STATUS, COMMENTS) VALUES 
('B001', 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 'Available', 'Classic novel'),
('B002', '1984', 'George Orwell', 'Dystopian', 'Checked Out', 'Dystopian classic'),
('B003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 'Available', 'American classic'),
('B004', 'Moby Dick', 'Herman Melville', 'Adventure', 'Available', 'Epic sea story'),
('B005', 'Pride and Prejudice', 'Jane Austen', 'Romance', 'Checked Out', 'Romantic novel'),
('B006', 'War and Peace', 'Leo Tolstoy', 'Historical', 'Available', 'Historical epic'),
('B007', 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 'Available', 'Coming-of-age story'),
('B008', 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 'Checked Out', 'Fantasy adventure'),
('B009', 'Brave New World', 'Aldous Huxley', 'Dystopian', 'Available', 'Dystopian novel'),
('B010', 'The Odyssey', 'Homer', 'Epic', 'Available', 'Ancient epic'),
('B011', 'Crime and Punishment', 'Fyodor Dostoevsky', 'Psychological', 'Checked Out', 'Psychological novel'),
('B012', 'The Brothers Karamazov', 'Fyodor Dostoevsky', 'Philosophical', 'Available', 'Philosophical novel'),
('B013', 'Jane Eyre', 'Charlotte Brontë', 'Romance', 'Available', 'Romantic novel'),
('B014', 'Wuthering Heights', 'Emily Brontë', 'Romance', 'Checked Out', 'Romantic novel'),
('B015', 'The Divine Comedy', 'Dante Alighieri', 'Epic', 'Available', 'Epic poem'),
('B016', 'The Iliad', 'Homer', 'Epic', 'Available', 'Ancient epic'),
('B017', 'Don Quixote', 'Miguel de Cervantes', 'Adventure', 'Checked Out', 'Adventure novel'),
('B018', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 'Available', 'Fantasy epic'),
('B019', 'Anna Karenina', 'Leo Tolstoy', 'Romance', 'Available', 'Romantic novel'),
('B020', 'The Grapes of Wrath', 'John Steinbeck', 'Fiction', 'Checked Out', 'American classic');

CREATE TABLE BOOK_REQUEST (
REQUEST_ID INT NOT NULL,
BOOK_ID VARCHAR(10) NOT NULL,
MEMBER_ID INT NOT NULL,
REQUEST_DATE DATE
FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID),
FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);
INSERT INTO BOOK_REQUEST (REQUEST_ID, BOOK_ID, MEMBER_ID, REQUEST_DATE) VALUES
(1, 'B001', 1, '2024-09-01'),
(2, 'B002', 2, '2024-09-02'),
(3, 'B003', 3, '2024-09-03'),
(4, 'B004', 4, '2024-09-04'),
(5, 'B005', 5, '2024-09-05');

CREATE TABLE MY_HISTORY (
MEMBER_ID INT NOT NULL PRIMARY KEY,
MY_BOOKS VARCHAR(10) NOT NULL,
RETURN_STATUS VARCHAR(15),
FINE_AMOUNT INT,
MY_STREAKS INT NOT NULL
FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
FOREIGN KEY (MY_BOOKS) REFERENCES BOOK(BOOK_ID)
);
INSERT INTO MY_HISTORY (MEMBER_ID, MY_BOOKS, RETURN_STATUS, FINE_AMOUNT, MY_STREAKS) VALUES
(1, 'B001', 'Returned', 0, 5),
(2, 'B002', 'Overdue', 50, 3),
(3, 'B003', 'Returned', 0, 7),
(4, 'B004', 'Lost', 100, 2),
(5, 'B005', 'Returned', 0, 6),
(6, 'B006', 'Overdue', 30, 4),
(7, 'B007', 'Returned', 0, 8),
(8, 'B008', 'Returned', 0, 5),
(9, 'B009', 'Overdue', 20, 3),
(10, 'B010', 'Returned', 0, 9);

CREATE TABLE BORROWING(
MEMBER_ID INT NOT NULL PRIMARY KEY,
BOOK_ID VARCHAR(10) NOT NULL,
APPROVE_STATUS VARCHAR(15),
BORROW_DATE DATE,
RETURN_DATE DATE NOT NULL,
FINE_AMOUNT INT
FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
INSERT INTO BORROWING (MEMBER_ID, BOOK_ID, APPROVE_STATUS, BORROW_DATE, RETURN_DATE, FINE_AMOUNT) VALUES
(1, 'B001', 'Approved', '2024-09-01', '2024-09-15', 0),
(2, 'B002', 'Pending', '2024-09-02', '2024-09-16', 0),
(3, 'B003', 'Approved', '2024-09-03', '2024-09-17', 0),
(4, 'B004', 'Rejected', '2024-09-04', '2024-09-18', 0),
(5, 'B005', 'Approved', '2024-09-05', '2024-09-19', 0),
(6, 'B006', 'Approved', '2024-09-06', '2024-09-20', 10),
(7, 'B007', 'Pending', '2024-09-07', '2024-09-21', 0),
(8, 'B008', 'Approved', '2024-09-08', '2024-09-22', 0),
(9, 'B009', 'Rejected', '2024-09-09', '2024-09-23', 0),
(10, 'B010', 'Approved', '2024-09-10', '2024-09-24', 5);



CREATE TABLE NOTIFICATION_TYPE (
NOTIFICATION_ID VARCHAR(10) NOT NULL PRIMARY KEY,
BOOK_ID VARCHAR(10) NOT NULL,
BOOK_NAME VARCHAR(50) NOT NULL,
APPROVE_STATUS VARCHAR(15) NOT NULL,
RETURN_STATUS VARCHAR(15) NOT NULL,
RETURN_DATE DATE
FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_ID, BOOK_ID, BOOK_NAME, APPROVE_STATUS, RETURN_STATUS, RETURN_DATE) VALUES
('N001', 'B001', 'To Kill a Mockingbird', 'Approved', 'Returned', '2024-09-15'),
('N002', 'B002', '1984', 'Pending', 'Overdue', '2024-09-16'),
('N003', 'B003', 'The Great Gatsby', 'Approved', 'Returned', '2024-09-17'),
('N004', 'B004', 'Moby Dick', 'Rejected', 'Lost', '2024-09-18'),
('N005', 'B005', 'Pride and Prejudice', 'Approved', 'Returned', '2024-09-19'),
('N006', 'B006', 'War and Peace', 'Approved', 'Overdue', '2024-09-20'),
('N007', 'B007', 'The Catcher in the Rye', 'Pending', 'Returned', '2024-09-21'),
('N008', 'B008', 'The Hobbit', 'Approved', 'Returned', '2024-09-22'),
('N009', 'B009', 'Brave New World', 'Rejected', 'Overdue', '2024-09-23'),
('N010', 'B010', 'The Odyssey', 'Approved', 'Returned', '2024-09-24');

CREATE TABLE DASHBOARD (
MEMBER_ID INT NOT NULL,
ADMIN_ID INT NOT NULL,
NOTIFICATION_ID VARCHAR(10) NOT NULL,
BOOK_ID VARCHAR(10) NOT NULL
FOREIGN KEY(NOTIFICATION_ID) REFERENCES NOTIFICATION_TYPE(NOTIFICATION_ID)
);

INSERT INTO DASHBOARD (MEMBER_ID, ADMIN_ID, NOTIFICATION_ID, BOOK_ID) VALUES
(1, 1, 'N001', 'B001'),
(2, 1, 'N002', 'B002'),
(3, 1, 'N003', 'B003'),
(4, 1, 'N004', 'B004'),
(5, 1, 'N005', 'B005'),
(6, 1, 'N006', 'B006'),
(7, 1, 'N007', 'B007'),
(8, 1, 'N008', 'B008'),
(9, 1, 'N009', 'B009'),
(10, 1, 'N010', 'B010');

SELECT * FROM MEMBER;
SELECT * FROM ADMIN;
SELECT * FROM BOOK;
SELECT * FROM BOOK_REQUEST;
SELECT * FROM BORROWING;
SELECT * FROM DASHBOARD;
SELECT * FROM NOTIFICATION_TYPE;
SELECT * FROM MY_HISTORY;
