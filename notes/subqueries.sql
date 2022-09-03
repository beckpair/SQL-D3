-- SUBQUERIES
-- Two queries split apart that eventually become a subquery
-- Find a customer_id that has an amount greater than
-- 175 in total payments

SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

SELECT *
FROM customer;

-- Subquery to find the 6 customers that have
-- a total amount of payments greater than 175

SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_Id
	FROM payment
	GROUP BY customer_Id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id, first_name, last_name;

-- Basic subquery
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 150
	ORDER BY SUM(amount)DESC
);

-- Find all films that are in English
SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name = 'English'
	
);

--Actors that appear in more than 5 movies
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
	SELECT actor_id
	FROM film_actor
	GROUP BY actor_id
	HAVING COUNT(film_id) > 40
);

-- Actors that appear in more than 40 movies JOIN
SELECT first_name, last_name, COUNT(film_id)
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY first_name, last_name
HAVING COUNT(film_id) > 40;