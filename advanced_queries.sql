USE OnlineBookStore;

-- Advanced Level Questions

-- 1) List the customers who has only purchased books from a single genre. 
SELECT DISTINCT o.Customer_ID,c.Name, b.Genre
FROM Books AS b
JOIN Orders AS o
ON b.Book_ID = o.Book_ID
JOIN Customers AS c
ON o.Customer_ID = c.Customer_ID
WHERE (o.Customer_ID) IN
(SELECT o.Customer_ID
FROM Books AS b
JOIN Orders AS o
ON b.Book_ID = o.Book_ID
GROUP BY o.Customer_ID
HAVING COUNT(DISTINCT b.Genre) = 1);

-- 2) Find the most popular author based on revenue.
WITH AuthorRevenue AS 
(SELECT b.Author, SUM(o.Total_Amount) AS Total_Revenue
FROM Books AS b
JOIN Orders AS o
ON b.Book_ID = o.Book_ID
GROUP BY b.Author)
SELECT Author, Total_Revenue
FROM AuthorRevenue
WHERE Total_Revenue = (SELECT MAX(Total_Revenue) FROM AuthorRevenue);

-- 3) Find the top 3 customers who spent most on their first order
SELECT c.Customer_ID,c.Name,o.Order_Date, o.Total_Amount
FROM Customers AS c
JOIN Orders AS o
ON c.Customer_ID = o.Customer_ID
WHERE (c.Customer_ID,o.Total_Amount) IN
(SELECT c.Customer_ID, MAX(o.Total_Amount)
FROM Customers AS c
JOIN Orders AS o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID);  -- Incomplete query , currently finding the max amount along all orders

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;