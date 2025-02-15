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