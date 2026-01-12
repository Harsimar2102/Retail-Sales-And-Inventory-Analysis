INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Grocery'),
(4, 'Home & Kitchen');

SELECT * FROM categories;

INSERT INTO products VALUES
(101, 'Laptop', 1, 900.00),
(102, 'Smartphone', 1, 600.00),
(103, 'T-Shirt', 2, 25.00),
(104, 'Jeans', 2, 60.00),
(105, 'Rice Bag', 3, 40.00),
(106, 'Cooking Oil', 3, 15.00),
(107, 'Blender', 4, 120.00),
(108, 'Coffee Maker', 4, 150.00);

SELECT * FROM products;

INSERT INTO inventory VALUES
(101, 15, 10),
(102, 8, 10),
(103, 50, 20),
(104, 30, 15),
(105, 5, 10),
(106, 40, 15),
(107, 6, 10),
(108, 12, 8);

SELECT * FROM inventory;

INSERT INTO orders VALUES
(1, '2025-01-01', 101, 2, 1800.00),
(2, '2025-01-03', 102, 3, 1800.00),
(3, '2025-01-05', 103, 5, 125.00),
(4, '2025-01-07', 104, 2, 120.00),
(5, '2025-01-10', 105, 4, 160.00),
(6, '2025-01-12', 106, 6, 90.00),
(7, '2025-01-15', 107, 1, 120.00),
(8, '2025-01-18', 108, 2, 300.00),
(9, '2025-02-02', 101, 1, 900.00),
(10, '2025-02-05', 102, 2, 1200.00);

SELECT * FROM orders;

/* Total Sales by Category*/
SELECT c.category_name,
       SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

/* Top Selling Products*/
SELECT p.product_name,
       SUM(o.quantity_sold) AS total_units_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;

/*Low Stock Products (Inventory Risk)*/
SELECT p.product_name,
       i.stock_quantity,
       i.reorder_level
FROM inventory i
JOIN products p ON i.product_id = p.product_id
WHERE i.stock_quantity < i.reorder_level;

/*Monthly Sales Trend*/
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(sales_amount) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM inventory;








