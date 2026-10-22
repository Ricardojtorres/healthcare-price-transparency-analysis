-- Which payer offers the highest negotiated rate for each procedure?


-- Created a CTE to rank the top payers for each code
WITH top_rate AS (SELECT description, code_1, payer_name, standard_charge_negotiated_dollar, ROW_NUMBER() OVER(PARTITION BY code_1 ORDER BY standard_charge_negotiated_dollar DESC) AS row_num
FROM TGH_Crystal_River_2026
WHERE standard_charge_negotiated_dollar IS NOT NULL AND payer_name IS NOT NULL)
-- Only selected the top 20, ordered by negotiated rate
SELECT top 20 description, code_1, payer_name, standard_charge_negotiated_dollar, row_num
FROM top_rate
WHERE row_num = 1
ORDER BY standard_charge_negotiated_dollar DESC
