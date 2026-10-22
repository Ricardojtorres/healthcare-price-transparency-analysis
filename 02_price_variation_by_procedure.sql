-- Which procedures show the largest price variation across payers?
-- Difference between charge_max and charge_min shows price spread
-- Group by Description and Code_1
-- Average gap rounded to 2 decimal places
-- TOP 20 ordered from largest variation to smallest


-- Used a CTE to calculate the gap between charge max and charge min before the ranking
-- Using ROW_NUMBER to get only top 20 codes
WITH Price_Spread AS (SELECT description, code_1, ROUND(AVG(standard_charge_max - standard_charge_min),2) AS avg_price_gap
FROM TGH_Crystal_River_2026
WHERE standard_charge_max IS NOT NULL AND standard_charge_min IS NOT NULL
GROUP BY description, code_1)
SELECT top 20 description, code_1, avg_price_gap, ROW_NUMBER() OVER(ORDER BY avg_price_gap DESC) AS ranking
FROM Price_Spread
