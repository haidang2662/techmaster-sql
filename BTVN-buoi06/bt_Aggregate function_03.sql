
-- câu 1 :
select * 
from address
where address like "%San%";

-- Câu 2 :
 select * 
from address
where address like "1%y";

-- Câu 3 :
select * 
from address
where address like "__a%";

-- câu 4 :
select customer.first_name,customer.last_name
from customer
inner join address on address.address_id = customer.address_id
where address.address like "%o"; 

-- câu 5 :
select film.title
from film
inner join film_category on film_category.film_id = film.film_id
inner join category on category.category_id = film_category.category_id
where category.name = 'Games'; 

-- câu 6 :
select fullname
from person
where salary between 300 and 2000;  

-- câu 7 :
select fullname
from person
where Month(birthday) between 7 and 12; 

-- câu 8 :
select *, "Happy Birthday!" as message 
from person 
where month(birthday) = month(curdate());


-- Câu 9 :
select fullname 
from person
where year(birthday) = 2000 or year(birthday) = 1990 or year(birthday) = 1991;