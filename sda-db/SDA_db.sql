use sda;

##################################################
delete from subject;

insert into subject
	values (11, 'Math', 130, 'Charlie Sole');
insert into subject 
	values (12, 'Computer Science', 50, 'James Pillet');
insert into subject 
	values (13, 'Biology', 300, 'Carol Denby');
insert into subject 
	values (14, 'Geography', 220, 'Yollanda Balang');
insert into subject 
	values (15, 'Physics', 110, 'Chris Brother');
insert into subject 
	values (16, 'Chemistry', 400, 'Manny Donne');
    
##################################################
    
delete from student;

insert into student 
	values (2001, 'Olga Thorn', 'New York', 11);
insert into student 
	values (2002, 'Sharda Clement', 'San Francisco', 12);
insert into student 
	values (2003, 'Bruce Shelkins', 'New York', 13);
insert into student 
	values (2004, 'Fabian Johnson', 'Boston', 15);
insert into student 
	values (2005, 'Bradley Camer', 'Stanford', 11);
insert into student 
	values (2006, 'Sofia Mueller', 'Boston', 16);
insert into student 
	values (2007, 'Rory Pietman', 'New Haven', 12);
insert into student 
	values (2008, 'Carly Walsh', 'Tulsa', 14);
insert into student 
	values (2011, 'Richard Curtis', 'Boston', 11);
insert into student 
	values (2012, 'Cassiy Ledgers', 'Stanford', 11);
insert into student 
	values (2013, 'Harold Ledgers', 'Miami', 13);
insert into student 
	values (2014, 'Davey Bergman', 'San Francisco', 12);
insert into student 
	values (2015, 'Darcey Button', 'Chicago', 14);
    
    
    
##################################################
    
delete from orders;

insert into orders 
	values (1, 100, '2021-01-01', 200);
insert into orders 
	values (2, 101, '2021-02-02', 300); 
insert into orders 
	values (3, 102, '2021-03-03', 400); 
insert into orders 
	values (4, 103, '2021-04-04', 500);
insert into orders 
	values (5, 104, '2021-05-05', 600);
    

##################################################
    
delete from order_items;

insert into order_items
	values (1, 10, 2, 50);
insert into order_items
	values (1, 11, 3, 25);
insert into order_items
	values (2, 12, 4, 30);
insert into order_items
	values (2, 13, 5, 20); 
insert into order_items
	values (3, 14, 6, 15);
insert into order_items
	values (3, 15, 7, 10);
insert into order_items
	values (4, 16, 8, 5);
insert into order_items
	values (4, 17, 9, 4);
insert into order_items
	values (5, 18, 10, 3); 
insert into order_items
	values (5, 19, 11, 2);
    
    
    
##################################################
    
delete from order_items_v2;

insert into order_items_v2
	values (1, '2022-01-01', 101, 1, 2);
insert into order_items_v2
	values (2, '2022-01-01', 102, 1, 1);
insert into order_items_v2
	values (3, '2022-01-01', 103, 2, 5);
insert into order_items_v2
	values (4, '2022-01-02', 104, 3, 3);
insert into order_items_v2
	values (5, '2022-01-02', 105, 1, 2);
insert into order_items_v2
	values (6, '2022-01-02', 101, 3, 1);
insert into order_items_v2
	values (7, '2022-01-03', 102, 2, 4);
insert into order_items_v2
	values (8, '2022-01-03', 103, 1, 2);
insert into order_items_v2
	values (9, '2022-01-03', 104, 2, 1);
insert into order_items_v2
	values (10, '2022-01-04', 105, 3, 2);
    
    
    
    
##################################################
    
delete from customer_orders;

-- Insert data for each order and order detail as provided in the original data
insert into customer_orders
values 
    (1, 'John Smith', '123 Main St.', 'Anytown', 'USA', 
     1, '2022-01-01', 100, 
     1, 'Widget A', 2, 25),
     
    (1, 'John Smith', '123 Main St.', 'Anytown', 'USA', 
     1, '2022-01-01', 100, 
     2, 'Widget B', 1, 50),
     
    (1, 'John Smith', '123 Main St.', 'Anytown', 'USA', 
     2, '2022-02-01', 150, 
     3, 'Widget C', 1, 75),
     
    (1, 'John Smith', '123 Main St.', 'Anytown', 'USA', 
     2, '2022-02-01', 150, 
     4, 'Widget D', 2, 37.5),
     
    (2, 'Jane Doe', '456 Oak St.', 'Somewhere', 'USA', 
     3, '2022-03-01', 75, 
     5, 'Widget A', 1, 25),
     
    (2, 'Jane Doe', '456 Oak St.', 'Somewhere', 'USA', 
     3, '2022-03-01', 75, 
     6, 'Widget B', 2, 50),
     
    (3, 'Bob Johnson', '789 Pine St.', 'Anytown', 'USA', 
     4, '2022-04-01', 200, 
     7, 'Widget D', 1, 200),
     
    (4, 'Alice Lee', '1010 Elm St.', 'Nowhere', 'USA', 
     5, '2022-05-01', 50, 
     8, 'Widget A', 2, 25),
	
    (5, 'David Kim', '1234 Maple St.', 'Anytown', 'USA', 
     NULL, NULL, NULL, 
     NULL, NULL, NULL, NULL);
     
     
     
-- Insert unique customers into Customers table
INSERT INTO sda.Customers (id, name, address, city, country)
select distinct customer_id, customer_name, customer_addr, customer_city, customer_country
from sda.customer_orders;

-- Insert orders into Orders table
INSERT INTO Orders_v2 (id, customer_id, order_date, total)
select distinct order_id, customer_id, order_date, order_total
from sda.customer_orders
where order_id is not null;

-- Insert order details into OrderDetails table
INSERT INTO OrderDetails (id, order_id, product, quantity, price)
select distinct order_details_id, order_id, product, quantity, price
from sda.customer_orders
where order_id is not null;

