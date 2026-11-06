SELECT
SUM(CASE
    WHEN sl.State = 'Maine'
    THEN ss.Sale_Amount
     ELSE 0
   END) AS MaineRevenue,
   SUM(ss.Sale_Amount) AS NortheastRevenue,

    ROUND(
        100.0 * SUM(CASE
            WHEN sl.State = 'Maine'
            THEN ss.Sale_Amount
            ELSE 0
        END) / NULLIF(SUM(ss.Sale_Amount), 0),
        2
    ) AS MainePercentOfRegion

FROM Store_Sales ss
JOIN store_locations sl
    ON ss.Store_ID = sl.StoreId

WHERE sl.State IN (
    'Maine',
    'Connecticut',
    'Massachusetts',
    'New Jersey',
    'New York'
);

DESCRIBE store_sales




SELECT
    YEAR(ss.Transaction_Date) AS SalesYear,
    MONTH(ss.Transaction_Date) AS SalesMonth,
    MONTHNAME(ss.Transaction_Date) AS MonthName,
    ic.Category,
    COUNT(DISTINCT ss.id) AS TransactionCount,
    ROUND(AVG(ss.Sale_Amount), 2) AS AverageTransactionAmount

FROM Store_Sales ss

JOIN store_locations sl
    ON ss.Store_ID = sl.StoreId

JOIN products p
    ON ss.Prod_Num = p.ProdNum

JOIN inventory_categories ic
    ON p.Categoryid = ic.Categoryid

WHERE sl.State = 'Maine'

GROUP BY
    YEAR(ss.Transaction_Date),
    MONTH(ss.Transaction_Date),
    MONTHNAME(ss.Transaction_Date),
    ic.Category

ORDER BY
    SalesYear,
    SalesMonth,
    ic.Category;



