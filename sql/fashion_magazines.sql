-- Add your sql here

/* Write a SQL query that returns the customer name and 
total amount due for the customers that have 
unpaid Fashion Magazine subscriptions. 

Note that the column names in the resulting file 
need to match the column names in the example below.
*/


SELECT c.customer_name AS 'Customer', SUM(s.price_per_month * s.subscription_length) AS 'Amount Due'
FROM customers c
JOIN orders ON c.customer_id = o.customer_id
JOIN subscriptions ON o.subscription_id = s.subscription_id
WHERE o.order_status = 'unpaid' AND s.description = 'Fashion Magazine'
GROUP BY c.customer_name;