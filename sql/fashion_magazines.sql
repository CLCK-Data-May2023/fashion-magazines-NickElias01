/* Start with the orders table and work out from there. */
/*Multiply the subscription price with the subscription length to get the total amount due*/
/*Group By Cuustomer and sum the amount due 
to account for customers that have more than one unpaid Fashion Magazine subscriptions*/
SELECT c.customer_name AS 'Customer', PRINTF(SUM(s.price_per_month * s.subscription_length)) AS 'Amount Due'
FROM orders AS o

/*Filter the orders table on the orders.order_status column,
filter the orders on the subscriptions.description column*/
WHERE o.order_status = 'unpaid' AND s.subscription = 'Fashion Magazine'

/*Join the customers table to the orders table to get the customer's name*/
JOIN customers AS c ON c.customer_id = o.customer_id

/*Join the subscriptions table to the orders table as to get the number of months and subscription length*/
JOIN subscriptions AS s ON s.subscription_ID = o.subscription_ID

GROUP BY c.customer_name