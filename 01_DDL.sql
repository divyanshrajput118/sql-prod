-- CREATE TABLE IF NOT EXISTS departments (
--     department_id SERIAL PRIMARY KEY, --SERIAL is INT, value cant be NULL and it must be unique
--     department_name VARCHAR(50) NOT NULL
-- );

-- ! DDL (data definition language)

-- INSERT INTO departments(department_name)
-- VALUES
-- ('Sales'),
-- ('Support'),
-- ('Warehouse');

-- INSERT INTO departments (department_id, department_name) 
-- VALUES
-- (4,'Tech');

-- SELECT * FROM departments;


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    bio TEXT, --for arbitrary length
    job_title VARCHAR(50) NOT NULL,
    salary INT NOT NULL CHECK (salary > 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    hire_date DATE NOT NULL,
    last_login TIMESTAMP,
    employee_status VARCHAR(20) NOT NULL DEFAULT 'active'
                    CHECK (employee_status IN ('active', 'on_leave', 'terminated')),
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    department_id INT REFERENCES departments(department_id), --foreign key
    manager_id INT REFERENCES employees(employee_id)
);


INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date) VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, NULL,    '2020-06-15'),
    ('Fake',   'Robert',    'robert.chen@techbazaar.com',     1, 'Rep',                  50000.00, 1,    '2024-01-01'),
    ('Marcus', 'Webb',      'marcus.webb@techbazaar.com',     1, 'Sales Representative', 58000.00, 1,    '2021-09-01'),
    ('Elena',  'Garcia',    'elena.garcia@techbazaar.com',    1, 'Senior Sales Rep',     68000.00, 1,    '2019-11-20'),
    ('James',  'Okafor',    'james.okafor@techbazaar.com',    2, 'Support Lead',         72000.00, NULL, '2018-05-10'),
    ('Lily',   'Zhang',     'lily.zhang@techbazaar.com',      2, 'Support Agent',        48000.00, 5,    '2022-02-14'),
    ('Diego',  'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent',        46000.00, 5,    '2023-01-09'),
    ('Sara',   'Osei',      'sara.osei@techbazaar.com',       3, 'Warehouse Lead',       55000.00, NULL, '2020-08-23');
 


ALTER TABLE employees
ADD COLUMN
internal_note VARCHAR(100) NOT NULL DEFAULT 'N/A';

ALTER TABLE employees
RENAME COLUMN
internal_note TO hr_note;

ALTER TABLE employees
DROP COLUMN hr_note;



SELECT * FROM employees;

-- 'TRUNCATE vs DROP VS DELETE'

-- DROP TABLE (deletes entire structure + data)


-- TRUNCATE (deletes all data at once , faster)
-- DELETE (deletes all data row by row, slow)