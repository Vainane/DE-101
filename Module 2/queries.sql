/*Total Sales per year.
  Total Profit per year.
  Total Ratio per year.
  Average Discount per year.*/
  SELECT 
         EXTRACT(YEAR FROM o.order_date) AS year,
	     ROUND(SUM(o.sales), 2) AS total_sales,
	     ROUND(SUM(o.profit), 2) AS total_profit,
    	 ROUND(SUM(o.profit) / SUM(o.sales) * 100) AS profit_ratio_percentage,  -- Profit ratio = (net profit / net sales) x 100
	     ROUND(AVG(o.discount) * 100) AS average_discount_percentage
    FROM 
         superstore.orders AS o 
GROUP BY
         year
ORDER BY 
         year;

-- Profit per Order.
  SELECT
         o.order_id AS number_order, 
		 ROUND(SUM(o.profit), 2) AS profit_per_order  
    FROM 
         superstore.orders AS o
GROUP BY
         o.order_id
ORDER BY 
         o.order_id;
         
-- Sales per Customer.
  SELECT 
         o.customer_name, 
		 ROUND(SUM(o.sales), 2) AS total_sales
    FROM 
         superstore.orders AS o
GROUP BY 
         o.customer_name
ORDER BY
         o.customer_name;
         
-- Monthly Sales by Segment.
  SELECT
         date_trunc('month', o.order_date) AS month,
		 ROUND(SUM(o.sales), 2) AS sales_in_segment,
         o.segment
    FROM 
         superstore.orders AS o 
GROUP BY 
         month,
         segment
ORDER BY 
         month,
         segment;

-- Monthly Sales by product category.
  SELECT 
         date_trunc('month', o.order_date) AS month,
	   	 o.category AS product_category,
		 ROUND(SUM(o.sales), 2) AS total_sales
    FROM  
         superstore.orders AS o 
GROUP BY  
         month, o.category
ORDER BY 
         month, o.category;

-- Sales by Product Category over time.
  SELECT
         ROUND(SUM(sales), 2) AS total_sales,
         o.category 
    FROM 
         superstore.orders AS o 
GROUP BY
         category;
         
-- Sales and Profit by Customer.
  SELECT 
         o.customer_name, 
		 ROUND(SUM(o.sales), 2) AS sales_per_customer,  
		 round(SUM(o.profit), 2) AS profit_per_customer  
    FROM  
         superstore.orders AS o
GROUP BY
         o.customer_name
ORDER BY 
         o.customer_name;

-- Customer ranking.
  SELECT 
         o.customer_name, 
		 ROUND(SUM(o.profit), 2) AS profit_per_customer
    FROM 
         superstore.orders AS o
GROUP BY 
         o.customer_name
ORDER BY 
         profit_per_customer DESC;
         
-- Sales per Region.
  SELECT 
         o.region, 
		 ROUND(SUM(o.sales), 2) AS total_sales
    FROM 
         superstore.orders AS o
GROUP BY 
         o.region
ORDER BY
         o.region;
