 SELECT
    ic.Category,
    COUNT(DISTINCT ss.id) AS TotalTransactions,
    ROUND(SUM(ss.Sale_Amount), 2) AS TotalRevenue,
    ROUND(AVG(ss.Sale_Amount), 2) AS AverageSaleAmount
FROM Store_Sales ss
JOIN store_locations sl
    ON ss.Store_ID = sl.StoreId
JOIN products p
    ON ss.Prod_Num = p.ProdNum
JOIN inventory_categories ic
    ON p.Categoryid = ic.Categoryid
WHERE sl.State = 'Maine'
GROUP BY ic.Category
ORDER BY TotalRevenue DESC;