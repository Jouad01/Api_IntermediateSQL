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

CREATE USER 'victor'@'localhost' IDENTIFIED BY 'password';
CREATE ROLE administrator;
GRANT SELECT,INSERT,UPDATE,DELETE ON BicycleStore.* TO administrator;
GRANT administrator TO 'victor'@'localhost';
SET ROLE administrator;
SHOW GRANTS for 'victor'@'localhost';
SELECT CURRENT_ROLE;

CREATE USER 'jouad'@'localhost' IDENTIFIED BY 'password';
CREATE ROLE employee;
GRANT SELECT,INSERT,UPDATE ON BicycleStore.* TO administrator;
GRANT employee TO 'jouad'@'localhost';
SET ROLE employee;
SHOW GRANTS for 'jouad'@'localhost';
SELECT CURRENT_ROLE;


-- Insertar datos en las tablas
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Shimano', 'shimanoa@google.com', '900231223', 'alcala 12, 4123 Madrid');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('SRAM', 'sram@google.com', '900231224', 'Gran Via 34, 4567 Madrid');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Campagnolo', 'campagnolo@google.com', '900231225', 'Avenida Libertad 8, 7890 Madrid');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Fox Racing', 'foxracing@google.com', '900231226', 'Calle Mayor 15, 1357 Madrid');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('RockShox', 'rockshox@google.com', '900231227', 'Paseo Castellana 20, 2468 Madrid');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Continental', 'continental@google.com', '900231228', 'Calle Princesa 25, 8642 Madrid');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Maxxis', 'maxxis@google.com', '900231229', 'Avenida America 30, 9753 Madrid');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Schwalbe', 'schwalbe@google.com', '900231230', 'Calle Orense 35, 1234 Barcelona');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Mavic', 'mavic@google.com', '900231231', 'Rambla Catalunya 40, 5678 Barcelona');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('DT Swiss', 'dtswiss@google.com', '900231232', 'Passeig Gracia 45, 8910 Barcelona');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Canyon', 'canyon@google.com', '900231234', 'Calle de la Paz 55, 6789 Valencia');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Pinarello', 'pinarello@google.com', '900231235', 'Avenida del Cid 60, 9876 Valencia');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Orbea', 'orbea@google.com', '900231236', 'Calle Colón 65, 5432 Bilbao');
INSERT INTO Suppliers (name, email, phone, address)
VALUES ('Cervélo', 'cervelo@google.com', '900231237', 'Gran Vía 70, 1098 Bilbao');
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Canyon Neuron', 'Mountain bike, 12 speeds', 8000.00, 1);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Canyon Spectral', 'Mountain bike, 12 speeds', 8500.00, 1);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Canyon Strive', 'Mountain bike, 11 speeds', 9000.00, 1);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Pinarello Dogma', 'Road bike, 12 speeds', 11000.00, 2);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Pinarello Prince', 'Road bike, 11 speeds', 9500.00, 2);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Pinarello Gan', 'Road bike, 12 speeds', 8000.00, 2);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Orbea Alma', 'Mountain bike, 12 speeds', 7000.00, 3);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Orbea Oiz', 'Mountain bike, 12 speeds', 7500.00, 3);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Orbea Occam', 'Mountain bike, 11 speeds', 8000.00, 3);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Cervélo R5', 'Road bike, 22 speeds', 12000.00, 4);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Cervélo S5', 'Road bike, 22 speeds', 13000.00, 4);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Cervélo P5', 'Triathlon bike, 22 speeds', 14000.00, 4);
INSERT INTO Products (name, description, price, supplier_id)
VALUES ('Cervélo Caledonia', 'Road bike, 22 speeds', 10000.00, 4);
INSERT INTO Customers (name, email, phone, address)
VALUES ('Jane Doe', 'jane.doe@example.com', '987654322', 'Street C 789');
INSERT INTO Customers (name, email, phone, address)
VALUES ('John Doe', 'john.doe@example.com', '987654321', 'Street B 456');
INSERT INTO Customers (name, email, phone, address)
VALUES ('Michael Smith', 'michael.smith@example.com', '987654323', 'Street D 123');
INSERT INTO Customers (name, email, phone, address)
VALUES ('Emily Johnson', 'emily.johnson@example.com', '987654324', 'Street E 456');
INSERT INTO Customers (name, email, phone, address)
VALUES ('Daniel Brown', 'daniel.brown@example.com', '987654325', 'Street F 789');
INSERT INTO Customers (name, email, phone, address)
VALUES ('Sarah Williams', 'sarah.williams@example.com', '987654326', 'Street G 123');
INSERT INTO Customers (name, email, phone, address)
VALUES ('Emma Davis', 'emma.davis@example.com', '987654328', 'Street I 789');
INSERT INTO Customers (name, email, phone, address)
VALUES ('James Miller', 'james.miller@example.com', '987654329', 'Street J 123');
INSERT INTO Customers (name, email, phone, address)
VALUES ('Olivia Wilson', 'olivia.wilson@example.com', '987654330', 'Street K 456');
INSERT INTO Customers (name, email, phone, address)
VALUES ('William Moore', 'william.moore@example.com', '987654331', 'Street L 789');
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (2, 2, '2023-03-25', 1, 8500.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (3, 3, '2023-03-25', 1, 9000.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (4, 4, '2023-03-26', 1, 11000.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (5, 5, '2023-03-26', 1, 9500.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (6, 6, '2023-03-27', 1, 8000.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (7, 7, '2023-03-27', 1, 700.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (8, 8, '2023-03-28', 1, 10000.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (9, 9, '2023-03-28', 1, 9000.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (10, 10, '2023-03-29', 1, 9500.00);
INSERT INTO Sales (customer_id, product_id, date, quantity, total)
VALUES (11, 11, '2023-03-29', 1, 9900.00);
INSERT INTO Inventory (product_id, quantity)
VALUES (2, 10);
INSERT INTO Inventory (product_id, quantity)
VALUES (3, 8);
INSERT INTO Inventory (product_id, quantity)
VALUES (4, 15);
INSERT INTO Inventory (product_id, quantity)
VALUES (5, 12);
INSERT INTO Inventory (product_id, quantity)
VALUES (6, 10);
INSERT INTO Inventory (product_id, quantity)
VALUES (7, 7);
INSERT INTO Inventory (product_id, quantity)
VALUES (8, 5);
INSERT INTO Inventory (product_id, quantity)
VALUES (9, 9);
INSERT INTO Inventory (product_id, quantity)
VALUES (10, 11);
INSERT INTO Inventory (product_id, quantity)
VALUES (11, 6);
