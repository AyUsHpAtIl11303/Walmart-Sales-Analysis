# Walmart-Sales-Analysis
# 🛒 Walmart Sales Analysis | End-to-End Data Analytics Project

![Python](https://img.shields.io/badge/Python-Pandas-yellow)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-gold)
![Data Analytics](https://img.shields.io/badge/Domain-Data%20Analytics-blue)

## 📌 Project Overview

This project focuses on analyzing Walmart sales data to identify business trends, evaluate sales performance, and understand profitability using Python and Power BI.

The project follows an end-to-end data analytics workflow, starting with data cleaning and preprocessing, followed by exploratory data analysis and interactive dashboard development.

## 🎯 Project Objectives

- Analyze overall sales and profit performance.
- Identify top-performing products and categories.
- Understand sales trends and patterns.
- Evaluate profitability and business performance.
- Identify data quality issues.
- Create an interactive Power BI dashboard to generate actionable business insights.

## 🛠️ Tools & Technologies

| Technology | Purpose |
|---|---|
| Python | Data Cleaning and Analysis |
| Pandas | Data Manipulation |
| NumPy | Numerical Operations |
| Matplotlib | Data Visualization |
| Seaborn | Statistical Visualization |
| Jupyter Notebook | Python Development |
| Microsoft Excel | Dataset Inspection |
| Power BI | Dashboard Development |
| DAX | KPI Calculations |

## 🔄 Project Workflow

### 1. Data Cleaning & Preprocessing

- Imported the Walmart sales dataset using Pandas.
- Explored dataset structure and data types.
- Checked missing values and duplicate records.
- Identified negative and zero values.
- Investigated negative profit records.
- Prepared the dataset for analysis.

### 2. Exploratory Data Analysis (EDA)

- Analyzed sales and profit performance.
- Examined product and category performance.
- Identified business trends and patterns.
- Explored profitability across the dataset.

### 3. Power BI Dashboard Development

- Created interactive Power BI dashboards.
- Developed KPI measures using DAX.
- Analyzed sales and profit performance.
- Calculated profit margins.
- Designed multiple dashboard pages.
- Used visualizations to communicate business insights.

## 🔍 Data Quality Analysis

The following data quality checks were performed:

| Data Quality Check | Result |
|---|---:|
| Negative Sales | 0 |
| Zero Sales | 0 |
| Negative Quantity | 0 |
| Zero Quantity | 0 |
| Negative Profit | 318 |
| Zero Profit | 22 |

**Key Observation:** 318 records contained negative profit values, indicating potential loss-making transactions. These records were investigated rather than automatically removed.

## 📊 Dashboard Preview

Add your Power BI dashboard screenshots below:

![Dashboard Overview](Screenshots/dashboard_overview.png)

![Sales Analysis](Screenshots/sales_analysis.png)

## 📁 Project Structure

```text
Walmart-Sales-Analysis/
│
├── Dataset/
│   └── walmart_sales.xlsx
│
├── Python/
│   └── data_cleaning.ipynb
│
├── PowerBI/
│   └── Walmart_Sales_Dashboard.pbix
│
├── Screenshots/
│   ├── dashboard_overview.png
│   └── sales_analysis.png
│
├── requirements.txt
└── README.md
