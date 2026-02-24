--Create the Marketing Table 
CREATE TABLE marketing_campaigns (
    customer_id SERIAL PRIMARY KEY, 
	customer_name VARCHAR(100),
	total_spend DECIMAL(10,2),
	last_purchase_date DATE,
	acquisition_channel VARCHAR(50),
-- Social Media, Email,Search
     loyalty_points INT
);	 


INSERT INTO marketing_campaigns
   (customer_name, total_spend, last_purchase_date, acquisition_channel, loyalty_points)
VALUES
('Tech Crop', '5400.00', '2026-02-15', 'Search', 500),
('Green Solutions', '1200.50', '2025-11-20', 'Social Media', 120),
('Retail Hub', '450.00', '2025-08-10', 'Social Media', 40),
('Logistics Pro', '3100.00', '2026-01-05', 'Search', 300);


1.IDENTIFY : High_Value
Goal : Tell the marketing team_to send_exclusive_offers_to 

SELECT customer_name, total_spend, loyalty_points 
FROM marketing_campaigns
WHERE total_spend > 3000 AND 
loyalty_points > 200 
ORDER BY total_spend DESC;

2.Detect "Chrunk Risk" 
Goal: Identify customers who have_not bought anything in_over 6_months. 

SELECT customer_name,
last_purchase_date,
acquisition_channel 
FROM marketing_campaigns
WHERE last_purchase_date < 
CURRENT_DATE - INTERVAL '6 MONTHS';

3. Campaign Performance 
Goal: See which channel brings in_the most revenue. 

SELECT acquisition_channel,
       COUNT (customer_id) AS 
total_customers,
       SUM(total_spend) AS
total_revenue,
       AVG(total_spend) AS 
avg_customer_value
FROM marketing_campaigns
GROUP BY acquisition_channel
ORDER BY total_revenue DESC;