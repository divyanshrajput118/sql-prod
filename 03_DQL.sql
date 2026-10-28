SELECT
    product_id,
    product_name AS "ProductName", --without "" the col name will change to Productname/error for Product Name
    stock_quantity
FROM products;


SELECT DISTINCT country FROM customers;

--Filter data using WHERE
SELECT * FROM products
WHERE price > 300;

SELECT * FROM products
WHERE NOT is_active;


-- Products having price > 120 and price < 200

SELECT * FROM products
WHERE price BETWEEN 120 AND 200; --inclusive

-- Give me products from electronics and books
SELECT * FROM products
WHERE category_id IN (1, 3);

-- ! give me product having product name starting
-- with "Wireless"

SELECT * FROM products
WHERE product_name LIKE 'Wireless%';

-- give me customers who does not have a phone number

SELECT * FROM customers
WHERE phone IS NULL; -- phone = NULL would return nothing

-- COALESCE
SELECT
    first_name,
    last_name,
    COALESCE(phone, 'Phone number unavailable') AS phone,
    COALESCE(city, 'No city') AS city
FROM customers;


-- SORTING 

-- Give me products from cheapest to expensive

SELECT *
FROM products
ORDER BY price DESC; --ASC and DESC

-- Give me products from cheapest to expensive for each category
-- remember dictionary sorting

SELECT *
FROM products
ORDER BY category_id DESC, price DESC;


-- Give top 5 most expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;


-- ! PAGENITAION

SELECT * 
FROM products
ORDER BY product_id
LIMIT 5
OFFSET 5;

-- offset = (pageNo - 1) * limit
