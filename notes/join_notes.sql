SELECT *
FROM order_;

SELECT *
FROM customer;

-- INNER JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
INNER JOIN order_
ON customer.customer_id = order_.customer_id;

-- WITHOUT JOIN
SELECT first_name, last_name, customer_id
FROM customer
GROUP BY customer_id;

SELECT customer_id, order_date, amount
FROM order_;

-- LEFT JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN order_
ON customer.customer_id = order_.customer_id
WHERE order_.customer_id IS NULL;

SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN order_
ON customer.customer_id = order_.customer_id
WHERE order_date IS NOT NULL;

SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN order_
ON customer.customer_id = order_.customer_id;

--RIGHT JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
RIGHT JOIN order_
ON customer.customer_id = order_.customer_id;

-- Right join with Null Data Table A
SELECT first_name, last_name, order_date, amount
FROM customer
RIGHT JOIN order_
ON customer.customer_id = order_.customer_id
WHERE first_name IS NULL;

-- Right join NOT NULL Table A
SELECT first_name, last_name, order_date, amount
FROM customer
RIGHT JOIN order_
ON customer.customer_id = order_.customer_id
WHERE first_name IS NOT NULL;

-- FULL JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
FULL JOIN order_
ON customer.customer_id = order_.customer_id;

-- Full Join where keys are null
SELECT first_name, last_name, order_date, amount
FROM customer
FULL JOIN order_
ON customer.customer_id = order_.customer_id
WHERE last_name IS NULL or amount IS NULL;

-- Full Join where keys are NOT null
SELECT first_name, last_name, order_date, amount
FROM customer
FULL JOIN order_
ON customer.customer_id = order_.customer_id
WHERE last_name IS NOT NULL AND amount IS NOT NULL;