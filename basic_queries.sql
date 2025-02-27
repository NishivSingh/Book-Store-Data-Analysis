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

-- 11) Find the total numbers of books published in each year.
SELECT Published_Year, COUNT(Book_ID) AS Total_Books
FROM Books
GROUP BY Published_Year
ORDER BY Published_Year DESC;

-- 12) Show the top 5 customers who spent the most money.
SELECT Customer_ID, SUM(Total_Amount) AS Total_Spent
FROM Orders
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 5;

-- 13) Retrieve the average price of books in each genre.
SELECT Genre, AVG(Price) AS Average_Price
FROM Books
GROUP BY Genre;

-- 14) Find the total number of books in each genre.
SELECT Genre, COUNT(Book_ID) AS Total_Books
FROM Books
GROUP BY Genre;

-- 15) Find the customer who placed the most orders.
SELECT Customer_ID, COUNT(Order_ID) AS Total_Orders
FROM Orders
GROUP BY Customer_ID
ORDER BY Total_Orders DESC
LIMIT 1;


