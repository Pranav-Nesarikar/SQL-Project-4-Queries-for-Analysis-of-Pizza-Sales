UPDATE pizza_sales set order_date = str_to_date(order_date , '%d-%m-%Y') ;
select * from pizza_sales;
desc pizza_sales; 

create table pizza_sales (
pizza_id int, 
order_id int ,
pizza_name_id text, 
quantity int ,
order_date date, 
order_time time ,
unit_price double, 
total_price double, 
pizza_size text,
pizza_category text ,
pizza_ingredients text, 
pizza_name text ,
order_date2 text
);
insert into pizza_sales select * from pizza_db.pizza_sales; 
desc pizza_sales;
alter table pizza_sales modify order_time time;


select monthname(order_date) as month_name , count(distinct order_id) as total_orders from pizza_sales 
group by month_name
order by month_name ;

select pizza_category , round(sum (total_price), 2) as revenue ,
round(sum(total_price) / (select sum(total_price) from pizza_sales) * 100,2) 
from pizza_sales 
group by pizza_category;

select sum(total_price) from pizza_sales;

select pizza_size , cast(sum(total_price) as decimal(10,2)) , 
ROUND(sum(total_price) / (select sum(total_price) from pizza_sales)  * 100,2) 
from pizza_sales
group by pizza_size;

SELECT pizza_category , sum(quantity) FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_name , count(distinct order_id) as qnty  from pizza_sales
group by pizza_name
order by qnty desc limit 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC limit 5;


