/* To find a every movie rental duration percentile in their relevant category*/
SELECT f.title, c.name, f.rental_duration,
NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM film f
JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category c
ON c.category_id=fc.category_id
WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music')
