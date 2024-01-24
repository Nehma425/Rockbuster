#  Here is the average amount paid by the top 5 customers using a SUBQUERY


SELECT AVG(total_amount_paid) AS "average"
FROM
(SELECT A.customer_id, A.first_name, A.last_name, D.country,C.city,
SUM(E.amount) AS total_amount_paid
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C on B.city_id = C.city_id
INNER JOIN country D on C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE city IN('Aurora','Acua','Citrus Heights','Iwaki','Ambattur','Shanwei','So
Leopoldo','Hami','Tianjin','Cianjur')
GROUP BY A.customer_id, first_name, last_name, country, city
ORDER BY total_amount_paid DESC
LIMIT 5) AS total_amount_paid;
