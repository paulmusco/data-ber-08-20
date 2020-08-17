-- Question 1
SELECT client_id
FROM bank.client
WHERE district_id = 1
LIMIT 5;

-- Question 2
SELECT client_id
FROM bank.client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

-- Question 3
SELECT amount
FROM bank.loan
ORDER BY amount
LIMIT 3;

-- Question 4
SELECT status
FROM bank.loan
GROUP BY status
ORDER BY status 
LIMIT 1000;

-- Question 5
SELECT
	loan_id
FROM bank.loan
ORDER BY payments DESC
LIMIT 1;

-- Question 6
SELECT
	account_id,
    amount
FROM bank.loan
ORDER BY account_id
LIMIT 5;

-- Question 7
SELECT
	account_id,
    amount
FROM bank.loan
WHERE duration = 60
ORDER BY amount
LIMIT 5;

-- Question 8
SELECT k_symbol
FROM bank.order
GROUP BY k_symbol
LIMIT 1000;

-- Question 9
SELECT
	order_id
FROM bank.order
WHERE account_id = 34
LIMIT 1000;

-- Question 10
SELECT
	account_id
FROM bank.order
WHERE order_id >= 29540 AND order_id <= 29560
GROUP BY account_id
LIMIT 1000;

-- Question 11
SELECT
    amount
FROM bank.order
WHERE account_to = 30067122
LIMIT 1000;

-- Question 12
SELECT
	trans_id,
    date,
    type,
    amount
FROM bank.trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;