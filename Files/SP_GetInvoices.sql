CREATE PROC SP_GetInvoices 
@FromDate DATE,
@ToDate DATE
AS
BEGIN
DECLARE @LocalFromDate DATE=@FromDate, @LocalToDate DATE=@ToDate;

WITH Invoices_CTE
AS
(SELECT
		Invoices.InvoiceId
	   ,Invoices.Date
	   ,Customers.Name CustomerName
	   ,Invoices Total
	   ,SUM(InvoiceDetails.Quantity) ItemsQuantity
	FROM Invoices
	JOIN InvoiceDetails
		ON Invoices.OrderID = InvoiceDetails.OrderID
	LEFT JOIN Customers
		ON Invoices.CustomerID = Customers.CustomerID
	WHERE Invoices.Date BETWEEN @LocalFromDate AND @LocalToDate
	GROUP BY Invoices.OrderID
			,Invoices.OrderDate
			,Customers.Name),
Expensive_CheapestItems_CTE
AS
(SELECT
	DISTINCT
		OrderID InvoiceId
	   ,FIRST_VALUE(Products.ProductName) OVER (PARTITION BY OrderID ORDER BY InvoiceDetails.UnitPrice) CheapestProductName
	   ,FIRST_VALUE(InvoiceDetails.UnitPrice) OVER (PARTITION BY OrderID ORDER BY InvoiceDetails.UnitPrice) CheapestUnitPrice
	   ,FIRST_VALUE(Products.ProductName) OVER (PARTITION BY OrderID ORDER BY InvoiceDetails.UnitPrice DESC) ExpensiveProductName
	   ,FIRST_VALUE(InvoiceDetails.UnitPrice) OVER (PARTITION BY OrderID ORDER BY InvoiceDetails.UnitPrice DESC) ExpensiveUnitPrice
	FROM InvoiceDetails JOIN Products ON InvoiceDetails.ProductID=Products.ProductID)


SELECT
	Invoices_CTE.*
   ,Expensive_CheapestItems_CTE.CheapestProductName
   ,Expensive_CheapestItems_CTE.CheapestUnitPrice
   ,Expensive_CheapestItems_CTE.ExpensiveProductName
   ,Expensive_CheapestItems_CTE.ExpensiveUnitPrice
FROM Invoices_CTE
JOIN Expensive_CheapestItems_CTE
	ON Invoices_CTE.InvoiceId = Expensive_CheapestItems_CTE.InvoiceId


END