
USE walmart_analytics;
SELECT DATABASE();
SHOW TABLES;

USE walmart_analytics;

CREATE TABLE sales (
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    EmailID VARCHAR(255),
    Geography VARCHAR(100),
    Category VARCHAR(100),
    Product_Name VARCHAR(255),
    Sales DECIMAL(12,2),
    Quantity INT,
    Profit DECIMAL(12,2),
    Ship_Days INT,
    Order_Year INT,
    Order_Month INT,
    Order_Month_Name VARCHAR(20),
    Order_Quarter INT,
    Profit_Margin DECIMAL(10,2)
);

SHOW TABLES;

DESCRIBE sales;
USE walmart_analytics;
LOAD DATA LOCAL INFILE 'C:/Users/ayush/OneDrive/Documents/Desktop/Walmart Data Aanlysis/Data/walmart_cleaned.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Order_ID,
    Order_Date,
    Ship_Date,
    EmailID,
    Geography,
    Category,
    Product_Name,
    Sales,
    Quantity,
    Profit,
    Ship_Days,
    Order_Year,
    Order_Month,
    Order_Month_Name,
    Order_Quarter,
    Profit_Margin
);

USE walmart_analytics;
SELECT DATABASE();

LOAD DATA LOCAL INFILE 'C:/Users/ayush/OneDrive/Documents/Desktop/Walmart Data Aanlysis/Data/walmart_cleaned.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Order_ID,
    Order_Date,
    Ship_Date,
    EmailID,
    Geography,
    Category,
    Product_Name,
    Sales,
    Quantity,
    Profit,
    Ship_Days,
    Order_Year,
    Order_Month,
    Order_Month_Name,
    Order_Quarter,
    Profit_Margin
);



SELECT COUNT(*) AS Total_Rows
FROM sales;

TRUNCATE TABLE sales;

SELECT COUNT(*) AS total_rows
FROM sales;

USE walmart_analytics;
SELECT DATABASE();


LOAD DATA LOCAL INFILE 'C:/Users/ayush/OneDrive/Documents/Desktop/Walmart Data Aanlysis/Data/walmart_cleaned.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Order_ID,
    Order_Date,
    Ship_Date,
    EmailID,
    Geography,
    Category,
    Product_Name,
    Sales,
    Quantity,
    Profit,
    Ship_Days,
    Order_Year,
    Order_Month,
    Order_Month_Name,
    Order_Quarter,
    Profit_Margin
);

SELECT COUNT(*) AS total_rows
from sales;


-- Query 1: Overall KPIs
SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT EmailID) AS Total_Customers,
    SUM(Sales) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales;


-- Query 2: Yearly Performance
SELECT
    Order_Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Order_Year
ORDER BY Order_Year;

-- ==========================================
-- 3. MONTHLY SALES TREND
-- ==========================================

SELECT
    Order_Year,
    Order_Month,
    Order_Month_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY
    Order_Year,
    Order_Month,
    Order_Month_Name
ORDER BY
    Order_Year,
    Order_Month;

-- ==========================================
-- 4. CATEGORY PERFORMANCE
-- ==========================================

SELECT
    Category,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;
    
    
    
    
    
    -- ==========================================
-- 5. LOW-PROFIT CATEGORIES
-- ==========================================

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Category
ORDER BY Total_Profit ASC;


-- ==========================================
-- 6. GEOGRAPHY PERFORMANCE
-- ==========================================

SELECT
    Geography,
    COUNT(DISTINCT Order_ID) AS Orders,
    COUNT(DISTINCT EmailID) AS Customers,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Geography
ORDER BY Total_Sales DESC;


-- ==========================================
-- 7. TOP 10 PRODUCTS BY SALES
-- ==========================================

SELECT
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- ==========================================
-- 8. TOP 10 PRODUCTS BY PROFIT
-- ==========================================

SELECT
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

-- ==========================================
-- 9. TOP 10 LOSS-MAKING PRODUCTS
-- ==========================================

SELECT
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Units_Sold,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

-- ==========================================
-- 10. TOP 20 CUSTOMERS BY REVENUE
-- ==========================================

