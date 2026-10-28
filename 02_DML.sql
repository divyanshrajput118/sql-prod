--operations INSERT, DELETE, UPDATE are DML commands

INSERT INTO customers
(first_name, last_name, email, phone, city, country)
VALUES
('John', 'Doe', 'johndoe@gmail.com', '9999999999', 'Mumbai', 'India');

SELECT * FROM customers;

INSERT INTO categories
(
    category_name,
    description
)
VALUES
('Dairy', 'Dairy products'),
('Gym', 'Gym products'),
('Cold drinks', 'cold drinks description');


SELECT * FROM products;

UPDATE products
SET stock_quantity = 50
WHERE product_id = 1;

UPDATE products
SET price = price + 100;


SELECT * FROM departments;

DELETE FROM departments
WHERE department_id = 4;