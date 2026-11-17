# Indian Banking Transactions Analytics

**Author: NITIN CHHOKAR**

## Project Overview

This project analyzes Indian banking transaction data to explore financial performance, customer transaction behavior, account activity, and fraud-flag patterns. It demonstrates an end-to-end data analytics workflow using Python, Pandas, MySQL, and Power BI.

The goal is to clean and prepare the dataset, perform exploratory data analysis (EDA), answer business questions using SQL, and present key findings through interactive Power BI dashboards.

## Dataset

- **Original records:** 550,000
- **Records after cleaning:** 550,000
- **Original columns:** 20
- **Columns after preprocessing:** 21
- **Unique customers:** Approximately 79,916
- **Dataset source:** Source not independently verified.

The dataset includes transaction IDs, customer IDs, transaction dates and times, account types, transaction types, transaction amounts, account balances, merchant categories, states, credit scores, loan information, transaction statuses, channels, KYC statuses, and fraud flags.

A combined `transaction_datetime` column was created during preprocessing.

## Tools & Technologies

- **Python:** Data analysis and cleaning
- **Pandas & NumPy:** Data manipulation and preprocessing
- **Matplotlib & Seaborn:** Data visualization
- **Jupyter Notebook:** EDA and data cleaning
- **MySQL:** SQL queries and business analysis
- **Power BI:** Interactive dashboards and reporting
- **Git & GitHub:** Project version control and repository management

## Project Workflow

### 1. Data Cleaning

- Inspected the dataset structure and data types.
- Checked for missing and null values.
- Checked for duplicate records and duplicate transaction IDs.
- Standardized and prepared the dataset for analysis.
- Handled missing loan-type values using appropriate categories such as `No Loan` and `Unknown`.
- Converted transaction dates and times into appropriate formats.
- Created a combined `transaction_datetime` column.
- Validated transaction amounts, account balances, credit scores, and EMI records.
- Checked data consistency and prepared the cleaned dataset for analysis.

### 2. Exploratory Data Analysis (EDA)

Performed EDA to understand:

- Transaction amount distribution.
- Transaction type and direction distribution.
- Transaction status patterns.
- Customer transaction activity.
- Account type distribution.
- Merchant category patterns.
- State-wise transaction activity.
- Transaction channel distribution.
- Loan type distribution.
- Fraud-flag patterns and trends.

### 3. SQL Analysis

Prepared 14 MySQL business analysis queries, including:

- What is the total number of transactions and total transaction value?
- How are transactions distributed by transaction status?
- Which transaction types have the highest activity?
- How do transaction values change over time?
- Which transaction channels are most frequently used?
- Which merchant categories generate the highest transaction value?
- How are transactions distributed across account types?
- Which states have the highest transaction activity?
- Who are the top 10 most active customers?
- How are transactions distributed by loan type?
- Which states have higher flagged fraud activity?
- Which transaction types have more fraud flags?
- How are debit and credit transactions distributed?
- Which customers or transactions rank highest in transaction value?

### 4. Power BI Dashboards

Created two dashboards to present the analysis through interactive visualizations.

#### Dashboard 1: Banking Performance & Transaction Overview

Includes:

- Total transactions.
- Total transaction value.
- Average transaction value.
- Unique customers.
- Transaction success rate.
- Monthly transaction value trends.
- Transaction type distribution.
- Transaction status breakdown.
- State-wise transaction value.
- Top 5 merchant categories by transaction value.
- Transaction channel distribution.
- Account type distribution.

#### Dashboard 2: Fraud, Risk & Customer Insights

Includes:

- Flagged fraud transactions.
- Fraud flag rate.
- Failed transactions.
- Reversed transactions.
- Pending transactions.
- Flagged fraud by transaction type.
- Fraud trends over time.
- Fraud flag rate by state.
- Loan type analysis.
- Debit vs. credit transaction distribution.
- Top 10 customers by transaction value.

Both dashboards include interactive filters to explore transaction data across different dimensions.

## Key Findings

- The cleaned dataset contains **550,000 transaction records**.
- The dataset includes approximately **79,916 unique customers**.
- Total recorded transaction value is approximately **₹16.45 billion**.
- Average transaction value is approximately **₹29,907**.
- The overall transaction success rate is approximately **92.04%**.
- **4,873 transactions** are flagged with a fraud indicator.
- The fraud flag rate is approximately **0.89%**.
- **21,905 transactions** have a failed status.

## Business Insights & Data Quality Considerations

- Transaction success and failure patterns can help identify areas where transaction processing may need improvement.
- State-wise and merchant-category analysis can help compare transaction activity across different segments.
- Customer transaction analysis can identify high-value and highly active customers.
- Fraud-flag analysis can help identify transaction patterns that may require further investigation.
- Failed, reversed, and pending transactions should be monitored to understand transaction processing issues.
- Fraud flags represent records marked as potentially fraudulent in the dataset; they do not establish confirmed fraud.
- The dataset's original source has not been independently verified, so findings should be interpreted as analysis of the provided dataset rather than verified banking industry statistics.
- The available data covers January 2019 to January 2024, with 2024 representing an incomplete period.

## Project Files

This repository includes:

- **Jupyter Notebook (`.ipynb`):** Python data cleaning and EDA.
- **SQL File (`.sql`):** 14 business analysis queries.
- **Power BI File (`.pbix`):** Interactive dashboard report.
- **Cleaned Dataset (`.csv`):** Preprocessed transaction data.
- **Raw Dataset (`.csv`):** Original transaction data.
- **Business Problem Document (`.pdf`):** Explains the key business problems and analytical questions explored in the dataset.
- **Project Report (`.pdf`):** Documentation of the workflow, analysis, dashboards, and recommendations.
- **Project Presentation (`.pptx`):** Summary of the project, methodology, findings, and business recommendations.

## Conclusion

This project demonstrates practical data analytics skills, including data cleaning, exploratory data analysis, SQL querying, and interactive dashboard development.

It provides insights into banking transaction performance, customer behavior, account activity, and fraud-flag patterns while highlighting areas that may require further investigation.

The project represents an end-to-end banking analytics workflow, from raw data preparation to business-focused reporting.

---

**Created by NITIN CHHOKAR**  
*Indian Banking Transactions Analytics Project*
