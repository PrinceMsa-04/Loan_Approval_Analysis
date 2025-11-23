--**********PAYMENT BEHAVIOUR**********

--Q) What percentage of payments are on-time vs late vs missed?
SELECT 
    payment_status,
    COUNT(*) as number_of_payments,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM payments), 2) as percentage
FROM payments
GROUP BY payment_status
ORDER BY number_of_payments DESC;

Business Question: What is the overall payment behavior and discipline of our clients?
Tables Used: payments
Insight: Shows the payment compliance rate across the portfolio, indicating overall client repayment discipline and collection efficiency.


--Q) How many clients never made a single payment(with their amount remaining and the default reason?
SELECT 
    l.loan_id,
    c.client_name,
    c.income_bracket,
    l.loan_type,
    l.principal_amount as original_loan_amount,
    d.amount_outstanding as pending_amount,
    d.default_reason,
    d.default_date
FROM loans l
JOIN clients c ON l.client_id = c.client_id
JOIN default d ON l.loan_id = d.loan_id
WHERE l.loan_id NOT IN (SELECT DISTINCT loan_id FROM payments)
ORDER BY d.amount_outstanding DESC
LIMIT 15;

Business Question: Which clients defaulted immediately without any payment attempts?
Tables Used: loans, clients, defaults, payments
Insight: Identifies the worst-performing clients who never made any payments, revealing potential fraud cases or severe financial distress immediately after loan disbursement.