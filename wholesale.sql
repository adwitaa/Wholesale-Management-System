
use student;
CREATE TABLE customers (
    id INT primary key ,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE suppliers (
    id INT  primary key ,
    name VARCHAR(255),
    contact VARCHAR(255),
    address varchar(30)
);



CREATE TABLE products (
    id INT primary key ,
    name VARCHAR(255) NOT NULL,
    description varchar(30),
    price int,
    quantity INT,
    supplier_id INT,
    
);

CREATE TABLE orders (
    id INT primary key ,
    product_id INT,
    customer_id INT,
    quantity INT,
    order_date INT,
    status VARCHAR(50),
    
);
-- Insert into Suppliers
INSERT INTO suppliers (id,name, contact, address) VALUES 
(3,'ABC Supplies', '123-456-7890', '123 Main St, Citytown'),
(4,'XYZ Wholesalers', '987-654-3210', '456 Side Ave, Metropolis')

-- Insert into Products
INSERT INTO products (id,name, description, price, quantity, supplier_id) VALUES 
(5,'Product A', 'High-quality product A', 10.50, 100, 1),
(6,'Product B', 'Durable product B', 15.75, 50, 2)

-- Insert into Customers
INSERT INTO customers (id,name, email, phone) VALUES 
(7,'John Doe', 'john.doe@example.com', '555-1234'),
(8,'Jane Smith', 'jane.smith@example.com', '555-5678')

-- Insert into Orders
INSERT INTO orders (id,product_id, customer_id, quantity, status) VALUES 
(8,1, 1, 10, 'Pending'),
(9,2, 2, 5, 'Shipped');

-- View all products
SELECT * FROM products;

-- View orders with customer and product details
SELECT orders.id, customers.name AS customer_name, products.name AS product_name, 
       orders.quantity, orders.status, orders.order_date
FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN products ON orders.product_id = products.id;

-- Update the quantity of a product
UPDATE products
SET quantity = quantity - 5
WHERE id = 1;

-- Update the status of an order
UPDATE orders
SET status = 'Delivered'
WHERE id = 1;

-- Delete a product
DELETE FROM products
WHERE id = 2;

-- Delete a customer
DELETE FROM customers
WHERE id = 2;
-- Get products with quantity less than 50
SELECT * FROM products
WHERE quantity < 50;

-- Get orders that are pending
SELECT * FROM orders
WHERE status = 'Pending';

-- Get total quantity of products in stock
SELECT SUM(quantity) AS total_stock FROM products;

-- Count the number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- List all orders with customer and product names
SELECT orders.id AS order_id, customers.name AS customer_name, 
       products.name AS product_name, orders.quantity, orders.status
FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN products ON orders.product_id = products.id;

-- Get products and their suppliers
SELECT products.name AS product_name, suppliers.name AS supplier_name
FROM products
JOIN suppliers ON products.supplier_id = suppliers.id;

-- Drop the orders table
DROP TABLE orders;

-- Drop all tables (only if necessary)
DROP TABLE products, customers, suppliers;






