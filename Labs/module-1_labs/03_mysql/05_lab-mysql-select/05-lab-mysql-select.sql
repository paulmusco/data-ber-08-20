USE publications;
-- Challenge 1
SELECT
	a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM
	authors a
	INNER JOIN titleauthor ta
	ON a.au_id = ta.au_id
		INNER JOIN titles t
		ON ta.title_id = t.title_id
			INNER JOIN publishers p
			ON t.pub_id = p.pub_id
ORDER BY a.au_id;

-- Challenge 2
SELECT
	a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    p.pub_name AS 'PUBLISHER',
    COUNT(*) AS 'TITLE COUNT'
FROM
	authors a
	INNER JOIN titleauthor ta
	ON a.au_id = ta.au_id
		INNER JOIN titles t
		ON ta.title_id = t.title_id
			INNER JOIN publishers p
			ON t.pub_id = p.pub_id
GROUP BY a.au_id, p.pub_name
ORDER BY a.au_id DESC
LIMIT 1000;

-- Challenge 3
SELECT
	a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    t.ytd_sales AS 'SALES'
FROM
	authors a
	INNER JOIN titleauthor ta
	ON a.au_id = ta.au_id
		INNER JOIN titles t
		ON ta.title_id = t.title_id		
GROUP BY a.au_id
ORDER BY t.ytd_sales DESC
LIMIT 3;

-- Challenge 4
SELECT
	a.au_id AS 'AUTHOR ID',
    a.au_lname AS 'LAST NAME',
    a.au_fname AS 'FIRST NAME',
    COALESCE (t.ytd_sales, 0) AS 'SALES'
FROM
	authors a
	INNER JOIN titleauthor ta
	ON a.au_id = ta.au_id
		INNER JOIN titles t
		ON ta.title_id = t.title_id		
GROUP BY a.au_id
ORDER BY t.ytd_sales DESC;