-- improved version of subqueries with more readability and resuability
-- Drawback of subq , we have to use same subq in same question again and again
-- WITH var_name AS (..query)


WITH category_stats AS (
    SELECT 
    p.category_id,
    SUM(oi.unit_price * oi.quantity) AS total_revenue
    FROM products p
    JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.category_id
)
SELECT
    c.category_name,
    category_stats.total_revenue
FROM category_stats
LEFT JOIN categories c 
ON c.category_id = category_stats.category_id;


-- give me categories with highest sales

WITH category_stats AS (
    SELECT 
    p.category_id,
    SUM(oi.unit_price * oi.quantity) AS total_revenue
    FROM products p
    JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.category_id
),
highest_selling_cat AS (
    SELECT * FROM category_stats
    ORDER BY total_revenue DESC
    LIMIT 1
)
SELECT
    c.category_name,
    highest_selling_cat.total_revenue
FROM highest_selling_cat
LEFT JOIN categories c
ON c.category_id = highest_selling_cat.category_id;


-- resuability
-- give me total spend of a customer
-- also give me average spend of all customers
-- also give me flag TRUE or FALSE basis of if the customer
-- have above average spending


WITH customer_total AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity*oi.unit_price) AS customer_spend
    FROM orders o
    LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
    WHERE o.status = 'completed'
    GROUP BY o.customer_id
)
SELECT
    ct.customer_id,
    ct.customer_spend,
    (SELECT ROUND(AVG(customer_spend),2) FROM customer_total) AS avg_spend,
    ct.customer_spend > (SELECT ROUND(AVG(customer_spend),2) FROM customer_total) AS is_above_avg
FROM customer_total ct;


-- using subQuery

-- SELECT 
--     sub.customer_id,
--     sub.customer_spend,
--     avg_sub.avg_spend,
--     sub.customer_spend > avg_sub.avg_spend AS is_above_avg
-- FROM (
--     -- Derived table replacing 'customer_total' CTE
--     SELECT
--         o.customer_id,
--         SUM(oi.quantity * oi.unit_price) AS customer_spend
--     FROM orders o
--     LEFT JOIN order_items oi
--         ON o.order_id = oi.order_id
--     WHERE o.status = 'completed'
--     GROUP BY o.customer_id
-- ) AS sub
-- CROSS JOIN (
--     -- Derived table replacing the overall average calculation
--     SELECT ROUND(AVG(customer_spend), 2) AS avg_spend
--     FROM (
--         SELECT
--             SUM(oi.quantity * oi.unit_price) AS customer_spend
--         FROM orders o
--         LEFT JOIN order_items oi
--             ON o.order_id = oi.order_id
--         WHERE o.status = 'completed'
--         GROUP BY o.customer_id
--     ) AS inner_sub
-- ) AS avg_sub;