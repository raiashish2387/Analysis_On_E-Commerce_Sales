1. Retrieve the customer names and their corresponding orders.

select c.customer_name,p.product_name,o.quantity,p.price,(o.quantity*p.price) as total_price
from customers as c
join orders as o on o.customer_id=c.customer_id
join products as p on p.product_id=o.product_id
group by 1,2,3,4,5;

2. Find the total quantity and revenue generated from each product category.

select p.product_name,sum(o.quantity*p.price) as total_price
from orders as o join products as p on o.product_id = p.product_id
group by 1;

3. Retrieve the top-selling products in each category.

SELECT p.category, p.product_name, SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category, p.product_name
HAVING SUM(o.quantity) = (
  SELECT MAX(total_quantity)
  FROM (
    SELECT category, SUM(quantity) AS total_quantity
    FROM products p
    JOIN orders o ON p.product_id = o.product_id
    GROUP BY category
  ) AS subquery
  WHERE subquery.category = p.category
);


4. Retrieve the average order value for each customer.

select sq.customer_name,sum(sq.order_value) as order_value 
from (SELECT c.customer_name, (o.quantity * p.price) as order_value 
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
JOIN products as p ON o.product_id = p.product_id
) as sq
group by 1;


5. Retrieve the customers who have made more than the average order quantity.
select sub.customer_name 
from
(select c.customer_name, sum(o.quantity) as total_quantity
from customers as c
join orders as o on c.customer_id = o.customer_id
group by 1) as sub
cross join
(select avg(total_quantity) as total_avg 
from 
(select c.customer_name, sum(o.quantity) as total_quantity
from customers as c
join orders as o on c.customer_id = o.customer_id
group by c.customer_name) as sq) as sqb
where sub.total_quantity> sqb.total_avg;


