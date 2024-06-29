SELECT distinct(country)  FROM Person  ;
SELECT fullname FROM Person order by fullname;
SELECT fullname FROM person order by job desc ;
SELECT distinct(job) FROM person ;
SELECT count(id) as number , country FROM person group by country order by number desc ;
SELECT sum(salary) FROM person;
SELECT count(id),job,avg(salary) from Person group by job;
SELECT * from person where salary > 5000000 and birthday between '1990-01-01' and '1995-12-31';
select * from person where salary > 60000 and (job ="Developer" or job= "Engineer");