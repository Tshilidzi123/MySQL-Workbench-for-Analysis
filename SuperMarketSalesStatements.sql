SELECT * FROM evolve.supermarket_sales;
--  Sales Performance Analysis
-- 1.Total Sales per Branch & City:
SELECT 
city,
SUM(total) AS Total_sales
FROM evolve.supermarket_sales
GROUP BY city;
-- 2.Average Sales per Transaction:What is the average sale amount per transaction across different cities
SELECT
city,
AVG(total) AS AVG_Sales
FROM evolve.supermarket_sales
GROUP BY city;

-- Customer Analysis
-- 1.Sales by Customer Type:
SELECT
customer_type,
SUM(total) AS total_sales
FROM evolve.supermarket_sales
GROUP BY customer_type;

-- 2.Gender Distribution of Customers and Their Spending:
SELECT
gender,
SUM(total) AS total_sales
FROM evolve.supermarket_sales
GROUP BY gender
ORDER BY total_sales desc;
-- 3. Top Products Purchased by Customer Type:
SELECT 
customer_type,
category,
SUM(quantity) AS Total_quantity
FROM evolve.supermarket_sales
GROUP BY customer_type,category
ORDER BY Total_quantity desc;

-- Product Line Performance

-- 1.Total Sales by category:
SELECT 
category,
SUM(total) AS Total_sales
FROM evolve.supermarket_sales
GROUP BY category
ORDER BY Total_sales desc;

-- 2.Gross Margin by category:
SELECT 
category,
AVG(gross_margin_percentage) AS AVG_GMP
FROM evolve.supermarket_sales
GROUP BY category
;

-- Time-Based Analysis
-- 1.Sales Trends Over Time
SELECT 
DATE(date_time) AS date,
SUM(total) AS total_sales
FROM evolve.supermarket_sales
GROUP BY DATE(date_time)
;
-- 2.Peak Sales Hours
SELECT 
HOUR(date_time) AS Hour,
SUM(total) AS total_sales
FROM evolve.supermarket_sales
GROUP BY HOUR(date_time)
ORDER BY SUM(total) DESC
;


 
