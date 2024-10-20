-- 1
SELECT
	STUFF(th.TransactionID, 2, 1, LEFT(CustomerName, 1)) AS TransactionID,
	CustomerName,
	SUM(Quantity) AS TotalQuantity
FROM 
	MsCustomer mc
	JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID
WHERE 
	CustomerName LIKE('%a%') 
	AND CustomerGender = 'Female'
GROUP BY 
	th.TransactionID, CustomerName

-- 2
SELECT
	th.TransactionID,
	CustomerName,
	AVG(Quantity) AS [Average Quantity]
FROM 
	MsCustomer mc
	JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID
WHERE 
	MONTH(TransactionDate) > 5
	AND DAY(TransactionDate) > 14
GROUP BY 
	th.TransactionID, CustomerName

-- 3
SELECT
	mpt.ProductTypeID,
	UPPER(mpt.ProductTypeName) AS ProductTypeName,
	COUNT(mpt.ProductTypeID) AS TotalProductType,
	SUM(Quantity) AS TotalQuantity
FROM 
	TransactionDetail td
	JOIN MsProduct mp ON td.ProductID = mp.ProductID
	JOIN MsProductType mpt ON mp.ProductTypeID = mpt.ProductTypeID
WHERE 
	ProductTypeName LIKE('%e%') 
	AND (RIGHT(mpt.ProductTypeID, 1) % 2 = 0)
GROUP BY 
	mpt.ProductTypeID, ProductTypeName

-- 4
SELECT
	th.TransactionID,
	CONCAT('Mr. ', LOWER(CustomerName)) AS [Customer Name],
	MIN(Quantity) AS MinimumPurchase,
	MAX(Quantity) AS MaximumPurchase
FROM 
	MsCustomer mc
	JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID
WHERE 
	YEAR(TransactionDate) > 2019 
	AND CustomerGender = 'Male'
GROUP BY 
	th.TransactionID, CONCAT('Mr. ', LOWER(CustomerName))

-- 5
SELECT
	th.TransactionID,
	TransactionDate,
	StaffName,
	CONCAT(mp.ProductID, '-', LEFT(mp.ProductName, 1)) AS ProductID,
	ProductName
FROM 
	TransactionHeader th
	JOIN MsStaff ms ON th.StaffID = ms.StaffID
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID
	JOIN MsProduct mp ON td.ProductID = mp.ProductID
WHERE 
	DAY(TransactionDate) < 16
	AND mp.ProductPrice > (
		SELECT AVG(ProductPrice)
		FROM MsProduct
	)

--6
SELECT
	TransactionDate,
	CustomerName,
	SUM(Price) TotalPrice
FROM (
	SELECT
		CONVERT(VARCHAR, TransactionDate, 113) AS TransactionDate,
		LOWER(CustomerName) AS CustomerName,
		(ProductPrice * Quantity) AS Price,
		CustomerAddress
	FROM 
		MsCustomer mc 
		JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
		JOIN TransactionDetail td ON th.TransactionID = td.TransactionID 
		JOIN MsProduct mp ON td.ProductID = mp.ProductID
) AS x
WHERE 
	LEN(CustomerName) > 7 
	AND CustomerAddress LIKE('%i%')
GROUP BY 
	TransactionDate, CustomerName

--7
SELECT
    REPLACE(th.TransactionID, 'R', UPPER(RIGHT(CustomerName, 1))) AS TransactionID,
	CONVERT(VARCHAR, TransactionDate, 107) AS TransactionDate,
	CustomerName,
	SUM(ProductPrice * Quantity) AS TotalPrice
FROM 
	MsCustomer mc
	JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID 
	JOIN MsPaymentMethod mpm ON th.PaymentMethodID = mpm.PaymentMethodID
	JOIN MsProduct mp ON td.ProductID = mp.ProductID
WHERE 
	PaymentMethodName LIKE '% %'
GROUP BY 
	th.TransactionID, TransactionDate, CustomerName
HAVING 
	SUM(ProductPrice * Quantity) < (
		SELECT AVG(TotalPrice)
		FROM (
			SELECT SUM(ProductPrice * Quantity) AS TotalPrice
			FROM 
				MsCustomer mc
				JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
				JOIN TransactionDetail td ON th.TransactionID = td.TransactionID
				JOIN MsPaymentMethod mpm ON th.PaymentMethodID = mpm.PaymentMethodID
				JOIN MsProduct mp ON td.ProductID = mp.ProductID
			GROUP BY 
				th.TransactionID, TransactionDate, CustomerName
		) AS x
	)

--8
SELECT DISTINCT
	th.TransactionID,
	CONCAT('Mr/Ms ', CustomerName) AS CustomerName,
	mc.PhoneNumber AS CustomerTelephoneNumber,
	REPLACE(StoreName, 's', '''s') AS StoreName
FROM 
	MsCustomer mc
	JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID
	JOIN MsStaff msa ON th.StaffID = msa.StaffID
	JOIN MsStore mso ON msa.StoreID = mso.StoreID, (
		SELECT AVG(Quantity) AS AverageQuantity FROM TransactionDetail
	) AS x
WHERE (RIGHT(mso.PhoneNumber, 1) % 2) = 1 AND td.Quantity > AverageQuantity
GO

--9
CREATE VIEW staff_activeness 
AS
SELECT 
	th.TransactionID,
	YEAR(TransactionDate) AS [Year of TransactionDate],
	StaffName,
	SUM(Quantity) AS TotalQuantity,
	AVG(Quantity) AS AverageQuantity
FROM 
	TransactionHeader th
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID 
	JOIN MsStaff ms ON th.StaffID = ms.StaffID
WHERE 
	StaffGender LIKE('Female')
	AND YEAR(TransactionDate) >= YEAR(GETDATE()) - 6
GROUP BY 
	th.TransactionID, YEAR(TransactionDate), StaffName
GO

--10
CREATE VIEW payment_method_usage 
AS 
SELECT 
	mpm.PaymentMethodID,
	PaymentMethodName,
	MIN(Quantity) AS [Minimum Quantity],
	MAX(Quantity) AS [Maximum Quantity]
FROM 
	MsPaymentMethod mpm
	JOIN TransactionHeader th ON mpm.PaymentMethodID = th.PaymentMethodID 
	JOIN TransactionDetail td ON th.TransactionID = td.TransactionID
WHERE 
	MONTH(TransactionDate) < 5 AND LEN(PaymentMethodName) < 5
GROUP BY 
	mpm.PaymentMethodID, PaymentMethodName