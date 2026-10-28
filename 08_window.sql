-- WINDOW FUNCTION

-- The defining characteristic of a window function is that it does not 
-- collapse your rows into a single output row. 
-- Unlike a standard GROUP BY clause, which groups rows and hides individual details, 
-- a window function allows you to calculate aggregates, rankings, or running totals 
-- while preserving the identity and detail of every single row


-- give me total product's price sum on category level

SELECT
    category_id,
    SUM(price)
FROM products
GROUP BY category_id;

-- window func
SELECT
    *,
    SUM(price) OVER (PARTITION BY category_id)
FROM products;


-- without reducing or affecting the table structure
-- give me avg price across all products

SELECT
    *,
    ROUND(AVG(price) OVER (),2) as avg_price --partition over whole table
FROM products;


-- RANK = row_number(), rank(), dense_rank()
-- give me rank to a product based on how pricy it is

SELECT 
    product_name,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC),
    RANK() OVER (ORDER BY price DESC),
    DENSE_RANK() OVER (ORDER BY price DESC),
    (PERCENT_RANK() OVER (ORDER BY price DESC))*100
FROM products;



