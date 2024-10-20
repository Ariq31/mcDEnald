CREATE DATABASE McDEnald
GO
USE mcDEnald
GO

CREATE TABLE MsCustomer (
    CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE('CU[0-9][0-9][0-9]')),
    CustomerName VARCHAR(255) NOT NULL,
    CustomerGender VARCHAR(6) CHECK(CustomerGender IN('Male','Female')) NOT NULL,
    CustomerAddress VARCHAR(255) CHECK(CustomerAddress LIKE '% Street') NOT NULL,
    PhoneNumber VARCHAR(16) CHECK(PhoneNumber LIKE('(+62)%')) NOT NULL
)

CREATE TABLE MsStore (
    StoreID CHAR(5) PRIMARY KEY CHECK(StoreID LIKE ('SO[0-9][0-9][0-9]')),
    StoreName VARCHAR(255) NOT NULL,
    StoreAddress VARCHAR(255) CHECK(StoreAddress LIKE '% Street') NOT NULL,
    PhoneNumber VARCHAR(16) CHECK (PhoneNumber  LIKE '(021)%') NOT NULL
)

CREATE TABLE MsStaff (
     StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE('ST[0-9][0-9][0-9]')),
     StaffName VARCHAR(255) NOT NULL,
     StaffGender VARCHAR(6) CHECK(StaffGender IN ('Male','Female')) NOT NULL,
     StoreID CHAR(5) REFERENCES MsStore(StoreID) NOT NULL
)

CREATE TABLE MsPaymentMethod (
    PaymentMethodID CHAR(5) PRIMARY KEY CHECK(PaymentMethodID LIKE('PM[0-9][0-9][0-9]')),
    PaymentMethodName VARCHAR(50) NOT NULL
)

CREATE TABLE MsProductType (
    ProductTypeID CHAR(5) PRIMARY KEY CHECK(ProductTypeID LIKE ('PT[0-9][0-9][0-9]')),
    ProductTypeName VARCHAR(255) NOT NULL
)

CREATE TABLE MsProduct (
    ProductID CHAR(5) PRIMARY KEY CHECK(ProductID LIKE ('PR[0-9][0-9][0-9]')),
    ProductName VARCHAR(255) CHECK(LEN(ProductName) >= 5) NOT NULL,
	ProductPrice INT CHECK(ProductPrice > 0) NOT NULL,
	ProductTypeID CHAR(5) REFERENCES MsProductType(ProductTypeID) NOT NULL
)

CREATE TABLE TransactionHeader (
    TransactionID CHAR(5) PRIMARY KEY CHECK(TransactionID LIKE('TR[0-9][0-9][0-9]')),
    TransactionDate DATE CHECK(TransactionDate <= GETDATE()) NOT NULL,
    CustomerID CHAR(5) REFERENCES MsCustomer(CustomerID) NOT NULL,
    PaymentMethodID CHAR(5) REFERENCES MsPaymentMethod(PaymentMethodID) NOT NULL,
    StaffID CHAR(5) REFERENCES MsStaff(StaffID) NOT NULL
)

CREATE TABLE TransactionDetail (
    TransactionID CHAR(5) REFERENCES TransactionHeader(TransactionID) NOT NULL,
    ProductID CHAR(5) REFERENCES MsProduct(ProductID) NOT NULL,
    Quantity INT CHECK(Quantity BETWEEN 1 AND 200) NOT NULL,
	PRIMARY KEY(TransactionID, ProductID)
)