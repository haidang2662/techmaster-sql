create table product (
product_id int,
product_name varchar(25),
price double,
quantity int 
);

insert into product (product_id,product_name,price,quantity)
values 
(1,"books",10,100),
(2,"notebooks",5,100),
(3,"pen",5,100),
(4,"pencil",5,50),
(5,"umbrellas",20,100),
(6,"snacks",10,100),
(7,"dresses",50,100),
(8,"ties",15,200),
(9,"toys",30,150),
(10,"shoes",30,50);

alter table product
add description varchar(25);

set SQL_SAFE_UPDATES = 0;

update product
set price = 99
where product_id = 1;

update product
set price = price * 1.1
where product_id = 2;

set SQL_SAFE_UPDATE = 0;
update person
set fullname = "John Doe" 
where id = 10;

update person
set country = "Canada"
where id = 3;

update person
set birthday = "1990-05-15",
country = "Việt Nam"
where id = 7 ;

update person
set salary = salary*1.4
where id = 40;

update person
set salary = salary*0.85
where salary > 6000;
