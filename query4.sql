/* The count of rentals for each store per month */

SELECT DATE_PART('month',r.rental_date) AS month, DATE_PART('year', r.rental_date) as year,st.store_id , count(*) as count_rentals
FROM store st
JOIN staff s
ON st.store_id=s.store_id
JOIN rental r
ON r.staff_id=s.staff_id
GROUP BY 1,2,3
ORDER BY 4 desc

