SHOW TABLES;





SELECT
 sl.StoreLocation,
    sl.State,
    sl.StoreId,
    COUNT(ss.id) AS TransactionCount,
    SUM(ss.Sale_Amount) AS TotalRevenue
FROM store_locations AS sl
LEFT JOIN Store_Sales AS ss
    ON sl.StoreId = ss.Store_ID
WHERE sl.State = 'Maine'
GROUP BY
    sl.StoreLocation,
    sl.State,
    sl.StoreId
ORDER BY TotalRevenue DESC;
--Overall result
--South Portland has produced the most revenue within the Maine area. 
--Store location's total is $332,611.76
















