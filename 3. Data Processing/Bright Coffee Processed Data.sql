-- Databricks notebook source
----Which categories generate the most revenue?-----
SELECT
    product_category_clean,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY product_category_clean
ORDER BY total_revenue DESC;
----Checking product type with highest Revenue------
SELECT
    product_type_clean,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    SUM(CAST(transaction_qty AS DOUBLE)) AS total_quantity_sold
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY product_type_clean
ORDER BY total_revenue DESC;
-----Checking top 10 selling products-----
SELECT
product_type_clean,
ROUND(SUM(total_amount),2) AS total_revenue,
SUM(CAST(transaction_qty AS DOUBLE)) AS total_quantity_sold
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY product_type_clean
ORDER BY total_revenue DESC
LIMIT 10;
----------Checking Revenue by 3-Hour Interval Time Perfomance-------
SELECT
    transaction_time_bucket,
    COUNT(*) AS transaction_count,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY transaction_time_bucket
ORDER BY transaction_time_bucket;
------Checking perfomance on Weekdays VS Weekend
SELECT day_classification,
 COUNT(*) AS transaction_count,
 ROUND(SUM(total_amount),2) AS total_revenue
 FROM brightcoffee.coffeeshop.bright_coffee_processed
 GROUP BY day_classification 
 ORDER BY total_revenue DESC;
-----Checking revenue by Store location-----
SELECT
    store_location,
    COUNT(*) AS transaction_count,
    SUM(transaction_qty) AS units_sold,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY store_location
ORDER BY total_revenue DESC;
  ------Checking Revenue VS Volumes-------
  SELECT
    product_category_clean,
    SUM(transaction_qty) AS total_units_sold,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY product_category_clean
ORDER BY total_revenue DESC;
-----Check revenue generated in different Days------
SELECT
    day_name,
    COUNT(*) AS transaction_count,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM brightcoffee.coffeeshop.bright_coffee_processed
GROUP BY day_name
ORDER BY total_revenue DESC;

CREATE OR REPLACE TABLE brightcoffee.coffeeshop.bright_coffee_dashboard AS
SELECT *,
       MONTH(transaction_date) AS month_number
FROM brightcoffee.coffeeshop.bright_coffee_processed;

SELECT transaction_date, month_number
FROM brightcoffee.coffeeshop.bright_coffee_dashboard
LIMIT 10;

SELECT day_name, Day_number
FROM brightcoffee.coffeeshop.bright_coffee_dashboard
LIMIT 10;