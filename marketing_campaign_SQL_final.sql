CREATE DATABASE marketing_project;
USE marketing_project;

select * from marketing_cleaned;

describe marketing_cleaned;

#SEGMENTATION USING SQL

#Income Segmentation
SELECT 
    ID,
    Income,
    CASE 
        WHEN Income > 75000 THEN 'High Income'
        ELSE 'Low Income'
    END AS Income_Segment_SQL
FROM marketing_cleaned;

#Age Segmentation

SELECT 
    ID,
    Age,
    CASE 
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Segment_SQL
FROM marketing_cleaned;

#Family segementation

SELECT 
    ID,
    Children,
    CASE 
        WHEN Children > 0 THEN 'Has Children'
        ELSE 'No Children'
    END AS Family_Segment_SQL
FROM marketing_cleaned;

# sepender segemetation

SELECT 
    ID,
    Total_Spend,
    CASE 
        WHEN Total_Spend > 50000 THEN 'High Spender'
        WHEN Total_Spend BETWEEN 20000 AND 50000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS Spender_Type_SQL
FROM marketing_cleaned;

#KPI ANALYSIS USING SEGMENTS

#Income Segment KPI

SELECT 
    Income_Segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(Response)*100,2) AS response_rate,
    ROUND(AVG(Total_Spend),2) AS avg_spend
FROM marketing_cleaned
GROUP BY Income_Segment;

#Age Segment KPI

SELECT 
    Age_Segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(Response)*100,2) AS response_rate
FROM marketing_cleaned
GROUP BY Age_Segment;

#Family Segment KPI

SELECT 
    Family,
    COUNT(*) AS total_customers,
    ROUND(AVG(Response)*100,2) AS response_rate
FROM marketing_cleaned
GROUP BY Family;

#Spender Segment KPI

SELECT 
    Spender_Type,
    COUNT(*) AS total_customers,
    ROUND(AVG(Response)*100,2) AS response_rate,
    ROUND(AVG(Total_Spend),2) AS avg_spend
FROM marketing_cleaned
GROUP BY Spender_Type;

#SEGMENTATION USING CASE + KPI

SELECT 
    CASE 
        WHEN Income > 75000 THEN 'High Income'
        ELSE 'Low Income'
    END AS Income_Group,
    COUNT(*) AS total_customers,
    ROUND(AVG(Response)*100,2) AS response_rate,
    ROUND(AVG(Total_Spend),2) AS avg_spend
FROM marketing_cleaned
GROUP BY Income_Group;

#Channel Usage

SELECT 
    ROUND(AVG(NumWebPurchases),2) AS avg_web,
    ROUND(AVG(NumStorePurchases),2) AS avg_store,
    ROUND(AVG(NumCatalogPurchases),2) AS avg_catalog
FROM marketing_cleaned;

#Campaign Performance

SELECT 
    ROUND(AVG(AcceptedCmp1)*100,2) AS campaign1,
    ROUND(AVG(AcceptedCmp2)*100,2) AS campaign2,
    ROUND(AVG(AcceptedCmp3)*100,2) AS campaign3,
    ROUND(AVG(AcceptedCmp4)*100,2) AS campaign4,
    ROUND(AVG(AcceptedCmp5)*100,2) AS campaign5
FROM marketing_cleaned;
