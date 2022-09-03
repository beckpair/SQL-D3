-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
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

-- 4. List all customers that live in Nepal
SELECT first_name, last_name, email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(payment.staff_id)
FROM staff
FULL JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(payment.staff_id) DESC;


-- 6. How many movies of each rating at there?
-- SELECT 
-- FROM film
-- WHERE  

-- 7. Show all customers who have made a single payment above $6.99 (use Subqueries)
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
	SELECT customer_Id
	FROM payment
	GROUP BY customer_id, payment.amount
	HAVING amount > 6.99
)
GROUP BY customer_id, first_name, last_name;


-- 8. How many free rentals did our stores give away?
SELECT rental.rental_id, amount
FROM rental
FULL JOIN payment
ON payment.rental_id = rental.rental_id
WHERE amount = 0;