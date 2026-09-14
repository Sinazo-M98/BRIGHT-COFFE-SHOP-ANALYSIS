# ☕ Bright Coffee Shop — Sales & Product Performance Analysis

## 📌 Project Overview

Bright Coffee Shop is looking to better understand its sales performance, product demand and customer purchasing patterns.

The objective of this project was to analyse transaction-level data and provide insights into **revenue performance, product performance and purchasing patterns throughout the day and week**.

I used SQL, Excel and dashboarding tools to clean, transform, analyse and visualise the data.

---

## 🎯 Business Objective

The analysis focused on answering three key business questions:

1. **Which products generate the most revenue?**
2. **What times of the day generate the most revenue?**
3. **What trends and patterns can be identified to support business decisions?**

The final objective was to translate these findings into practical recommendations that could help Bright Coffee Shop improve revenue and product performance.

---

## 🗂️ Dataset

The project uses transaction-level coffee shop sales data.

The processed dataset contains information including:

* Transaction ID
* Transaction date
* Transaction time
* Transaction quantity
* Store ID
* Store location
* Product ID
* Product category
* Product type
* Product detail
* Unit price
* Total transaction value
* Day of week
* Month
* Transaction year
* Hour of day
* Day classification
* Time bucket
* Time period

Each transaction represents a customer purchase.

---

## 🛠️ Tools & Technologies

* **SQL** — data cleaning, transformation and analysis
* **Databricks** — data processing and SQL analysis
* **Microsoft Excel** — analysis and dashboard development
* **Power BI / Data Studio** — interactive data visualisation

---

## 🔄 Data Preparation

The raw dataset was transformed into a structured analytical dataset.

Key preparation steps included:

* Handling missing product categories
* Handling missing product types
* Replacing blank values with `Unknown`
* Cleaning unit-price values
* Converting unit price to a numerical data type
* Calculating transaction revenue
* Creating day-of-week attributes
* Creating month attributes
* Extracting transaction hour
* Classifying transactions as weekday or weekend
* Creating time-of-day categories
* Creating 3-hour transaction time buckets
* Validating transaction and revenue calculations

### Revenue Calculation

Transaction revenue was calculated using:

```text
Total Amount = Unit Price × Transaction Quantity
```

---

## 📊 Overall Performance

The analysed dataset contains:

| KPI                       |      Result |
| ------------------------- | ----------: |
| Total Transactions        |     149,116 |
| Total Units Sold          |     214,470 |
| Total Revenue             | R698,812.33 |
| Average Transaction Value |       R4.69 |

---

## 🏆 Product Performance

### Revenue by Product Category

The strongest revenue-generating category was **Coffee**, followed by **Tea**.

| Category           |     Revenue |
| ------------------ | ----------: |
| Coffee             | R269,952.45 |
| Tea                | R196,405.95 |
| Bakery             |  R82,315.64 |
| Drinking Chocolate |  R72,416.00 |
| Coffee Beans       |  R40,085.25 |

Coffee generated the highest revenue and also recorded the highest unit volume.

### Top Product Types by Revenue

| Product Type          |    Revenue |
| --------------------- | ---------: |
| Barista Espresso      | R91,406.20 |
| Brewed Chai Tea       | R77,081.95 |
| Hot Chocolate         | R72,416.00 |
| Gourmet Brewed Coffee | R70,034.60 |
| Brewed Black Tea      | R47,932.00 |

---

## ⏰ Revenue by Time of Day

The analysis showed that **Late Morning** generated the highest revenue among the defined time periods.

| Time Period    |     Revenue |
| -------------- | ----------: |
| Late Morning   | R220,162.06 |
| Morning        | R168,126.61 |
| Late Afternoon | R122,990.16 |
| Afternoon      | R121,864.98 |
| Evening        |  R65,668.52 |

This suggests that the late-morning period represents an important sales opportunity for the business.

---

## 📅 Weekday vs Weekend Performance

Weekdays generated significantly more revenue than weekends.

| Classification | Transactions |     Revenue |
| -------------- | -----------: | ----------: |
| Weekday        |      107,510 | R503,587.54 |
| Weekend        |       41,606 | R195,224.79 |

Monday recorded the highest revenue among individual days, while Saturday recorded the lowest.

---

## 💡 Key Insights

### 1. Coffee is the strongest revenue category

Coffee generated the highest revenue and unit sales, making it a key category for the business.

### 2. Late morning is the strongest trading period

Late morning generated the highest revenue, highlighting a potentially valuable period for promotions, product bundles and operational focus.

### 3. Weekdays drive the majority of revenue

The majority of transactions and revenue occur during weekdays, suggesting that Bright Coffee Shop's customer base has strong weekday purchasing behaviour.

### 4. Product-level performance varies significantly

A small number of product types contribute a substantial proportion of revenue, providing opportunities to focus promotional activity on high-performing products while reviewing weaker performers.

---

## 📈 Business Recommendations

Based on the analysis, Bright Coffee Shop could consider:

### ☕ Strengthen High-Performing Products

Maintain availability and visibility of high-revenue products such as Barista Espresso, Brewed Chai Tea and Hot Chocolate.

### 🕙 Target the Late-Morning Period

Use promotions, bundles or upselling strategies during the late-morning period to maximise the strongest revenue window.

### 📅 Improve Weekend Performance

Investigate the lower weekend revenue and consider weekend-specific promotions or product combinations to increase customer traffic and basket value.

### 🧁 Cross-Sell Products

Pair high-performing beverages with bakery products or complementary items to increase average transaction value.

### 📊 Monitor Product Performance

Continue tracking revenue, units sold and transaction value to identify changing customer preferences and optimise the product mix.

---

## 📊 Dashboard

The Excel dashboard includes:

* KPI cards
* Revenue by product category
* Revenue by product type
* Revenue by time period
* Revenue by day classification
* Interactive slicers

The dashboard was designed to allow users to move from **high-level performance indicators to detailed product and time-based insights**.

---

## 🚀 Project Outcome

This project demonstrates my ability to transform raw transaction data into actionable business insights through an end-to-end analytical workflow:

**Raw Data → Data Cleaning → Data Transformation → SQL Analysis → Excel Dashboard → Business Insights → Recommendations**

---

## 👩🏽‍💻 Skills Demonstrated

`SQL` `Python` `Databricks` `Excel` `Data Cleaning` `Data Transformation` `Data Analysis` `Data Visualisation` `Dashboard Development` `Business Intelligence`

---

## 📁 Project Structure

```text
Bright-Coffee-Shop/
│
├── README.md
├── data/
├── sql/
├── excel/
├── dashboards/
└── images/
```

---

## 👤 Author

**Sinazo Mgingqi**

Data Analyst | Chemical Science | Quality Management

**Core Skills:** SQL • Python • Power BI • Excel • Data Analysis

