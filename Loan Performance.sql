--**********LOAN PERFORMANCE**********

-- Q) How many loans of each types? 
SELECT 
    loan_type,
    COUNT(*) as number_of_loans
FROM loans
GROUP BY loan_type
ORDER BY number_of_loans DESC;

Business Question: What is the distribution of different loan types in our portfolio?
Tables Used: loans
Insight: Shows which loan products are most popular and the composition of our lending portfolio.


-- Q) Whats the average loan amount with respect to their type
SELECT 
    loan_type,
    COUNT(*) as number_of_loans,
    AVG(principal_amount) as avg_loan_amount
FROM loans
GROUP BY loan_type
ORDER BY number_of_loans DESC;

Business Question: How does loan sizing vary across different loan products?
Tables Used: loans
Insight: Reveals the typical loan amounts for each loan type, helping understand product positioning and risk exposure.

--Q) What's the average interest rate for each loan type? 
SELECT 
    loan_type,
    COUNT(*) as number_of_loans,
    AVG(interest_rate) as average_interest_rate,
    MIN(interest_rate) as lowest_rate,
    MAX(interest_rate) as highest_rate
FROM loans
GROUP BY loan_type
ORDER BY average_interest_rate DESC;

Query 3:
Business Question: What are the pricing strategies for different loan products?
Tables Used: loans
Insight: Identifies interest rate patterns across loan types, showing risk-based pricing and profitability by product.

--Q) Which loan types have the longest terms?
SELECT 
    loan_type,
    AVG(term_month) as average_term_months,
    MIN(term_month) as shortest_term,
    MAX(term_month) as longest_term
FROM loans
GROUP BY loan_type
ORDER BY average_term_months DESC; 

Business Question: What are the typical repayment periods for each loan type?
Tables Used: loans
Insight: Shows how loan duration varies by product type, important for cash flow planning and risk assessment