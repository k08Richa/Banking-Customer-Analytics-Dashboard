-- Banking Customer Analytics Dashboard
-- SQL Queries | Tool: SQLite Online
-- Dataset: 500 Customers, 2,000 Transactions

-- ─────────────────────────────────────────
-- Query 1: Preview first 5 customer records
-- ─────────────────────────────────────────
SELECT * FROM Customers LIMIT 5;

-- ─────────────────────────────────────────
-- Query 2: Total customers and average account balance
-- Result: 500 customers, average balance ₹4,38,357
-- Indicates a mid-to-high value customer base
-- ─────────────────────────────────────────
SELECT 
  COUNT(DISTINCT CustomerID) AS Total_Customers,
  ROUND(AVG(AccountBalance), 2) AS Avg_Balance
FROM Customers;

-- ─────────────────────────────────────────
-- Query 3: Customer count by account type
-- Result: Savings 303 (60.6%), Current 120 (24%), Salary 77 (15.4%)
-- Suggests a retail-heavy portfolio
-- ─────────────────────────────────────────
SELECT 
  AccountType,
  COUNT(CustomerID) AS Total_Customers
FROM Customers
GROUP BY AccountType
ORDER BY Total_Customers DESC;

-- ─────────────────────────────────────────
-- Query 4: Customer count by gender
-- Result: Male 268 (53%), Female 232 (47%) is relatively balanced
-- ─────────────────────────────────────────
SELECT 
  Gender,
  COUNT(CustomerID) AS Total_Customers
FROM Customers
GROUP BY Gender;

-- ─────────────────────────────────────────
-- Query 5: Total and average transaction amount by type
-- Result: Deposits highest at ₹3.13 crore (630 transactions)
-- Customers are net savers. Bill Payments are the lowest value but frequent
-- ─────────────────────────────────────────
SELECT 
  TransactionType,
  COUNT(TransactionID) AS Total_Transactions,
  ROUND(SUM(TransactionAmount), 2) AS Total_Amount,
  ROUND(AVG(TransactionAmount), 2) AS Avg_Amount
FROM Transactions
GROUP BY TransactionType
ORDER BY Total_Amount DESC;

-- ─────────────────────────────────────────
-- Query 6: Top 5 locations by transaction volume
-- Result: Chennai leads at ₹68.7 lakh, Lucknow second at ₹64.9 lakh
-- ─────────────────────────────────────────
SELECT 
  Location,
  COUNT(TransactionID) AS Total_Transactions,
  ROUND(SUM(TransactionAmount), 2) AS Total_Amount
FROM Transactions
GROUP BY Location
ORDER BY Total_Amount DESC
LIMIT 5;

-- ─────────────────────────────────────────
-- Query 7: Monthly transaction trend
-- Result: August and May are peak months, November is the lowest
-- Activity is relatively consistent with no single extreme spike
-- ─────────────────────────────────────────
SELECT 
  Month,
  COUNT(TransactionID) AS Total_Transactions,
  ROUND(SUM(TransactionAmount), 2) AS Total_Amount
FROM Transactions
GROUP BY Month
ORDER BY MIN(TransactionDate);

-- ─────────────────────────────────────────
-- Query 8: Customers by loan status with average balance
-- Result: Car Loan customers have highest avg balance (₹4,73,523)
-- No Loan customers have higher avg balance than Home Loan customers
-- Suggests conservative financial behaviour among debt-free customers
-- ─────────────────────────────────────────
SELECT 
  LoanStatus,
  COUNT(CustomerID) AS Total_Customers,
  ROUND(AVG(AccountBalance), 2) AS Avg_Balance
FROM Customers
GROUP BY LoanStatus
ORDER BY Total_Customers DESC;
