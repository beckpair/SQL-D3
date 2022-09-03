SELECT *
FROM staff;

SELECT *
FROM rental;

SELECT first_name, last_name, count(rental.staff_id)
FROM staff
FULL JOIN rental
ON rental.staff_id = staff.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(rental.staff_id) DESC;

-- INNER JOIN with actor and film_actor
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- Adding another join
SELECT actor.actor_id, first_name, last_name, film.film_id, title
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id;

-- LEFT JOIN on the ACTOR and FILM_ACTOR table
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name IS NULL;

-- FULL JOIN to check for actors not in movies
SELECT actor.actor_id, first_name, last_name, film_id
FROM actor
FULL JOIN film_actor
ON actor.actor_id = film_actor.actor_id
WHERE film_id IS NULL;

-- JOIN that will produce info about a customer
-- from the country of Angola
-- address to city to country
SELECT first_name, last_name, email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

