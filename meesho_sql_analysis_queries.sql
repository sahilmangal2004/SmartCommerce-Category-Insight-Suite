
-- 1. Top Selling Products by Revenue
SELECT product_id, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 2. Product Performance by Category
SELECT category, COUNT(DISTINCT product_id) AS num_products, AVG(rating) AS avg_rating
FROM products
GROUP BY category;

-- 3. Price Change Impact Analysis (Hypothetical structure)
SELECT product_id, AVG(CASE WHEN order_date < '2024-01-01' THEN quantity ELSE NULL END) AS avg_qty_before,
                   AVG(CASE WHEN order_date >= '2024-01-01' THEN quantity ELSE NULL END) AS avg_qty_after
FROM orders
GROUP BY product_id;

-- 4. New Users per Month
SELECT MONTH(signup_date) AS month, COUNT(user_id) AS new_users
FROM users
GROUP BY month;

-- 5. User Retention After 7 Days
SELECT COUNT(DISTINCT user_id)
FROM user_activity
WHERE activity_date = DATE_ADD(signup_date, INTERVAL 7 DAY);

-- 6. User Funnel Drop-Off Analysis (Simplified)
SELECT 
    COUNT(DISTINCT install_id) AS installs,
    COUNT(DISTINCT signup_id) AS signups,
    COUNT(DISTINCT cart_id) AS cart_adds,
    COUNT(DISTINCT purchase_id) AS purchases
FROM funnel_data;

-- 7. Delayed Deliveries by Region
SELECT region, COUNT(order_id) AS delayed_orders
FROM orders
WHERE delivery_date > expected_delivery_date
GROUP BY region;

-- 8. Average Delivery Time by Logistics Partner
SELECT logistics_partner, AVG(DATEDIFF(delivery_date, order_date)) AS avg_delivery_time
FROM orders
GROUP BY logistics_partner;

-- 9. Revenue per Category
SELECT category, SUM(price * quantity) AS category_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY category;

-- 10. Customer Lifetime Value (CLTV)
SELECT user_id, SUM(price * quantity) AS total_spent
FROM orders
GROUP BY user_id
ORDER BY total_spent DESC;
