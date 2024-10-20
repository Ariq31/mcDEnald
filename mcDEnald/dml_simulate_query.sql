-- SCENARIO
-- On June 6, 2024, a new male customer named 'Muhammad Sumbul' buys 5 different menu with a 'Debit Card'.
-- He was born on 4 May 1998. He lives in 299 Ciganjur Street and his phone number is (+62)82138884132.
-- This transaction was handled by a staff named 'Hadi Wijaya'.

INSERT INTO MsCustomer(CustomerID, CustomerName, CustomerGender, CustomerAddress, PhoneNumber)
VALUES
	('CU011', 'Muhammad Sumbul', 'Male', '299 Ciganjur Street', '(+62)82138884132')

INSERT INTO TransactionHeader(TransactionID, CustomerID, PaymentMethodID, StaffID, TransactionDate)
VALUES
	('TR016', 'CU011', 'PM003', 'ST001', '2024-06-06')

INSERT INTO TransactionDetail(TransactionID, ProductID, Quantity)
VALUES
	('TR016', 'PR001', 3),
	('TR016', 'PR002', 2),
	('TR016', 'PR003', 1),
	('TR016', 'PR004', 5),
	('TR016', 'PR005', 3)