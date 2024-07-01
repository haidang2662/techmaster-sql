select city.city as city , country.country as country
from country 
inner join city
on country.country_id = city.country_id;

select city.city as city
from city
inner join country
on country.country_id = city.country_id
where country.country = "United States";

select address.address as address
from address
inner join city
on city.city_id = address.city_id
where city.city = "hanoi";

select film.title as title , film.description as description , film_category.category_id as category_id
from film
inner join film_category
on film.film_id = film_category.film_id
where film.rating = "R";

select film.title as title
from film
inner join film_actor
on film.film_id = film_actor.film_id
where film_actor.actor_id = 2;

select customer.email as email
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on country.country_id = city.country_id
where country.country = "United States";