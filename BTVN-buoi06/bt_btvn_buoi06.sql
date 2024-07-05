-- câu 1 :
select first_name
from actor
where first_name like "S%";

-- câu 2 :
select *
from film
where release_year between 2000 and 2010; 

-- câu 3 :
select * 
from film
where rating = 'PG' or rating = 'PG-13'; 
 
 -- câu 4 :
 select a.*,count(fa.film_id) as so_phim_tham_gia
 from actor a
 inner join film_actor fa on fa.actor_id = a.actor_id
 group by a.actor_id
 order by so_phim_tham_gia desc;
 
 -- câu 5 :
 select f.*,c.name
 from film f
 inner join film_category fc on fc.film_id = f.film_id
 inner join category c on c.category_id = fc.category_id;
 
 -- câu 6 :
 select f.*,count(fa.actor_id) as so_dien_vien_tham_gia
 from film f
 inner join film_actor fa on fa.film_id = f.film_id
 group by fa.film_id
 order by so_dien_vien_tham_gia desc;
 
 -- câu 7 :
 select a.*,count(fa.film_id) as so_luong_phim_tham_gia
 from actor a
 inner join film_actor fa on fa.actor_id = a.actor_id
 group by fa.actor_id
 having so_luong_phim_tham_gia > 30;
 
 -- câu 8 :
 select a.*,count(fa.film_id) as so_luong_phim_tham_gia
 from actor a
 inner join film_actor fa on fa.actor_id = a.actor_id
 group by fa.actor_id
 having so_luong_phim_tham_gia is null ;
 
 -- câu 10:
 select f.*,c.name
 from film f
 inner join film_category fc on fc.film_id = f.film_id
 inner join category c on c.category_id = fc.category_id
 where c.name = 'Horror';
 