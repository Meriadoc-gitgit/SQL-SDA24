drop schema if exists sda;

create schema sda;
use sda;


##################################################

create table subject
(
	subject_id int,
    subject_name varchar(100),
    max_score int,
    lecturer varchar(100),
    
    constraint sub_id_pk primary key(subject_id),
    constraint key_sub_name unique(subject_name)
);

##################################################

create table student 
(
	student_id int,
    student_name varchar(100),
    city varchar(100),
    subject_id int,
    
    constraint stu_id_pk primary key(student_id),
    constraint sub_stu_fk foreign key(subject_id)
		references subject on delete cascade
);


##################################################

create table orders
(
	order_id int,
    customer_id int,
    order_date datetime,
    total int,
    
    constraint order_pk primary key(order_id),
    constraint order_uniq unique(order_id, customer_id)
);


##################################################

create table order_items
(
	order_id int,
    product_id int,
    quantity int,
    price int,
	
    constraint ord_it_pk primary key(product_id),
    constraint ord_it_fk foreign key(order_id)
		references orders on delete cascade
);


##################################################
create table order_items_v2
(
	order_id int, 
    order_date datetime,
    customer_id int,
    product_id int,
    quantity int,
    
    constraint order_pk primary key(order_id)
);











##################################################
# customer_orders
##################################################
create table customer_orders
(
	customer_id int,
    customer_name varchar(100),
    customer_addr varchar(100),
    customer_city varchar(100),
    customer_country varchar(100),
    
    order_id int,
    order_date datetime,
    order_total int,
    
    order_details_id int,
    product varchar(100),
    quantity int,
    price float
);

create table Customers 
(
	id int, 
    name varchar(100),
    address varchar(100),
    city varchar(100),
    country varchar(100),
    
    constraint customer_pk primary key(id)
);

create table Orders_v2
(
	id int,
    customer_id int,
    order_date datetime,
    total int,
	
    constraint orders_pk primary key(id),
    constraint orders_cus_fk foreign key(customer_id)
		references Customers on delete cascade
);

create table OrderDetails 
(
	id int,
    order_id int,
    product varchar(100),
    quantity int,
    price float,
    
    constraint order_details_pk primary key(id),
    constraint orders_fk foreign key(order_id)
		references Orders_v2 on delete cascade
);