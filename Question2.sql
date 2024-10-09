-- Logan Oram
-- Oct 9th 2024

-- Creating Tables
CREATE TABLE products (
id SERIAL PRIMARY KEY,
product_name VARCHAR(100),
price DECIMAL(10,2),
stock_quantity INT
);

CREATE TABLE customers (
id SERIAL PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(100)
);

CREATE TABLE orders (
id SERIAL PRIMARY KEY,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
order_id INT,
product_id INT,
quantity INT,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

-- INSERTING DATA
-- Products Data

INSERT INTO products (product_name, price, stock_quantity) VALUES
('Hoodie', 59.99, 38),
('Crewneck', 49.99, 26),
('T-Shirt', 24.99, 21),
('Jeans', 64.99, 112),
('Hat', 39.99, 45);

-- Insert Customers
INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Williams', 'alice.williams@example.com'),
('Bob', 'Miller', 'bob.miller@example.com'),
('Charlie', 'Garcia', 'charlie.garcia@example.com'),
('David', 'Martinez', 'david.martinez@example.com');

-- Insert Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-10-01'),
(2, '2024-10-02'),
(3, '2024-10-02'),
(4, '2024-10-04'),
(3, '2024-10-06');

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 1),
(3, 5, 1),
(3, 1, 1),
(4, 2, 2),
(4, 3, 1),
(5, 4, 3),
(5, 5, 1);

-- Retrieve Names and Quantities Of Products

SELECT product_name, stock_quantity
FROM products;

-- Getting Info From Placed Orders
SELECT p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
WHERE oi.order_id = 1;

-- Retrieve Orders Placed By A Specific Customer
SELECT o.id AS order_id, p.product_name, oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.customer_id = 1;

-- Update Data (Reduce Stock)
UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE id = 1;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE id = 2;

-- Deleting Data
DELETE FROM order_items
WHERE order_id = 2;

DELETE FROM orders
WHERE id = 2;