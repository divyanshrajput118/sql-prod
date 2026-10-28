-- Give me all orders including emp details of the emp who processed that order
-- only include order punched by emp 

SELECT COUNT(*) FROM orders;
SELECT * FROM employees;


-- INNER JOIN
SELECT *
FROM orders o
JOIN employees e
ON o.employee_id = e.employee_id;

-- give me all orders and include emp details of the emp who processed
-- that order and if it is directly coming from the customer keep
-- emp details empty

-- LEFT JOIN
SELECT o.order_id,
        o.customer_id,
        o.employee_id,
        o.order_date,
        o.shipping_city,
        o.status,
        e.employee_id,
        e.first_name,
        e.last_name
FROM orders o   --LEFT TABLE
    LEFT JOIN employees e
ON o.employee_id = e.employee_id;

--RIGHT JOIN
SELECT o.order_id,
        o.customer_id,
        o.employee_id,
        o.order_date,
        o.shipping_city,
        o.status,
        e.employee_id,
        e.first_name,
        e.last_name
FROM orders o  
    RIGHT JOIN employees e
ON o.employee_id = e.employee_id;


-- FULL OUTER JOIN
SELECT o.order_id,
        o.customer_id,
        o.employee_id,
        o.order_date,
        o.shipping_city,
        o.status,
        e.employee_id,
        e.first_name,
        e.last_name
FROM orders o  
    FULL OUTER JOIN employees e
ON o.employee_id = e.employee_id;



-- CROSS JOIN (Cartesion join)
SELECT *
FROM departments
CROSS JOIN categories;
