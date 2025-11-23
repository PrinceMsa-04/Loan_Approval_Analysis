--**********RISK ASSESSMENT**********

--Q) Biggest Financial Losses
SELECT 
    c.income_bracket,
    c.employment_status,
    l.loan_type,
    COUNT(*) as default_count,
    SUM(d.amount_outstanding) as total_loss,
    AVG(d.amount_outstanding) as avg_loss_per_loan
FROM clients c
JOIN loans l ON c.client_id = l.client_id
JOIN default d ON l.loan_id = d.loan_id
GROUP BY c.income_bracket, c.employment_status, l.loan_type
ORDER BY total_loss DESC
LIMIT 10;

Business Question: Which customer segments are causing the biggest financial losses?
Tables Used: clients, loans, defaults
Insight: Identifies the highest-loss combinations of income level, employment status, and loan type for targeted risk mitigation.


--Q) What's the most common default reason for each loan type?
SELECT 
    l.loan_type,
    d.default_reason,
    COUNT(*) as number_of_defaults
FROM loans l
JOIN default d on l.loan_id = d.loan_id
GROUP BY l.loan_type, d.default_reason
ORDER BY l.loan_type, number_of_defaults DESC;

Business Question: Why do different types of loans fail?
Tables Used: loans, defaults
Insight: Reveals loan-type specific failure patterns, enabling product-specific risk management strategies.


--Q) What's the average loan size of customers according to their salary
SELECT
    c.income_bracket,
    COUNT(*) as number_of_loans,
    AVG(l.principal_amount) as average_loan_size,
    MIN(l.principal_amount) as smallest_loan,
    MAX(l.principal_amount) as largest_size,
FROM clients c
JOIN loans l ON c.client_id = l.client_id
GROUP BY c.income_bracket
ORDER BY average_loan_size DESC;

SELECT CURRENT_ACCOUNT() AS account_name, 
       CURRENT_REGION() AS region_name;


Business Question: How does loan sizing strategy vary across different customer income levels?
Tables Used: clients, loans
Insight: Reveals lending patterns showing whether higher-income customers receive proportionally larger loans, indicating risk-based or relationship-based lending strategies.