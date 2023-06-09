/* query for retrieving the count and percentage of movies that belong to a specific set of categories */
select t1.name as category, count(*) AS movie_count, sum(count(*)) over() as total_movies,
 (count(*))*100 / sum(count(*)) over() as percentage 
from (select f.title, c.name
  from film f
  join film_category fc 
  on fc.film_id=f.film_id
  join inventory i 
  on i.film_id=fc.film_id
  join category c 
  on fc.category_id=c.category_id
  join rental r 
  on r.inventory_id=i.inventory_id
  where c.name in('Animation','Children','Classics','Comedy','Family','Music')) AS t1
group by 1
order by 4;

