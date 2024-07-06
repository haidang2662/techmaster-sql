create table Categories (
category_id int primary key,
category_name varchar(25)
);

create table Products (
product_id int primary key,
product_name varchar(25),
category_id int ,
price double ,
foreign key (category_id) references categories(category_id)
);

create table Customers (
customer_id int primary key,
customer_name varchar(25),
email varchar(25)
) ;

create table Orders (
order_id int primary key ,
customer_id int,
order_date date,
foreign key (customer_id) references customers(customer_id)
);

create table Orderdetails (
order_detail_id int primary key ,
order_id int ,
product_id int ,
quantity int ,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

insert into categories(category_id,category_name)
values 
(1,'very_fresh'),
(2,'fresh'),
(3,'little_fresh');

insert into products(product_id,product_name,category_id,price)
values
(1,'banana',1,20),
(2,'apple',2,30),
(3,'watermelon',3,35);

insert into products(product_id,product_name,category_id,price)
values(4,'melon',1,40);

insert into customers(customer_id,customer_name,email)
values 
(1,'hằng','hang@gmail.com'),
(2,'hạnh','hanh@gmail.com'),
(3,'thanh','thanh@yahoo.com');

insert into orders(order_id,customer_id,order_date)
values
(1,1,'2000-01-01'),
(2,2,'2001-09-09'),
(3,3,'2024-01-02');

insert into orderdetails(order_detail_id,order_id,product_id,quantity)
values
(1,1,1,10),
(2,2,2,20),
(3,3,3,30);

insert into orders(order_id,customer_id,order_date)
values (4,1,'2022-11-11');

insert into orderdetails(order_detail_id,order_id,product_id,quantity)
values (4,4,1,15);

-- Câu 1 :
select p.*,c.category_name
from products p
inner join orderdetails od on od.product_id = p.product_id
inner join orders o on o.order_id = od.order_id
inner join categories c on c.category_id = p.category_id
where o.order_id = 1;

-- câu 2 :
select o.order_id , sum(p.price*od.quantity) as tong_tien_don_hang
from orders o
inner join orderdetails od on od.order_id = o.order_id
inner join products p on p.product_id = od.product_id
where o.order_id = 1;

-- câu 3:
select p.* , count(od.product_id) as lan_xuat_hien_trong_don_hang
from products p
left join orderdetails od on od.product_id = p.product_id
group by p.product_id
having lan_xuat_hien_trong_don_hang = 0;

-- câu 4 :
 select c.category_name , sum(od.quantity)
 from categories c
 inner join products p on p.category_id = c.category_id
 inner join orderdetails od on od.product_id = p.product_id
 group by (c.category_name);
 
 -- Câu 5 :
 select (c.customer_name)  , sum(od.quantity) as total_ordered
 from customers c 
 inner join orders o on o.customer_id = c.customer_id
 inner join orderdetails od on od.order_id = o.order_id
 group by (c.customer_name); 
 
 -- câu 6 :

 select  c.category_id , c.category_name , sum(od.quantity) as total_ordered 
 from categories c 
 inner join products p on p.category_id = c.category_id
 inner join orderdetails od on od.product_id = p.product_id
 group by c.category_id , c.category_name
 order by total_ordered desc
 limit 1;
 
 -- câu 7 :
 
 select  c.category_id , c.category_name , sum(od.quantity) as total_ordered 
 from categories c 
 inner join products p on p.category_id = c.category_id
 inner join orderdetails od on od.product_id = p.product_id
 group by c.category_id , c.category_name;
 
 -- câu 8 :
select c.customer_id , c.customer_name , c.email , sum(od.quantity) as total_ordered
 from customers c 
 inner join orders o on o.customer_id = c.customer_id
 inner join orderdetails od on od.order_id = o.order_id
 group by c.customer_id , c.customer_name , c.email
 order by total_ordered desc
 limit 3;
 
 -- câu 9 :
 select c.customer_id , c.customer_name  , count(o.customer_id) as total_orders
 from customers c
 inner join orders o on o.customer_id = c.customer_id
 where o.order_date between '2000-01-01' and '2023-01-01' 
 group by c.customer_id , c.customer_name 
 having total_orders > 1 ;
 
 -- câu 10 :
 select p.product_id,p.product_name,count(od.product_id) as total_ordered
 from products p
 inner join orderdetails od on od.product_id = p.product_id
 group by p.product_id,p.product_name
 order by total_ordered desc
 limit 1;