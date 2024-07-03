-- Phần 1 : BT ở lớp
-- Cau 1 :
select city.city as city , country.country as country
from country 
inner join city
on country.country_id = city.country_id;

-- Cau 2 : 
select city.city as city
from city
inner join country
on country.country_id = city.country_id
where country.country = "United States";

-- Cau 3 :
select address.address as address
from address
inner join city
on city.city_id = address.city_id
where city.city = "hanoi";

-- Câu 4 : 
select film.title , film.description , category.name
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where film.rating = "R";

-- Câu 5 : 
select film.title
from film
inner join film_actor on film.film_id = film_actor.film_id
inner join actor on actor.actor_id = film_actor.actor_id
where actor.first_name = "Nick"and actor.last_name = "WAHLBERG";

-- Câu 6 : 
select customer.email 
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on country.country_id = city.country_id
where country.country = "United States";

-- Phần 2 : BTVN 

create table Students (
student_id int primary key,
student_name varchar(25) ,
student_age int
);

create table Courses (
course_id int primary key,
course_name varchar(25) ,
course_description text
);

create table Enrollments (
enrollment_id int primary key,
student_id int ,
course_id int ,
foreign key (student_id) references students(student_id) ,
foreign key (course_id) references courses(course_id)
);

insert into students (student_id,student_name,student_age)
values
(1,"Nam",19),
(2,"Hùng",20),
(3,"Thanh",21),
(4,"Tú",18),
(5,"Thắng",20);

insert into courses (course_id,course_name,course_description) 
values
(1,"java","Tổng quát về java"),
(2,"html,css","Dạy về phần front end"),
(3,"CTDL","Tư duy về lập trình IT"),
(4,"DATA BASE","Cách quản lý , bảo mật cơ sở dữ liệu"),
(5,"Spring Boots","Cách để kết nối giữa java , html css và data base");

insert into enrollments (enrollment_id,student_id,course_id) 
values
(1,1,2),
(2,2,1),
(3,3,3),
(4,4,5),
(5,5,4);

-- Câu 1 :
select *
from students
inner join enrollments on students.student_id = enrollments.student_id
inner join courses on courses.course_id = enrollments.course_id;

-- Câu 2 :
select *
from courses
inner join enrollments on courses.course_id = enrollments.course_id
where student_id = 3;

-- Câu 3 :
select students.student_name  , count(enrollments.course_id) as so_luong_khoa_hoc 
from students
inner join enrollments on enrollments.student_id = students.student_id  group by students.student_name;

-- Cau 4 :
select courses.course_name , count(enrollments.course_id) as so_luong_khoa_hoc
from courses
inner join enrollments on enrollments.course_id = courses.course_id group by courses.course_name
having so_luong_khoa_hoc is null;

-- Cau 5 :
select students.student_name , courses.course_name 
from students 
inner join enrollments on enrollments.student_id = students.student_id
inner join courses on courses.course_id = enrollments.course_id
order by students.student_name , courses.course_name;

-- Cau 6 :
select students.* , courses.course_name 
from students
inner join enrollments on enrollments.student_id = students.student_id
inner join courses on courses.course_id = enrollments.course_id ;

-- Cau 7 :
select students.* , courses.course_name 
from students
inner join enrollments on enrollments.student_id = students.student_id
inner join courses on courses.course_id = enrollments.course_id 
order by students.student_name , students.student_age;

-- Cau 8 :
select courses.*,count(enrollments.course_id) as so_luong_sv_dang_ky
from courses
inner join enrollments on enrollments.course_id = courses.course_id group by courses.course_id; 
