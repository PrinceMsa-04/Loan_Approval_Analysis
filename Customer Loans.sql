SELECT 
    c.client_name,
    c.client_score,
    l.loan_type,
    l.principal_amount
FROM clients c
JOIN loans l ON c.client_id = l.client_id
LIMIT 25;