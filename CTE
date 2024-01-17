# Here is a SQL query displaying the use of a common table expression to show the top 5 customers in each country.
SELECT 
    country.country,
    COUNT(DISTINCT customer.customer_id) AS total_customers,
    SUM(payment.amount) AS total_revenue
FROM 
    payment
INNER JOIN staff ON payment.staff_id = staff.staff_id
INNER JOIN customer ON payment.customer_id = customer.customer_id
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
INNER JOIN rental ON payment.rental_id = rental.rental_id
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN (
    SELECT 
        film.rating,
        COUNT(customer.customer_id) AS total_customers
    FROM 
        film
    INNER JOIN film_category ON film.film_id = film_category.film_id
    INNER JOIN inventory ON film.film_id = inventory.film_id
    INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
    INNER JOIN customer ON rental.customer_id = customer.customer_id
    GROUP BY 
        film.rating
    ORDER BY 
        total_customers DESC
    LIMIT 20
) AS top_ratings ON film.rating = top_ratings.rating
GROUP BY 
    country.country
ORDER BY 
    total_revenue DESC;
