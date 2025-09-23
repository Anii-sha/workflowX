/*
Problem Statement:

You are given a table customer_orders containing order details: order_id, customer_id, order_date, and order_amount. Each row represents an order placed by a customer on a specific date.

Write a SQL query to generate a daily summary that shows, for each order date:

The number of new customers (customers placing their first-ever order on that date)
The number of repeated customers (customers who have placed orders before and are ordering again on that date)
The output should display the order date, the count of new customers, and the count of repeated customers for each date.

*/

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000);


with first_visit AS (
select customer_id, min(order_date) as first_visit_date
from customer_orders
group by customer_id
)
select 
a.order_date,
sum(case when a.order_date = b.first_visit_date then 1 else 0 end )as new_customer,
sum(case when a.order_date <> b.first_visit_date then 1 else 0 end )as repeated_customer

from customer_orders  a 
inner join first_visit b
on a.customer_id = b.customer_id
group by a.order_date
;