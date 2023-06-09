/* To find the every movie rental duration percentile in their relevant category*/
SELECT f.title AS title, c.name as category, f.rental_duration,
NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM film f
JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category c
ON c.category_id=fc.category_id
WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music')

/* based on the category which movie  was rented most and for how much duration*/
SELECT c.name as category, f.rental_duration,count(*) as total_movies
FROM film f
JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category c
ON c.category_id=fc.category_id
WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music')
group by 1,2
order by 3 desc,2 desc 
