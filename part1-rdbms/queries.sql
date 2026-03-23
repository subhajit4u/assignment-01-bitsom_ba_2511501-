-- Customers
INSERT INTO customers VALUES
('C1','Amit Sharma','amit@gmail.com','Mumbai'),
('C2','Rahul Das','rahul@gmail.com','Kolkata'),
('C3','Neha Singh','neha@gmail.com','Delhi'),
('C4','Priya Mehta','priya@gmail.com','Mumbai'),
('C5','Arjun Roy','arjun@gmail.com','Bangalore');

-- Products
INSERT INTO products VALUES
('P1','Laptop','Electronics',50000),
('P2','Phone','Electronics',20000),
('P3','Tablet','Electronics',15000),
('P4','Headphones','Accessories',2000),
('P5','Monitor','Electronics',10000);

-- Sales Reps
INSERT INTO sales_reps VALUES
('S1','Raj','raj@mail.com','Delhi Office'),
('S2','Simran','simran@mail.com','Mumbai Office'),
('S3','Karan','karan@mail.com','Delhi Office'),
('S4','Anita','anita@mail.com','Mumbai Office'),
('S5','Vikram','vikram@mail.com','Delhi Office');

-- Orders
INSERT INTO orders VALUES
('O1','C1','S1','2024-01-01'),
('O2','C2','S2','2024-01-02'),
('O3','C3','S3','2024-01-03'),
('O4','C4','S1','2024-01-04'),
('O5','C5','S2','2024-01-05');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
('O1','P1',1),
('O1','P4',2),
('O2','P2',1),
('O3','P3',3),
('O4','P5',1);


-- Q1:
SELECT c.customer_name, SUM(p.unit_price * oi.quantity) AS total_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.customer_city = 'Mumbai'
GROUP BY c.customer_name;

-- Q2:
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;

-- Q3:
SELECT sr.sales_rep_name, COUNT(DISTINCT o.customer_id) AS customer_count
FROM sales_reps sr
JOIN orders o ON sr.sales_rep_id = o.sales_rep_id
GROUP BY sr.sales_rep_name;

-- Q4:
SELECT o.order_id, SUM(p.unit_price * oi.quantity) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_value > 10000
ORDER BY total_value DESC;

-- Q5:
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


## Normalization Justification

The dataset stores customer, product, and sales representative information in a single table, leading to redundancy and inconsistency. For example, product details such as unit_price are repeated across multiple rows. If the price changes, it must be updated everywhere, which can lead to errors.

Similarly, customer and sales representative details are duplicated, increasing storage and maintenance effort. Deleting an order may also remove important information about a product or customer.

By normalizing the data into separate tables such as customers, products, sales_reps, orders, and order_items, redundancy is reduced and data integrity is improved. Each entity is stored only once, and relationships are maintained using foreign keys.

Thus, normalization is essential for ensuring consistency, scalability, and efficient data management.
