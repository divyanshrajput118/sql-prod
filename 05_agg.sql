-- # AGG 1

-- COUNT, SUM, MIN, MAX, AVG

SELECT COUNT(*) as one,
    COUNT(phone) as two,
    COUNT(DISTINCT country) as three
FROM customers;


-- give me total revenue generated till now order_items

SELECT SUM(quantity*unit_price) AS total_revenue FROM order_items;


-- # AGG 2 GROUP BY, HAVING

SELECT category_id, COUNT(*) FROM products
GROUP BY category_id
ORDER BY category_id;


-- give me total number of active and inactive products
-- count in each category
-- F W G H S D O L (seq of execution)

SELECT category_id, is_active, COUNT(*) AS cnt 
FROM products
GROUP BY category_id, is_active;

-- give me total number of products in each category
-- include category name in the result

SELECT c.category_id, c.category_name, COUNT(*)
FROM products p
JOIN categories c
ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name;   


-- give me total number of products in each category
-- where product is greater than 4

SELECT category_id, COUNT(*)
FROM products
GROUP BY category_id
HAVING COUNT(*) > 4;


-- find departments having more than one emp,
-- where their combined salary of whole department exceeds
-- 200000 rs.


SELECT department_id, SUM(salary), COUNT(employee_id)
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 1 AND SUM(salary) > 200000;


-- find departments having more than one managed emp,
-- where their combined salary of whole department exceeds
-- 200000 rs.

SELECT department_id, SUM(salary), COUNT(employee_id)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY department_id
HAVING COUNT(employee_id) > 1;

SELECT * FROM employees;