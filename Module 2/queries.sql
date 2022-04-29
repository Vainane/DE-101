-- 1.Total sales AND total profit.
SELECT 
	Order_Date,
	ROUND(SUM(o.sales), 2) AS total_sales,
	ROUND(SUM(o.profit), 2) AS total_profit
FROM 
	orders AS o 
GROUP BY 
	Order_Date
ORDER BY 
	Order_Date;

-- Profit per Order
SELECT
	Order_ID,
	round(sum(sales), 2) AS sales,
	round(sum(profit), 2) AS profit
FROM
	orders
GROUP BY
	Order_ID;

-- 2. Sales by Product Category over time
SELECT
	category,
	ROUND(SUM(sales),2) AS sales,
	ROUND(SUM(profit),2) AS profit
FROM
	orders
GROUP BY
	category;

-- 3.Sales and Profit by Customer
SELECT 
	customer_name,
	ROUND(SUM(sales), 2) AS total_sales,
	ROUND(SUM(profit), 2) AS total_profit
FROM
	orders
GROUP BY
 	customer_name;

-- Sales per region
SELECT 
	region,
	ROUND(SUM(sales), 2) AS total_sales
FROM 
	orders 
GROUP BY 
	region
ORDER BY 
	region;

