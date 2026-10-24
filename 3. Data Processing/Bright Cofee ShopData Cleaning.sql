-- Databricks notebook source
SELECT *
FROM brightcoffee.coffeeshop.bright_coffee_dataset
LIMIT 1;

-----Describing column types in my data set------
DESCRIBE  brightcoffee.coffeeshop.bright_coffee_dataset;
----Checking  product Categories-----
SELECT DISTINCT product_category
FROM brightcoffee.coffeeshop.bright_coffee_dataset;
-----Cleaning Product Category----
SELECT DISTINCT 
product_category,
CASE
  WHEN product_category IS NULL THEN 'Unknown'
  WHEN product_category='' THEN 'Unknown'
  ELSE product_category
  END AS Product_cat
  FROM brightcoffee.coffeeshop.bright_coffee_dataset;
  ------Inspecting Product Type-----
  SELECT DISTINCT 
  product_type,
  CASE
  WHEN  product_type IS NULL THEN 'Unknown'
  WHEN  product_type='' THEN 'Unknown'
  ELSE  product_type
  END AS Product_typ
  FROM brightcoffee.coffeeshop.bright_coffee_dataset;
  ----Checking duplicates------
  SELECT *,
  COUNT(*) AS Duplicate_cnt
  FROM brightcoffee.coffeeshop.bright_coffee_dataset
  GROUP BY ALL
  HAVING COUNT(*)>1;
------Inspecting transcaction_time Column------
SELECT *
FROM brightcoffee.coffeeshop.bright_coffee_dataset
LIMIT 10;
------Inspecting DISCTINCT transaction_time column---
SELECT DISTINCT transaction_time-------Extracting/Inpecting different time stamps
FROM brightcoffee.coffeeshop.bright_coffee_dataset
ORDER BY transaction_time;
-----Extracting Hour and Minutes from Timestamp----
SELECT
    transaction_time,
    HOUR(transaction_time) AS transaction_hour,------Extracting Hour 
    MINUTE(transaction_time) AS transaction_minute------Extracting Minutes
FROM brightcoffee.coffeeshop.bright_coffee_dataset
LIMIT 20;
-------Creating different Time buckets-----
SELECT
    transaction_time,-----original transaction time-------
    HOUR(transaction_time) AS transaction_hour,-----Extract only the Hour component---- 

    FLOOR(HOUR(transaction_time) / 3) * 3 AS bucket_start_hour-----Get starting hour of the 3-hour interval. Floor is rounding off DOWN,removing decimal. Divide by 3 to group into 3 hours. Multiply the obtained group number by 3 and convert it back to the starting hour-------

FROM brightcoffee.coffeeshop.bright_coffee_dataset;
----CREATING TIME BUCKETS------
SELECT
    transaction_time,
    HOUR(transaction_time) AS transaction_hour,

    CASE
        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 0
            THEN '00:00-02:59'

        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 3
            THEN '03:00-05:59'

        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 6
            THEN '06:00-08:59'

        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 9
            THEN '09:00-11:59'

        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 12
            THEN '12:00-14:59'

        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 15
            THEN '15:00-17:59'

        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 18
            THEN '18:00-20:59'

        WHEN FLOOR(HOUR(transaction_time) / 3) * 3 = 21
            THEN '21:00-23:59'
    END AS transaction_time_bucket
    FROM brightcoffee.coffeeshop.bright_coffee_dataset;

    -----------------------Cleaning unit_price column-----
SELECT unit_price,
REPLACE(unit_price, ',','.') AS cleaned_price,
TRY_CAST(REPLACE(unit_price, ',','.') AS DOUBLE) AS unit_price_clean
FROM brightcoffee.coffeeshop.bright_coffee_dataset
LIMIT 3;
------Create CTE/TEMPORARY TABLE-----
CREATE OR REPLACE TABLE brightcoffee.coffeeshop.bright_coffee_processed AS

