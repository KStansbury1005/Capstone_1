SELECT DISTINCT State
FROM store_locations
ORDER BY State;


SELECT
TABLE_NAME,
COLUMN_NAME,
COLUMN_TYPE,
COLUMN_KEY
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'sample_sales'
AND TABLE_NAME IN('inventory_categories', 'inventory_subcategories', 'products')
ORDER BY TABLE_NAME, ORDINAL_POSITION;






