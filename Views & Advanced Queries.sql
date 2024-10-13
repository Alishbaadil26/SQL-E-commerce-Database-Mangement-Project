SELECT 
    p.ProductName, 
    c.CategoryName, 
    s.SupplierName
FROM 
    product p
JOIN 
    category c ON c.CategoryID = p.CategoryID
JOIN 
    supplier s ON p.SupplierID = s.SupplierID
WHERE 
    c.CategoryName = 'Electronics'

UNION

SELECT 
    p.ProductName, 
    c.CategoryName, 
    s.SupplierName
FROM 
    product p
JOIN 
    category c ON c.CategoryID = p.CategoryID
JOIN 
    supplier s ON p.SupplierID = s.SupplierID
WHERE 
    c.CategoryName = 'Furniture';

    

SELECT c.FirstName, c.LastName
FROM customer c
WHERE EXISTS (
    SELECT *
    FROM customer_order co
    WHERE co.CustomerID = c.CustomerID
);

SELECT 
    s.SupplierName, 
    COUNT(p.ProductID) AS "Number of Products"
FROM 
    supplier s
LEFT JOIN 
    product p ON s.SupplierID = p.SupplierID
GROUP BY 
    s.SupplierName
ORDER BY 
    COUNT(p.ProductID) DESC;
    
SELECT 
    MIN(p.Price) AS MinPrice,
    MAX(p.Price) AS MaxPrice,
    AVG(p.Price) AS AvgPrice,
    VARIANCE(p.Price) AS PriceVariance,
    STDDEV(p.Price) AS PriceStdDev
FROM 
    product p;

    
SELECT DISTINCT c.FirstName, c.LastName
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM customer_order co
    JOIN order_transaction ot ON co.CustomerID = ot.CustomerID AND co.OrderID = ot.OrderID
    WHERE co.CustomerID = c.CustomerID
      AND ot.TransactionStatus = 'Pending'  -- Adjust condition as needed
      AND co.OrderDate >= TO_DATE('2024-01-01', 'YYYY-MM-DD')  -- Example date condition
);



