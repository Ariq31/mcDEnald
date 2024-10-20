-- Data MsCustomer (10)
INSERT INTO MsCustomer (CustomerID, CustomerName, CustomerGender, CustomerAddress, PhoneNumber)
VALUES 
    ('CU001', 'Andi Susanto', 'Male', '123 Merdeka Street', '(+62)8123456789'),
    ('CU002', 'Siti Rahayu', 'Female', '456 Sudirman Street', '(+62)8234567890'),
    ('CU003', 'Budi Santoso', 'Male', '789 Pahlawan Street', '(+62)8345678901'),
    ('CU004', 'Rina Fitriani', 'Female', '1011 Diponegoro Street', '(+62)8456789012'),
    ('CU005', 'Joko Wibowo', 'Male', '1213 Gajah Mada Street', '(+62)8567890123'),
    ('CU006', 'Rini Sari', 'Female', '1415 Hayam Wuruk Street', '(+62)8678901234'),
    ('CU007', 'Agus Setiawan', 'Male', '1617 Jenderal Sudirman Street', '(+62)8789012345'),
    ('CU008', 'Ani Widarti', 'Female', '1819 Imam Bonjol Street', '(+62)8890123456'),
    ('CU009', 'Eko Prabowo', 'Male', '2021 Thamrin Street', '(+62)8901234567'),
    ('CU010', 'Dewi Anggraeni', 'Female', '2223  Gatot Subroto Street', '(+62)8012345678');

-- Data MsStore (10)
INSERT INTO MsStore (StoreID, StoreName, StoreAddress, PhoneNumber)
VALUES 
    ('SO001', 'Kebayoran Baru', '123 Gatot Subroto Street', '(021)1234567'),
    ('SO002', 'Menteng', '456 Sudirman Street', '(021)2345678'),
    ('SO003', 'Tanah Abang', '789 Thamrin Street', '(021)3456789'),
    ('SO004', 'Cempaka Putih', '1011 Diponegoro Street', '(021)4567890'),
    ('SO005', 'Grogol Petamburan', '1213 Gajah Mada Street', '(021)5678901'),
    ('SO006', 'Senayan', '456 Senayan Street', '(021)6789012'),
    ('SO007', 'MH Thamrin', '789 MH Thamrin Street', '(021)7890123'),
    ('SO008', 'Kebon Kacang', '1011 Kebon Kacang Street', '(021)8901234'),
    ('SO009', 'Rawasari', '1213 Rawasari Street', '(021)9012345'),
    ('SO010', 'Tanjung Duren', '1415 Tanjung Duren Street', '(021)0123456');


-- Data MsStaff (10)
INSERT INTO MsStaff (StaffID, StoreID, StaffName, StaffGender)
VALUES 
    ('ST001', 'SO001', 'Hadi Wijaya', 'Male'),
    ('ST002', 'SO001', 'Lia Dewi', 'Female'),
    ('ST003', 'SO002', 'Hendra Gunawan', 'Male'),
    ('ST004', 'SO002', 'Dewi Lestari', 'Female'),
    ('ST005', 'SO003', 'Budi Santoso', 'Male'),
    ('ST006', 'SO003', 'Rina Fitriani', 'Female'),
    ('ST007', 'SO004', 'Joko Wibowo', 'Male'),
    ('ST008', 'SO004', 'Rini Sari', 'Female'),
    ('ST009', 'SO005', 'Agus Setiawan', 'Male'),
    ('ST010', 'SO005', 'Ani Widarti', 'Female');

-- Data MsPaymentMethod (10)
INSERT INTO MsPaymentMethod (PaymentMethodID, PaymentMethodName)
VALUES 
    ('PM001', 'Cash'),
    ('PM002', 'ERIS'),
    ('PM003', 'Debit Card'),
    ('PM004', 'EVA'),
    ('PM005', 'Credit Card'),
    ('PM006', 'DENA'),
    ('PM007', 'GePay'),
    ('PM008', 'E.Saku'),
    ('PM009', 'SheppePay'),
    ('PM010', 'Flep');

-- Data MsProductType (10)
INSERT INTO MsProductType (ProductTypeID, ProductTypeName)
VALUES 
    ('PT001', 'Breakfast'),
    ('PT002', 'Fish'),
    ('PT003', 'Burger'),
    ('PT004', 'Coffee'),
    ('PT005', 'Chicken'),
    ('PT006', 'Family Package'),
    ('PT007', 'Dessert'),
    ('PT008', 'Sad Meal'),
    ('PT009', 'Meals'),
    ('PT010', 'Drinks');

