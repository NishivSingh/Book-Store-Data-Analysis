-- Creating the database

CREATE DATABASE OnlineBookStore;
USE OnlineBookStore;



-- Creating the tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(30),
    Genre VARCHAR(20),
    Published_Year INT,
    Price NUMERIC(10,2),
    Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
	Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(50),
    Country VARCHAR(50)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	Order_ID INT PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10,2)
);


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;



-- Basic questions

-- 1) Retrieve all books in the "Fiction" genre.
SELECT * FROM Books
WHERE Genre = "Fiction";

-- 2) Find books published after the year 1950.
SELECT * FROM Books
WHERE Published_Year > 1950;

-- 3) List all customers from Canada.
SELECT * FROM Customers
WHERE Country = "Canada";

-- 4) Show orders placed in November 2023.
SELECT * FROM Orders
WHERE MONTH(Order_Date) = 11 AND YEAR(Order_Date) = 2023;



