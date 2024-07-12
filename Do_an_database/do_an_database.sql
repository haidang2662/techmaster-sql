create table role (
id int primary key ,
role_name varchar(25)
) ;

insert into role (id , role_name)
values
(0 , 'Key admin'),
(1 , 'Admin'),
(2 , 'Reader') ;

create table user (
id int primary key ,
role_id int ,
password varchar(25) ,
email varchar(25) ,
fullname varchar(25), 
phone int ,
address varchar(25) ,
balance double ,
foreign key (role_id) references role(id)
) ;

insert into user (id , role_id , password , email , fullname , phone , address , balance )
values 
(1 , 0 , 'a123456' , 'a@gmail.com' , 'Nguyễn Văn A' , '0123456789' , ' Hà Nội ' , null),
(2 , 1 , 'b123456' , 'b@gmail.com' , 'Nguyễn Văn B' , '0123456788' , ' HCM ' , null),
(3 , 1 , 'c123456' , 'c@gmail.com' , 'Nguyễn Văn C' , '0123456787' , ' Hải Phòng ' , null),
(4 , 2 , 'd123456' , 'd@gmail.com' , 'Nguyễn Văn D' , '0123456786' , ' Hà Nội ' , 1000000) ,
(5 , 2 , 'e123456' , 'e@gmail.com' , 'Nguyễn Văn E' , '0123456785' , ' Hà Nội ' , 900000) ,
(6 , 2 , 'f123456' , 'f@gmail.com' , 'Nguyễn Văn F' , '0123456784' , ' HCM ' , 800000);

create table transaction_type (
id int primary key ,
name varchar(25)
) ;

insert into transaction_type (id , name)
values
(1 , 'borrow'),
(2 , 'return'),
(3 , 'deposit') ,
(4 , 'punish') ;


create table transaction (
id int primary key ,
user_id int ,
transaction_type_id int ,
amount double ,
create_date Date ,
transaction_content text ,
foreign key (user_id) references user(id) ,
foreign key (transaction_type_id) references transaction_type(id)
);

insert into transaction (id , user_id , transaction_type_id , amount , create_date , transaction_content )
values
(1 , 4 , 3 , 100000 , '2024-7-1' , 'Nạp tiền vào tài khoản'),
(2 , 4 , 1 , 50000 , '2024-7-1' , 'Thuê sách '),
(3 , 4 , 2 , null , '2024-7-10' , 'Trả sách'),
(4 , 5 , 1 , 30000 , '2024-7-10' , 'thuê sách '),
(5 , 5 , 2 , null , '2024-7-15' , 'trả sách '),
(6 , 5 , 4 , 50000 , '2024-7-15' , 'phạt do làm rách sách '),
(7 , 6 , 1 , 20000 , '2024-7-16' , 'thuê sách ');


create table borrow_bill (
id int primary key ,
user_id int ,
created_date date ,
expected_return_date date ,
actual_return_date date ,
total_deposit_amount double ,
total_expected_borrow_fee double ,
total_actual_borrow_fee double ,
total_punish_amount double ,
foreign key (user_id) references user(id)
) ;

insert into borrow_bill (id , user_id , created_date , expected_return_date , actual_return_date , total_deposit_amount , total_expected_borrow_fee , total_actual_borrow_fee  , total_punish_amount )
values 
(1 , 4 ,  '2024-7-1' ,  '2024-7-10' , null ,  100000 , 50000 , null , null) ,
(2 , 4 ,  '2024-7-1' ,  '2024-7-10' , '2024-7-10' ,  100000 , 50000 , 50000 , null) ,
(3 , 5 ,  '2024-7-10' ,  '2024-7-15' , null ,  60000 , 30000 , null , null) ,
(4 , 5 ,  '2024-7-10' ,  '2024-7-15' , '2024-7-15' ,  60000 , 30000 , 30000 , null) ,
(5 , 5 ,  '2024-7-10' ,  '2024-7-15' , '2024-7-15' ,  60000 , 30000 , 30000 , 50000) ,
(6 , 6 , '2024-7-16' , '2024-7-20' , null  , 40000 , 20000 , null , null ) ;

create table publisher (
id int primary key ,
name text 
) ;

insert into publisher (id , name )
values 
(1 , 'Kim Đồng'),
(2 , 'Thanh Thanh'),
(3 , 'Văn Lang'),
(4 , 'Đại Việt'),
(5 , 'Thăng Long');

create table category (
id int primary key ,
name text 
) ;

