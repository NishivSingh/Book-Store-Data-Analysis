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

-- 5) Retrieve the total stock of books available.
SELECT SUM(Stock) AS total_stock
FROM Books;

-- 6) Find the details of the most expensive book.
SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT * FROM Orders
WHERE quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20.
SELECT * FROM Orders
WHERE Total_Amount > 20;

-- 9) List all genres available in the Books table.
SELECT DISTINCT Genre FROM Books;

-- 10) Calculate total revenue generated from all orders.
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders;


-- Intermediate Questions

-- 1) Retrieve the total number of books sold for each genre.
SELECT Genre, SUM(Quantity) AS total_num
FROM Books
INNER JOIN Orders
ON Books.Book_ID = Orders.Book_ID
GROUP BY Genre;

-- 2) Find the average price of books in the "Fantasy" genre.
SELECT Genre, AVG(Price) AS Average_price
FROM Books
WHERE Genre = "Fantasy";

-- 3) List name of customers who have placed at least 2 orders.
SELECT Cmr.Customer_ID, Cmr.Name, COUNT(Ord.Order_ID) AS number_of_orders
FROM Customers AS Cmr
INNER JOIN Orders AS Ord
On Cmr.Customer_ID = Ord.Customer_ID
GROUP BY Customer_ID
HAVING number_of_orders >= 2;

-- 4) Find the most frequently ordered book.
SELECT o.Book_ID,b.Title, COUNT(o.Order_ID) AS Total_Orders
FROM Books AS b
INNER JOIN Orders AS o
ON b.Book_ID = o.Book_ID
GROUP BY Book_ID
ORDER BY Total_Orders DESC
LIMIT 1;

-- 5) Show the top 3 most expensive books of "Fiction" Genre.
SELECT * FROM Books
WHERE Genre = 'Fiction'
ORDER BY Price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author
SELECT b.Author, SUM(o.quantity) AS Total_Quantity
FROM Books AS b
INNER JOIN Orders AS o
on b.Book_ID = o.Book_ID
GROUP BY Author;

-- 7) List the cities where customers who have spent over $300 are located.
SELECT DISTINCT c.City,o.Total_Amount 
FROM Customers AS c
INNER JOIN Orders AS o
ON c.Customer_ID = o.Customer_ID
WHERE Total_Amount > 300;

-- 8) Find the customer who spent the most on orders.
SELECT c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_Money_Spent 
FROM Customers AS c
INNER JOIN Orders AS o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Money_Spent DESC
LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders.
SELECT b.Book_ID,b.Title, 
(CASE WHEN o.Book_ID IS NOT NULL THEN SUM(b.Stock) - SUM(o.Quantity) ELSE SUM(b.Stock) END) 
AS Remaining_Stock
FROM Books AS b
LEFT JOIN Orders AS o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID;




