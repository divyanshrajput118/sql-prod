-- give me all the customers having at least one cancelled order

SELECT customer_id FROM orders
WHERE status = 'cancelled';
-- WHERE custId IN (7, 8, 17, 18) thought process

SELECT *
FROM customers
WHERE customer_id 
IN
    (
        SELECT customer_id FROM orders
        WHERE status = 'cancelled'
    );



-- give me all products which are having price>avg price across all products

SELECT AVG(price) AS avg_price FROM products; -- 155.26066

SELECT *
FROM products
WHERE price > (
    SELECT AVG(price) AS avg_price FROM products
);



-- give me sales revenue on category level
-- electronics - 3000
-- clothing - 4000

SELECT product_id, SUM(unit_price * quantity) 
FROM order_items
GROUP BY product_id;

SELECT * FROM products;

SELECT 
    c.category_name,
    SUM(oi.unit_price * oi.quantity) AS total_revenue
FROM products p
LEFT JOIN categories c
ON p.category_id = c.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name;

-- derived table !!!
 
SELECT category_name, total_revenue 
FROM (
    SELECT 
    p.category_id as stat_id,
    SUM(oi.unit_price * oi.quantity) AS total_revenue
    FROM products p
    JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.category_id
) AS temp
LEFT JOIN categories c
ON temp.stat_id = c.category_id
WHERE total_revenue > 100;