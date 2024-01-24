# Below is showing the sales in different countries using JOINS
SELECT D.country,
COUNT (customer_id) AS count_of_customers
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
GROUP BY D.country
ORDER BY count_of_customers DESC
Limit 10
