SELECT count(id) as number1 , job from person group by job;
select fullname from person where job = "manager" and salary > 70000;
select * from person where year(curdate()) - year(birthday) between 25 and 35;
select count(id) as number2 , country from person group by country;
select count(id) as number3 , gender from person group by gender ;
select count(id) , country , job from person group by country , job;
select fullname , birthday from person order by birthday desc ;
select count(id) as number4, job from person group by job having count(job)>3;