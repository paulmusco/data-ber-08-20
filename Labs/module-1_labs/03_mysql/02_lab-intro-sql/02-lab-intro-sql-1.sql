-- Question 1
SELECT MAX(price), MIN(price)
FROM olist.order_items;

-- Question 2
SELECT MIN(shipping_limit_date), MAX(shipping_limit_date)
FROM olist.order_items;

-- Question 3
SELECT customer_state, COUNT(*) AS orders_per_state
FROM olist.customers
GROUP BY customer_state
ORDER BY orders_per_state DESC
LIMIT 3;

-- Question 4
SELECT customer_city, COUNT(*) AS orders_per_city
FROM olist.customers
WHERE customer_state = 'SP'
GROUP BY customer_city
ORDER BY orders_per_city DESC
LIMIT 3;

-- Question 5
SELECT COUNT(DISTINCT(business_segment))
FROM olist.closed_deals;

-- Question 6
SELECT business_segment, SUM(declared_monthly_revenue) AS segment_monthly_revenue
FROM olist.closed_deals
GROUP BY business_segment
ORDER BY segment_monthly_revenue DESC
LIMIT 3;

-- Question 7
SELECT COUNT(DISTINCT(review_score))
FROM olist.order_reviews
LIMIT 1000;

-- Question 8
SELECT
	review_score,
    CASE
		WHEN review_score = 1 THEN 'terrible'
        WHEN review_score = 2 THEN 'not good'
        WHEN review_score = 3 THEN 'ok'
        WHEN review_score = 4 THEN 'good'
        WHEN review_score = 5 THEN 'excellent'
	END AS review_description
FROM olist.order_reviews;

-- Question 9
SELECT
	review_score,
    COUNT(*) AS frequency
FROM olist.order_reviews
GROUP BY review_score
ORDER BY frequency DESC
LIMIT 1;