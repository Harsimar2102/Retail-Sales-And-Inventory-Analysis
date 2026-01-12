USE retail_sales_inventory;
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock_quantity INT,
    reorder_level INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    quantity_sold INT,
    sales_amount DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

SHOW TABLES;
