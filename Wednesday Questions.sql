-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district 
FROM customer 
INNER JOIN address 
ON customer.address_id = address.address_id 
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount
FROM customer 
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount DESC;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT last_name, first_name
FROM customer 
WHERE customer_id  IN (
	SELECT customer_id 
	FROM payment
	GROUP BY customer_id 
	HAVING sum(amount) > 175
	ORDER BY sum(amount) DESC
);

-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, city
FROM customer 
INNER JOIN address 
ON customer.address_id = address.address_id 
INNER JOIN city 
ON address.city_id = city.city_id
WHERE city = 'Nepal';

--5. Which staff member had the most transactions
SELECT staff.first_name, staff.last_name, staff.staff_id, count(amount)
FROM staff 
INNER JOIN payment 
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id  
ORDER BY staff.staff_id;

--6. How many movies of each rating are there?
SELECT rating, count(rating)
FROM film
GROUP BY rating
ORDER BY count(rating) DESC;

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
);

--8. How many free rentals did our stores give away?
SELECT count(payment_id)
FROM payment
WHERE amount = 0;









