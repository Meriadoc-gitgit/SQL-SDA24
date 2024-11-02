# 8 #################################################
select * from sda.student;
select * from sda.subject;


-- SQL code that shows courses’, subject names, and the number of students taking the course only if the course has three or more students on the course.
select sub.*, count(stu.subject_id) as nb_stu_enrolled
from sda.student stu
	join sda.subject sub
		on stu.subject_id = sub.subject_id
group by stu.subject_id
order by stu.subject_id asc;


# 9 #################################################
select * from sda.orders;
select * from sda.order_items;

-- Retrieve the order_id , customer_id, and total from the orders table where the **total** is greater than 400
select o.order_id, o.customer_id, sum((i.price * i.quantity)) as total_from_orders_table
from sda.orders o
	join sda.order_items i 
		on o.order_id = i.order_id
where o.total > 400
group by o.order_id;

-- Retrieve the customer_id and the **total amount spent** by each customer from the orders table, ordered by the **total amount spent** in descending order
select o.customer_id, sum((i.price * i.quantity)) as total_from_orders_table
from sda.orders o
	join sda.order_items i 
		on o.order_id = i.order_id
group by o.order_id
order by total_from_orders_table desc;



# 10 #################################################
select * from sda.order_items_v2;

-- Write a query that shows the total quantity sold for each product.
select o.product_id, sum(o.quantity) as total_quantity_sold
from sda.order_items_v2 o
group by o.product_id;



# 11 #################################################
select * from sda.customer_orders;

select distinct customer_id, customer_name, customer_addr, customer_city, customer_country
from sda.customer_orders;

select distinct order_id, customer_id, order_date, order_total
from sda.customer_orders
where order_id is not null;

select distinct order_details_id, order_id, product, quantity, price
from sda.customer_orders
where order_id is not null;



select * from sda.customers;
select * from sda.orders_v2;
select * from sda.orderdetails;