insert into category ( id , name )
values
(1 , 'Thiếu nhi'),
(2 , 'Trinh thám'),
(3 , 'Sách giáo khoa') ,
(4 , 'Tiểu thuyết') ,
(5 , 'Anh văn ') ;

create table author (
id int primary key ,
name text 
) ;

insert into author ( id , name )
values
(1 , 'Tô Hoài') ,
(2 , 'Tố Hữu') ,
(3 , 'Tế Hanh') ,
(4 , 'Hồ Xuân Hương' ) ,
(5 , 'Huy Cận ' ) ;

create table book (
id int primary key ,
publisher_id int ,
name text ,
publish_year date ,
price double ,
borrow_price_per_day double ,
total_quantity int ,
vote_star double ,
vote_count int ,
foreign key (publisher_id) references publisher(id)
) ;

insert into book (id , publisher_id , name , publish_year , price , borrow_price_per_day , total_quantity , vote_star , vote_count )
values 
(1 , 2 , 'Bánh trôi nước' , '1931-01-01' , 10000 , 5000 , 10 , 5 , 5) ,
(2 , 2 , 'Đoàn tàu đánh cá' , '1929-01-01' , 10000 , 5000 , 10 , 5 , 5) ,
(3 , 3 , 'Thương vợ' , '1928-01-01' , 10000 , 5000 , 10 , 5 , 5) ,
(4 , 4 , 'chú bé liên lạc' , '1927-01-01' , 10000 , 5000 , 10 , 5 , 5) ,
(5 , 5 , 'Dế mèn phiêu lưu ký' , '1926-01-01 ', 10000 , 5000 , 10 , 5 , 5) ;

create table book_category (
book_id int ,
category_id int ,
foreign key (book_id) references book(id) ,
foreign key (category_id) references category(id)
) ;

insert into book_category ( book_id , category_id )
values 
(1 , 4) ,
(2 , 4) ,
(3 , 4 ) ,
(4 , 4 ) ,
(5 , 5 ) ;


create table author_book (
author_id int ,
book_id int ,
foreign key (book_id) references book(id) ,
foreign key (author_id) references author(id)
) ;

insert into author_book (author_id , book_id )
values 
(4 , 1 ),
(5 , 2 ),
(3 , 3 ),
(2 , 4 ),
(1 , 5 ) ;

create table borrow_bill_detail (
book_id int ,
borrow_bill_id int ,
borrow_quantity int ,
return_quantity int ,
original_status text ,
return_status text ,
deposit_amunt double ,
expected_borrow_fee double ,
actual_borrow_fee double ,
punish_amount double ,
foreign key (book_id) references book(id) ,
foreign key (borrow_bill_id) references borrow_bill(id)
) ;

insert into borrow_bill_detail ( book_id , borrow_bill_id , borrow_quantity , return_quantity , original_status , return_status , deposit_amunt , expected_borrow_fee , actual_borrow_fee , punish_amount )
values 

( 1 , 1 , 1 , 0 , 'nguyên vẹn' , null , 100000 , 50000 , null , null ),
( 1 , 1 , 1 , 1 , 'nguyên vẹn' , 'nguyên vẹn' , 100000 , 50000 , 50000 , null ),
( 1 , 1 , 1 , 1 , 'nguyên vẹn' , 'bị rách ' , 100000 , 50000 , 50000 , 50000 ),
( 2 , 1 , 1 , 1 , 'nguyên vẹn' , 'null' , 100000 , 50000 , null , null );

create table vote_history (
id int primary key ,
book_id int ,
user_id int ,
rated_content text ,
creat_date date ,
vote_star double ,
foreign key (book_id) references book(id) ,
foreign key (user_id) references user(id)
) ;

insert into vote_history (id , book_id , user_id , rated_content , creat_date , vote_star )
values 
(1 , 1 , 1 , 'Rất hay ' , '2024-07-01', 5),
(2 , 2 , 1 , 'Rất hay ' , '2024-07-01', 5),
(3 , 1 , 1 , 'Rất hay ' , '2024-07-01', 5),
(4 , 1 , 1 , 'Rất hay ' , '2024-07-01', 4),
(5 , 1 , 1 , 'Rất hay ' , '2024-07-01', 5);

select u.fullname , bb.user_id , count(bb.id) as so_luong_phieu_thue_sach
from user u
inner join borrow_bill bb on bb.user_id = u.id
group by user_id 
having count(bb.id) > 1;
