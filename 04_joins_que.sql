-- Give me all customers who did not place any order

SELECT * FROM customers;
SELECT * FROM orders;


SELECT * 
    FROM customers c
    LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE  o.status IS NULL;


-- Give me orders which have not been paid

SELECT * FROM orders;
SELECT * FROM payments;

SELECT *
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;


-- Give info about all orders that are thre in the DB 
-- Include info about order_items, product, customer and
-- category the product belongs to

-- order_item, products, customers, categories

SELECT 
    o.order_id,
    o.status,
    oi.product_id,
    oi.unit_price,
    p.product_name,
    p.price,
    c.category_name,
    cu.first_name,
    cu.last_name
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN categories c ON c.category_id = p.category_id
JOIN customers cu ON cu.customer_id = o.customer_id;


-- Give me info about emp including their managers info
-- Self join

SELECT 
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    COALESCE(mang.first_name, 'No Manager') AS "Manager First Name",
    COALESCE(mang.last_name, 'No Manager')  AS "Manager Last Name"
FROM employees emp
LEFT JOIN employees mang
ON emp.manager_id = mang.employee_id;
