-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact Table
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    revenue DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- dim_date
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024),
(2, '2024-02-01', 2, 2024),
(3, '2024-03-01', 3, 2024);

-- dim_store
INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi'),
(3, 'Store C', 'Kolkata');

-- dim_product
INSERT INTO dim_product VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Shirt', 'Clothing'),
(103, 'Milk', 'Groceries');

-- fact_sales (at least 10 rows)
INSERT INTO fact_sales VALUES
(1,1,1,101,1,50000),
(2,1,2,102,2,2000),
(3,1,3,103,5,300),
(4,2,1,101,1,52000),
(5,2,2,102,3,3000),
(6,2,3,103,6,360),
(7,3,1,101,2,100000),
(8,3,2,102,4,4000),
(9,3,3,103,7,420),
(10,3,1,103,2,120);
