--********** CUSTOMER PROFILE QUESTIONS**********

--Q) Which states have clients with highest average credit scores?
SELECT 
    state,
    COUNT(*) as number_of_clients,
    AVG(client_score) as average_credit_score,
    MIN(client_score) as worst_score,
    MAX(client_score) as best_score
FROM clients
GROUP BY state
ORDER BY average_credit_score DESC;

Business Question: Which geographic locations have the highest quality clients?
Tables Used: clients
Insight: Identifies states with the best/worst average credit scores for targeted marketing and risk assessment.

-- Q) Show me only high-risk Clients
SELECT 
    client_name,
    client_score,
    income_bracket
FROM clients
WHERE client_score < 600
  AND income_bracket = 'Low'
LIMIT 20;

Business Question: Who are our highest risk clients that need immediate attention?
Tables Used: clients
Insight: Isolates low-income clients with poor credit scores (<600) for focused collection efforts and risk management.

--Q) Risky customer profiles
SELECT 
    income_bracket,
    employment_status,
    COUNT(*) as client_count,
    AVG(client_score) as avg_score
FROM clients
GROUP BY income_bracket, employment_status
ORDER BY client_count DESC;

Business Question: What customer segments have the worst credit profiles?
Tables Used: clients
Insight: Reveals that certain income-employment combinations have significantly higher risk profiles, guiding lending strategy.