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

-- Another Approach
SELECT b.Book_ID,b.Title, 
(SUM(b.stock) - COALESCE(SUM(o.Quantity),0))
AS Remaining_Stock
FROM Books AS b
LEFT JOIN Orders AS o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID;