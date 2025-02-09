# Creating the database
CREATE DATABASE OnlineBookStore;

USE OnlineBookStore;

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



