-- What is the average negotiated rate by payer and billing class?
-- Billing class separates facility vs professional charges
-- Group by payer_name and billing_class
-- Average negotiated rate rounded to 2 decimal places
-- Exclude NULLs in negotiated rate and payer_name
-- Order by billing_class, then avg rate DESC

SELECT payer_name, billing_class, ROUND(AVG(standard_charge_negotiated_dollar),2) AS avg_negotiated_rate
FROM TGH_Crystal_River_2026
WHERE payer_name IS NOT NULL AND standard_charge_negotiated_dollar IS NOT NULL
GROUP BY payer_name, billing_class
ORDER BY billing_class, avg_negotiated_rate DESC