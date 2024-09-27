CREATE DATABASE madura_groceries;
USE madura_groceries;

CREATE TABLE MsCustomer (
    CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID REGEXP 'CU[0-9]{3}'),
    CustomerName VARCHAR(50) NOT NULL,
    CustomerGender VARCHAR(10) NOT NULL,
    CustomerAddress VARCHAR(50) NOT NULL,
    CustomerEmail VARCHAR(50) NOT NULL,
    CustomerDOB DATE NOT NULL
);

CREATE TABLE MsEmployee (
    EmployeeID CHAR(5) PRIMARY KEY CHECK (EmployeeID REGEXP 'EM[0-9]{3}'),
    EmployeeName VARCHAR(50) NOT NULL,
    EmployeeGender VARCHAR(10) NOT NULL,
    EmployeeAddress VARCHAR(50) NOT NULL
);

CREATE TABLE MsCategory (
    CategoryID CHAR(5) PRIMARY KEY CHECK (CategoryID REGEXP 'CT[0-9]{3}'),
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE MsProduct (
    ProductID CHAR(5) PRIMARY KEY CHECK (ProductID REGEXP 'PR[0-9]{3}'),
    CategoryID CHAR(5) NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES MsCategory(CategoryID) ON UPDATE CASCADE ON DELETE CASCADE,
    ProductName VARCHAR(50) NOT NULL,
    ProductPrice INT NOT NULL
);

CREATE TABLE TransactionHeader(
    TransactionID CHAR(5) PRIMARY KEY CHECK(TransactionID REGEXP 'TR[0-9]{3}'),
    EmployeeID CHAR(5) NOT NULL,
    CustomerID CHAR(5) NOT NULL,
    TransactionDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES MsEmployee(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE TransactionDetail(
    TransactionID CHAR(5) NOT NULL,
    ProductID CHAR(5) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (TransactionID, ProductID),
    FOREIGN KEY (TransactionID) REFERENCES TransactionHeader(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES MsProduct(ProductID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE MsBrand(
    BrandID CHAR(5) PRIMARY KEY CHECK(BrandID REGEXP 'BR[0-9]{3}'),
    BrandName VARCHAR(50) NOT NULL
);

DROP TABLE MsBrand;

INSERT INTO MsCustomer VALUES 
('CU001', 'Dirk Titterel', 'Male', '74 Melvin Point', 'Dtitterel0@gmail.com', '2003-10-29'),
('CU002', 'Gatot Sunyoto', 'Male', '002 GoldLane Hill', 'gatot007@gmail.com', '1945-08-17'),
('CU003', 'Mahalini', 'Female', '90 Brawl City', 'mahalini@gmail.com', '1990-07-28');

INSERT INTO MsEmployee VALUES
('EM001', 'Clem', 'Male', '0975 Forest Dale Trail'),
('EM002', 'Dene', 'Male', '2 Grayhawk Parkway'),
('EM003', 'Lethia', 'Female', '905 Goodland Lane'),
('EM004', 'Tyrone', 'Male', '51745 Bowman Hill'),
('EM005', 'Shand', 'Male', '848 New Castle Center');

INSERT INTO MsCategory VALUES ('CT001', 'Snack');

INSERT INTO MsProduct VALUES ('PR001', 'CT001', 'Cheetos', 8000);

INSERT INTO TransactionHeader VALUES ('TR001', 'EM001', 'CU001', '2024-09-25');

INSERT INTO TransactionDetail VALUES ('TR001', 'PR001', 100);

SELECT * FROM MsEmployee;

SELECT * FROM MsCategory;

SELECT * FROM MsCustomer;

SELECT * FROM MsProduct;

SELECT * FROM TransactionDetail;

SELECT * FROM TransactionHeader;

-- SELECT * FROM MsCustomer WHERE CustomerName = 'Dirk Titterel';