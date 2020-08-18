-- Question 1
SELECT
	district_id,
    COUNT(client_id) AS no_of_clients
FROM bank.client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id
LIMIT 1000;

-- Question 2
SELECT
	type,
    COUNT(*)
FROM bank.card
GROUP BY type
ORDER BY COUNT(*) DESC
LIMIT 1000;

-- Question 3
SELECT
	account_id,
    amount
FROM bank.loan
ORDER BY amount DESC
LIMIT 10;

-- Question 4
SELECT
	date,
	COUNT(*) AS number_of_loans
FROM bank.loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC
LIMIT 1000;

-- Question 5
SELECT
	date,
    duration,
    COUNT(*) AS number_of_loans
FROM bank.loan
WHERE date >= 971201 AND date <= 971231
GROUP BY date, duration
ORDER BY date, duration
LIMIT 1000;

-- Question 6
SELECT
	account_id,
    type,
    SUM(amount) AS total_amount
FROM bank.trans
WHERE account_id = 396
GROUP BY type
ORDER BY type
LIMIT 1000;

-- Question 7
SELECT
	account_id,
    CASE
		WHEN type = 'PRIJEM' THEN 'INCOMING'
        WHEN type = 'VYDAJ' THEN 'OUTGOING'
	END AS type_english,
    CAST(SUM(amount) as UNSIGNED) AS total_amount
FROM bank.trans
WHERE account_id = 396
GROUP BY type
ORDER BY type
LIMIT 1000;

-- Question 8
SELECT
	account_id,
    FLOOR(SUM(IF(type='PRIJEM', amount, 0))) AS incoming,
    FLOOR(SUM(IF(type='VYDAJ', amount, 0))) AS outgoing,
    (FLOOR(SUM(IF(type='PRIJEM', amount, 0)))) - (FLOOR(SUM(IF(type='VYDAJ', amount, 0)))) as difference
FROM bank.trans
WHERE account_id = 396
GROUP BY account_id
LIMIT 1000;

-- Question 9
SELECT
	account_id,
    (FLOOR(SUM(IF(type='PRIJEM', amount, 0)))) - (FLOOR(SUM(IF(type='VYDAJ', amount, 0)))) as difference
FROM bank.trans
GROUP BY account_id
ORDER BY 2 DESC
LIMIT 10;