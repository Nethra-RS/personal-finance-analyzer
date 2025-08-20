# Personal Finance & Expense Analyzer 📊

An end-to-end data analytics pipeline that tracks income, expenses, and savings trends using **Snowflake**, **dbt**, and **Tableau**.  
It transforms raw transactional data into powerful insights using a modern ELT approach.

---
## 📊 Project Overview

This project provides insights into personal income and spending trends using a synthetic dataset. It helps answer questions like:
- What are the top spending categories?
- Which months had the highest income?
- Are expenses increasing over time?
- What is the net savings trend?

---
## 🧾 Dataset

**Source:** [Kaggle – Personal Finance Data (Synthetic)](https://www.kaggle.com/datasets/ramyapintchy/personal-finance-data?resource=download)  
**Duration:** Jan 1, 2020 to Dec 31, 2024  
**Fields:**
- `Date`: Date of transaction
- `Transaction Description`: Description of the transaction
- `Category`: Category of the transaction (e.g., Food & Drink, Rent)
- `Amount`: Value of transaction
- `Type`: "INCOME" or "EXPENSE"

---


## 🚀 Tech Stack
- **Snowflake** – Cloud Data Warehouse
- **DBT (Data Build Tool)** – Data Transformation and Testing
- **Tableau** – Dashboard and Visualization
- **Git** – Version Control
- **Python & pip** – For installing dbt

---

## 📊 Key Dashboards

1. **Monthly Summary** – Income vs Expense vs Net Savings  
2. **Top 5 Expense Categories** – Monthly dynamic bar chart  
3. **Savings % Trend** – Monthly net savings analysis  
4. **Forecasting** – Predict future income and expenses  
5. **Category Heatmap** – Monthly vs category grid for trends  
   
---
## 🛠️ Folder Structure
```
├── dataset/ → sample dataset
├── dbt_models/ → SQL transformations
├── tableau/ → dashboards & screenshots
├── README.md
├── Documentation
```

---

## 📈 Insights & Results

- 💸 **Overspending**: Total overspend of **$493,111** (67.2% overspent)  
- 🏆 **Top Income Months**: March 2021, Dec 2021, March 2023  
- 🛫 **Top Expense Categories**:
  - Travel – 15.39%  
  - Utilities – 14.16%  
  - Health & Fitness – 12.29%  
- 📉 **Negative Net Savings** across many months  
- 📅 **Seasonal Trends**:  
  - Expenses increased in Q4 months (holiday season)  
  - Income patterns were inconsistent across years  
- 📉 **Forecasting Outcome**: Expenses projected to keep rising faster than income.
---

## 📷 Screenshots
![Dashboard](./tableau/Dashboard%201.png)

---

## ⚡ How to Run
### 1. Clone Repository

```bash
git clone https://github.com/Nethra-RS/personal-finance-analyzer.git
cd personal-finance-analyzer
```

### 2. Load Data to Snowflake

- Create Snowflake database and schemas:
```
CREATE DATABASE personal_finance_db;
USE DATABASE personal_finance_db;

CREATE SCHEMA raw;
CREATE SCHEMA staging;
CREATE SCHEMA marts;
```

-Create Raw Table
```
CREATE OR REPLACE TABLE raw.transactions_raw (
    date STRING,
    transaction_description STRING,
    category STRING,
    amount FLOAT,
    type STRING
);
```
Upload your transactions.csv file to the raw.transactions_raw table via Snowflake UI or SnowSQL.

### 3. Install dbt & Run Models

```
pip install dbt-snowflake
```
```
dbt debug         # Test Snowflake connection
dbt run           # Run all models
dbt test          # Validate transformations
```

### 4. Open Tableau Dashboard

Launch Tableau Desktop
Connect to Snowflake → personal_finance_db.marts.* tables
Open .twbx from /tableau/ directory

---
### 📚 Full Setup & Process Flow:

See Documentation/
for:

-Full ELT pipeline explanation 
-KPI definitions
-Architecture diagrams

---

## 🔮 Future Enhancements

- Add alerts for overspending thresholds
- Integrate real-time data ingestion (via APIs)
- Add user authentication for personalized dashboards

## 🙌 Acknowledgements

Dataset: Synthetic Personal Finance CSV (Kaggle)
Tools: dbt, Snowflake, Tableau
