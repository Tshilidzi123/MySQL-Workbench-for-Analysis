-- Shows/pulls the whole table with all it's contents
SELECT * FROM evolve.pizza_sales1;

-- total_revenue.
SELECT SUM(total_price) AS total_revenue
FROM evolve.pizza_sales1;

-- average_oder_value.
SELECT SUM(total_price)/ COUNT(DISTINCT order_id) As average_oder_value
FROM evolve.pizza_sales1;

-- total_pizzas sold.
SELECT SUM(quantity) As total_pizzas_sold
FROM evolve.pizza_sales1;

-- total orders.
SELECT COUNT(DISTINCT order_id) AS total_Orders
FROM evolve.pizza_sales1;

-- average_pizzas_per_order
SELECT  SUM(quantity) / COUNT(DISTINCT order_id) As average_pizzas_per_order
FROM evolve.pizza_sales1;

-- For visualizing
-- 1.daily trend for total orders

SELECT 
    DAYNAME(`order_date_&_time`) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    evolve.pizza_sales1
WHERE 
    `order_date_&_time` IS NOT NULL
GROUP BY 
    DAYNAME(`order_date_&_time`);
    
-- 2. Hourly trend for total orders
SELECT 
    HOUR(`order_date_&_time`) AS order_hour,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    evolve.pizza_sales1
WHERE 
    `order_date_&_time` IS NOT NULL
GROUP BY 
    HOUR(`order_date_&_time`);
    
-- 3.percentage of sales by pizza category

SELECT pizza_category,
SUM(total_price)*100/ (SELECT SUM(total_price) from pizza_sales1 )AS PCT_of_sales
FROM pizza_sales1
GROUP BY
pizza_category;
