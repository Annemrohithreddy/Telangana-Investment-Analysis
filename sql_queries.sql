SELECT d.district, 
ROUND(SUM(t."investment in cr"),2) AS total_investment
FROM fact_TS_iPASS t
JOIN dim_districts d ON t.dist_code = d.dist_code
GROUP BY d.district
ORDER BY total_investment DESC
LIMIT 10;


SELECT sector,
ROUND(SUM("number_of_employees"),0) AS total_jobs,
ROUND(SUM("investment in cr"),2) AS total_investment,
ROUND(SUM("number_of_employees")/SUM("investment in cr"),2) AS jobs_per_crore
FROM fact_TS_iPASS
GROUP BY sector
ORDER BY jobs_per_crore DESC
LIMIT 10;

SELECT SUBSTR(month,7,4) AS year,
ROUND(SUM("investment in cr"),2) AS total_investment
FROM fact_TS_iPASS
GROUP BY year
ORDER BY year;

SELECT sector,
ROUND(SUM("investment in cr"),2) AS investment,
ROUND(SUM("investment in cr")*100.0/
(SELECT SUM("investment in cr") FROM fact_TS_iPASS),2) AS pct
FROM fact_TS_iPASS
GROUP BY sector
ORDER BY investment DESC;

SELECT d.district,
ROUND(SUM(t."investment in cr"),2) AS total_investment,
ROUND(SUM(t."number_of_employees"),0) AS total_jobs
FROM fact_TS_iPASS t
JOIN dim_districts d ON t.dist_code = d.dist_code
GROUP BY d.district
ORDER BY total_investment ASC
LIMIT 5;