SELECT

    -- Original transaction information
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    store_location,
    product_id,
    product_category,
    product_type,
    product_detail,

    -- Clean product category
    CASE
        WHEN product_category IS NULL OR product_category = ''
            THEN 'Unknown'
        ELSE product_category
    END AS product_category_clean,

    -- Clean product type
    CASE
        WHEN product_type IS NULL OR product_type = ''
            THEN 'Unknown'
        ELSE product_type
    END AS product_type_clean,

    -- Standardise unit price
    TRY_CAST(
        REPLACE(unit_price, ',', '.')
        AS DOUBLE
    ) AS unit_price_clean,

    -- Calculate total transaction amount
    TRY_CAST(
        REPLACE(unit_price, ',', '.')
        AS DOUBLE
    )
    *
    TRY_CAST(transaction_qty AS DOUBLE)
    AS total_amount,

    -- Date-related fields
    DATE_FORMAT(transaction_date, 'EEEE') AS day_name,

    DATE_FORMAT(transaction_date, 'MMMM') AS month_name,

    YEAR(transaction_date) AS transaction_year,

    (DAYOFWEEK(transaction_date) + 5) % 7 + 1 AS Day_Number,

    -- Time-related field
    HOUR(transaction_time) AS hour_of_the_day,

    -- Weekday / Weekend classification
    CASE
        WHEN DATE_FORMAT(transaction_date, 'EEEE')
             IN ('Saturday', 'Sunday')
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_classification,

    -- 3-hour time bucket
    CASE
        WHEN HOUR(transaction_time) BETWEEN 0 AND 2
            THEN '00:00-02:59'

        WHEN HOUR(transaction_time) BETWEEN 3 AND 5
            THEN '03:00-05:59'

        WHEN HOUR(transaction_time) BETWEEN 6 AND 8
            THEN '06:00-08:59'

        WHEN HOUR(transaction_time) BETWEEN 9 AND 11
            THEN '09:00-11:59'

        WHEN HOUR(transaction_time) BETWEEN 12 AND 14
            THEN '12:00-14:59'

        WHEN HOUR(transaction_time) BETWEEN 15 AND 17
            THEN '15:00-17:59'

        WHEN HOUR(transaction_time) BETWEEN 18 AND 20
            THEN '18:00-20:59'

        WHEN HOUR(transaction_time) BETWEEN 21 AND 23
            THEN '21:00-23:59'

    END AS transaction_time_bucket,

    -- Descriptive time period
    CASE
        WHEN HOUR(transaction_time) BETWEEN 0 AND 2
            THEN 'Midnight'

        WHEN HOUR(transaction_time) BETWEEN 3 AND 5
            THEN 'Early Morning'

        WHEN HOUR(transaction_time) BETWEEN 6 AND 8
            THEN 'Morning'

        WHEN HOUR(transaction_time) BETWEEN 9 AND 11
            THEN 'Late Morning'

        WHEN HOUR(transaction_time) BETWEEN 12 AND 14
            THEN 'Afternoon'

        WHEN HOUR(transaction_time) BETWEEN 15 AND 17
            THEN 'Late Afternoon'

        WHEN HOUR(transaction_time) BETWEEN 18 AND 20
            THEN 'Evening'

        WHEN HOUR(transaction_time) BETWEEN 21 AND 23
            THEN 'Night'

    END AS time_period

FROM brightcoffee.coffeeshop.bright_coffee_dataset;
------Checking the processed table------
SELECT *
FROM brightcoffee.coffeeshop.bright_coffee_processed
LIMIT 10;
---Checking columns and data types-------
DESCRIBE brightcoffee.coffeeshop.bright_coffee_processed;

-----Check revenue generated on Weekday vs Weekend-------
SELECT
    day_classification,
    COUNT(*) AS transaction_count,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY day_classification;
-----Checking revenue generated at different time periods of the day----
SELECT
    time_period,
    COUNT(*) AS transaction_count,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY time_period
ORDER BY total_revenue DESC;
-----checking the total revenue on the processed table-----
SELECT
    COUNT(*) AS total_transactions,
    SUM(transaction_qty) AS total_units_sold,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_transaction_value
FROM brightcoffee.coffeeshop.bright_coffee_processed;

----------Checking for Invalid unitprices------
SELECT COUNT(*) AS invalid_unit_prices
FROM brightcoffee.coffeeshop.bright_coffee_processed
WHERE unit_price_clean IS NULL;
-----Checking for missing total amount-----
SELECT COUNT(*) AS missing_total_amount
FROM brightcoffee.coffeeshop.bright_coffee_processed
WHERE total_amount IS NULL;
-------Checking the 3-Hour Buckets------
SELECT
    transaction_time_bucket,
    COUNT(*) AS transaction_count,
    ROUND(SUM(total_amount), 2) AS total_revenue

FROM brightcoffee.coffeeshop.bright_coffee_processed

GROUP BY transaction_time_bucket

ORDER BY transaction_time_bucket;
------Verifying all transactions in all time buckets-----
SELECT
    transaction_time_bucket,
    COUNT(*) AS transaction_count,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY transaction_time_bucket
ORDER BY
    MIN(
        CASE transaction_time_bucket
            WHEN '00:00-02:59' THEN 0
            WHEN '03:00-05:59' THEN 3
            WHEN '06:00-08:59' THEN 6
            WHEN '09:00-11:59' THEN 9
            WHEN '12:00-14:59' THEN 12
            WHEN '15:00-17:59' THEN 15
            WHEN '18:00-20:59' THEN 18
            WHEN '21:00-23:59' THEN 21
        END
    );
-------Calculating the total revenue------
SELECT
ROUND(SUM(total_amount),2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed;
