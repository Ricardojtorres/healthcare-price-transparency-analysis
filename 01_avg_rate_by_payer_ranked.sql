-- Which payers have the lowest average negotiated rates?

-- Using CTE to pre-calculate averages before applying the ranking
-- ROUND(2) applied because raw float values have too many decimal places
WITH Avg_Rates AS (SELECT payer_name,ROUND(AVG(standard_charge_negotiated_dollar), 2) AS avg_negotiated_rate
FROM TGH_Crystal_River_2026
WHERE standard_charge_negotiated_dollar IS NOT NULL
GROUP BY payer_name)
-- DENSE_RANK used instead of RANK to avoid gaps when payers are tied
-- Example: two payers tied at rank 8 → next rank is 9, not 10
SELECT payer_name, avg_negotiated_rate, DENSE_RANK() OVER(ORDER BY avg_negotiated_rate ASC) AS ranking
FROM Avg_Rates
ORDER BY avg_negotiated_rate ASC;