-- Data MsProduct (10)
INSERT INTO MsProduct (ProductID, ProductTypeID, ProductName, ProductPrice)
VALUES 
    ('PR001', 'PT001', 'Pancakes', 25000),
    ('PR002', 'PT001', 'Egg Muffin', 15000),
    ('PR003', 'PT002', 'Grilled Fish', 35000),
    ('PR004', 'PT002', 'Fish and Chips', 30000),
    ('PR005', 'PT003', 'Classic Burger', 20000),
    ('PR006', 'PT003', 'Cheeseburger', 22000),
    ('PR007', 'PT004', 'Cappuccino', 18000),
    ('PR008', 'PT004', 'Latte', 20000),
    ('PR009', 'PT005', 'Fried Chicken', 25000),
    ('PR010', 'PT005', 'Chicken Rice', 20000),
    ('PR011', 'PT006', 'Family Meal A', 50000),
    ('PR012', 'PT006', 'Family Meal B', 60000),
    ('PR013', 'PT007', 'Ice Cream', 12000),
    ('PR014', 'PT007', 'Cakes', 25000),
    ('PR015', 'PT008', 'Sad Burger', 18000),
    ('PR016', 'PT008', 'Sad Fries', 15000),
    ('PR017', 'PT009', 'Combo Meal', 35000),
    ('PR018', 'PT009', 'Lunch Set', 30000),
    ('PR019', 'PT010', 'Soft Drink', 5000),
    ('PR020', 'PT010', 'Juice', 10000);


-- Data TransactionHeader (15)
INSERT INTO TransactionHeader (TransactionID, CustomerID, PaymentMethodID, StaffID, TransactionDate)
VALUES 
    ('TR001', 'CU001', 'PM001', 'ST001', '2023-01-25'),
    ('TR002', 'CU002', 'PM002', 'ST002', '2023-01-26'),
    ('TR003', 'CU003', 'PM003', 'ST003', '2023-01-27'),
    ('TR004', 'CU004', 'PM004', 'ST004', '2023-01-28'),
    ('TR005', 'CU005', 'PM005', 'ST005', '2023-01-28'),
    ('TR006', 'CU006', 'PM006', 'ST006', '2023-02-28'),
    ('TR007', 'CU007', 'PM007', 'ST007', '2023-02-01'),
    ('TR008', 'CU008', 'PM008', 'ST008', '2023-02-02'),
    ('TR009', 'CU009', 'PM009', 'ST009', '2023-02-03'),
    ('TR010', 'CU010', 'PM010', 'ST010', '2023-02-04'),
    ('TR011', 'CU001', 'PM001', 'ST001', '2023-03-05'),
    ('TR012', 'CU002', 'PM002', 'ST002', '2023-03-06'),
    ('TR013', 'CU003', 'PM003', 'ST003', '2023-03-07'),
    ('TR014', 'CU004', 'PM004', 'ST004', '2023-03-08'),
    ('TR015', 'CU005', 'PM005', 'ST005', '2023-03-09');


-- Data TransactionDetail (30)
INSERT INTO TransactionDetail (TransactionID, ProductID, Quantity)
VALUES 
    ('TR001', 'PR003', 2),
    ('TR001', 'PR004', 1),
    ('TR002', 'PR005', 1),
    ('TR002', 'PR006', 2),
    ('TR003', 'PR007', 1),
    ('TR003', 'PR008', 1),
    ('TR004', 'PR009', 2),
    ('TR004', 'PR010', 1),
    ('TR005', 'PR011', 1),
    ('TR005', 'PR012', 1),
    ('TR006', 'PR013', 2),
    ('TR006', 'PR014', 1),
    ('TR007', 'PR015', 1),
    ('TR007', 'PR016', 3),
    ('TR008', 'PR017', 1),
    ('TR008', 'PR018', 2),
    ('TR009', 'PR019', 2),
    ('TR009', 'PR020', 1),
    ('TR010', 'PR001', 2),
    ('TR010', 'PR002', 1),
    ('TR011', 'PR003', 2),
    ('TR011', 'PR004', 1),
    ('TR012', 'PR005', 1),
    ('TR012', 'PR006', 2),
    ('TR013', 'PR007', 1),
    ('TR013', 'PR008', 1),
    ('TR014', 'PR009', 2),
    ('TR014', 'PR010', 1),
    ('TR015', 'PR011', 3),
    ('TR015', 'PR012', 1);