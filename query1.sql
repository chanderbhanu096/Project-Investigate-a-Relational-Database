
select t1.name as category, count(*) AS movie_count, sum(count(*)) over() as total_movies,
  (count(*))*100 / sum(count(*)) over() as percentage    /* here count(*) will calcualate the total movies in one category and sum is 
                                                            allowing us to perform sum operation across the whole data set filtered from the subquery */
  
from (select fi.title, c.name
  from film fi
  join film_category f 
  on f.film_id=fi.film_id
  join inventory i 
  on i.film_id=f.film_id
  join category c 
  on f.category_id=c.category_id
  join rental r 
  on r.inventory_id=i.inventory_id
  where c.name in('Animation','Children','Classics','Comedy','Family','Music')) AS t1
  
group by 1
order by 4;

