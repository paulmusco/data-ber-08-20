-- Question 1
SELECT MIN(DATE(first_contact_date)), MAX(DATE(first_contact_date))
FROM olist.marketing_qualified_leads;

-- Question 2
SELECT
	origin,
    COUNT(*) AS frequency
FROM olist.marketing_qualified_leads
WHERE DATE(first_contact_date) >= DATE('2018-01-01') AND DATE(first_contact_date) < DATE('2019-01-01')
GROUP BY origin
ORDER BY frequency DESC
LIMIT 3;

-- Question 3
SELECT
	DATE(first_contact_date),
    COUNT(*) AS mql_id_entries
FROM olist.marketing_qualified_leads
GROUP BY DATE(first_contact_date)
ORDER BY mql_id_entries DESC
LIMIT 1;

-- Question 4
SELECT
	product_category_name,
    COUNT(*) AS frequency
FROM olist.products
GROUP BY product_category_name
ORDER BY frequency DESC
LIMIT 2;

-- Question 5
SELECT
	product_category_name,
    product_weight_g
FROM olist.products
ORDER BY product_weight_g DESC
LIMIT 1;

-- Question 6
SELECT
	product_category_name,
        (product_length_cm + product_height_cm + product_width_cm) AS total_dimensions
FROM olist.products
ORDER BY total_dimensions DESC
LIMIT 1;

-- Question 7
SELECT
	payment_type,
    order_id,
    COUNT(*) AS frequency
FROM olist.order_payments
GROUP BY payment_type
ORDER BY frequency DESC
LIMIT 1;

-- Question 8
SELECT
	order_id,
    payment_value
FROM olist.order_payments
ORDER BY payment_value DESC
LIMIT 1;

-- Question 9
SELECT
	seller_state,
    seller_city,
    COUNT(DISTINCT seller_city) AS distinct_cities
FROM olist.sellers
GROUP BY seller_state
ORDER BY distinct_cities DESC
LIMIT 3;