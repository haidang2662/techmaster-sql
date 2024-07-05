-- câu 1 :
select count(actor_id) from sakila.actor ;

-- câu 2 :
select min(length),max(length)
from sakila.film;

-- câu 3 :
select rating,count(rating)
from sakila.film
where rating = "R"; 

-- câu 4 :
select avg(rental_rate)
from sakila.film
where film.length > 60; 