SELECT
    EmailID,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Units_Purchased,
    SUM(Sales) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY EmailID
ORDER BY Total_Revenue DESC
LIMIT 20;

-- ==========================================
-- 11. CUSTOMER ORDER FREQUENCY
-- ==========================================

SELECT
    EmailID,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Revenue
FROM sales
GROUP BY EmailID
ORDER BY Total_Orders DESC, Total_Revenue DESC
LIMIT 20;

-- ==========================================
-- 12. AVERAGE ORDER VALUE
-- ==========================================

SELECT
    ROUND(
        SUM(Sales) / COUNT(DISTINCT Order_ID),
        2
    ) AS Average_Order_Value
FROM sales;



-- ==========================================
-- 13. TOP PRODUCTS WITHIN EACH CATEGORY
-- ==========================================

WITH product_profit AS (
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM sales
    GROUP BY Category, Product_Name
),

ranked_products AS (
    SELECT
        Category,
        Product_Name,
        Total_Sales,
        Total_Profit,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Profit DESC
        ) AS Profit_Rank
    FROM product_profit
)

SELECT *
FROM ranked_products
WHERE Profit_Rank <= 3
ORDER BY Category, Profit_Rank;

-- ==========================================
-- 14. CATEGORY REVENUE CONTRIBUTION
-- ==========================================

WITH category_sales AS (
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Category
)

SELECT
    Category,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        Total_Sales /
        SUM(Total_Sales) OVER () * 100,
        2
    ) AS Revenue_Contribution_Pct
FROM category_sales
ORDER BY Total_Sales DESC;

-- ==========================================
-- 15. TRANSACTION PROFITABILITY
-- ==========================================

SELECT
    CASE
        WHEN Profit > 0 THEN 'Profitable'
        WHEN Profit < 0 THEN 'Loss'
        ELSE 'Break-even'
    END AS Transaction_Status,
    
    COUNT(*) AS Transactions,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    CASE
        WHEN Profit > 0 THEN 'Profitable'
        WHEN Profit < 0 THEN 'Loss'
        ELSE 'Break-even'
    END
ORDER BY Total_Profit DESC;

-- ==========================================
-- 16. SHIPPING PERFORMANCE
-- ==========================================

SELECT
    Ship_Days,
    COUNT(DISTINCT Order_ID) AS Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY Ship_Days
ORDER BY Ship_Days;

-- ==========================================
-- 17. CUSTOMER REVENUE RANKING
-- ==========================================

WITH customer_revenue AS (
    SELECT
        EmailID,
        COUNT(DISTINCT Order_ID) AS Orders,
        SUM(Sales) AS Revenue
    FROM sales
    GROUP BY EmailID
)

SELECT
    EmailID,
    Orders,
    ROUND(Revenue, 2) AS Revenue,
    RANK() OVER (
        ORDER BY Revenue DESC
    ) AS Revenue_Rank
FROM customer_revenue
ORDER BY Revenue_Rank
LIMIT 20;

-- ==========================================
-- 18. CUSTOMER VALUE TIERS
-- ==========================================

WITH customer_value AS (
    SELECT
        EmailID,
        SUM(Sales) AS Revenue
    FROM sales
    GROUP BY EmailID
)

SELECT
    EmailID,
    ROUND(Revenue, 2) AS Revenue,
    CASE
        WHEN Revenue >= 3000 THEN 'High Value'
        WHEN Revenue >= 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Value_Tier
FROM customer_value
ORDER BY Revenue DESC;


-- ==========================================
-- 19. YEAR-OVER-YEAR SALES GROWTH
-- ==========================================

WITH yearly_sales AS (
    SELECT
        Order_Year,
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Order_Year
),

sales_with_previous AS (
    SELECT
        Order_Year,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Order_Year
        ) AS Previous_Year_Sales
    FROM yearly_sales
)

SELECT
    Order_Year,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(Previous_Year_Sales, 2) AS Previous_Year_Sales,
    ROUND(
        (Total_Sales - Previous_Year_Sales)
        / Previous_Year_Sales * 100,
        2
    ) AS YoY_Growth_Pct
FROM sales_with_previous
ORDER BY Order_Year;