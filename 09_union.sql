-- UNION and UNION ALL
-- used to stack row over row
-- UNION -> SLOWER, use internal sort and drop duplicates
-- UNION -> FASTER, stack one table over other (have duplicates)

-- give me list of humans/users that are present inside the community


SELECT first_name, last_name FROM employees
UNION ALL
SELECT first_name, last_name FROM customers;