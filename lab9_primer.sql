SELECT Cus.FirstName, Cus.LastNAME, (SELECT sum(Ord.TotalAmount)
	FROM Orders Ord
	WHERE Ord.CustomerID = Cus.CustomerID) AS amount,
	--Добавим среднюю стоимость
	(SELECT AVG(Ord.TotalAmount) FROM Orders ord WHERE Ord.CustomerID = CUS.CustomerID) AS AVGSUM
FROM Customers Cus
Where Cus.CustomerID IN (SELECT DISTINCT CustomerID FROM Orders)
Order by amount DESC;

--Список клиентов с наибольшей суммой стоимости заказов
SELECT FirstName, LastNAME, sum(TotalAmount) as sumamount
	FROM Customers JOIN Orders On customers.customerid = orders.customerid
	GROUP BY FirstName, LastNAME
	HAVING sum(TotalAmount) = (SELECT MAX(sumamount)
	From (Select sum(totalAmount) AS sumamount FROM orders GROUP By CustomerID))
Order by sumamount DESC;

--Список клиентов с наибольшей суммой стоимости заказов СПИСОК ЗАКАЗОВ нормер заказа и стоимость
SELECT FirstName, LastNAME, OrderID, sum(TotalAmount) as sumamount
	FROM Customers JOIN Orders On customers.customerid = orders.customerid
	GROUP BY FirstName, LastNAME, OrderID
	HAVING sum(TotalAmount) = (SELECT MAX(sumamount)
	From (Select sum(totalAmount) AS sumamount FROM orders GROUP By CustomerID))
Order by sumamount DESC;

--3 часть
SELECT firstname, lastname, SUM(totalamount) AS sumtotalamount 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname
  HAVING SUM(totalamount) > (SELECT avg(totalamount) FROM orders) ORDER BY sumtotalamount;