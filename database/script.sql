DROP DATABASE BicycleStore;
CREATE DATABASE BicycleStore;
USE BicycleStore;
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    supplier_id INT,
    image BLOB
);
CREATE TABLE Sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    date DATE NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);
CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);
CREATE TABLE Inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT NOT NULL,
    entry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    exit_date TIMESTAMP
);

ALTER TABLE Products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
ON UPDATE CASCADE
ON DELETE SET NULL;
ALTER TABLE Sales
ADD CONSTRAINT fk_sales_customers
FOREIGN KEY (customer_id) REFERENCES Customers(id)
ON UPDATE CASCADE
ON DELETE SET NULL;
ALTER TABLE Sales
ADD CONSTRAINT fk_sales_products
FOREIGN KEY (product_id) REFERENCES Products(id)
ON UPDATE CASCADE
ON DELETE SET NULL;
ALTER TABLE Inventory
ADD CONSTRAINT fk_inventory_products
FOREIGN KEY (product_id) REFERENCES Products(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

CREATE INDEX index_products_name ON Products(name);
CREATE INDEX index_sales_date ON Sales(date);
CREATE INDEX index_customers_email ON Customers(email);
CREATE INDEX index_suppliers_email ON Suppliers(email);