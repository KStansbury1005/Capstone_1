
SELECT 
MIN(Transaction_Date) AS FirstSale,
MAX(Transaction_Date) AS LastSale,
SUM(ss.Sale_Amount) AS TotalRevenue,
COUNT(ss.id) AS TotalTransactions
FROM Store_Sales AS ss 
JOIN store_locations AS sl
  ON sl.StoreId = ss.Store_ID
WHERE sl.State = 'Maine'
--Sales Analysis 2: Maine Territory Overview
--First Sale: 2021-12-31
--Last Sale: 2025-12-30
--The Total Revenue: $1,877,249.75
--The Total Transactions:$13,243


