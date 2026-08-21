# uk-retail-sql-analysis
PostgreSQL analysis of UK online retail sales, product performance and customer behaviour.
# UK Online Retail Sales & Customer Behaviour Analysis

## Project overview

This project uses PostgreSQL to analyse transaction data from a UK-based online retailer. The analysis identifies monthly sales patterns, high-performing products, high-value customers and repeat purchasing behaviour to support data-informed commercial decisions.

## Dataset

The project uses the [UCI Online Retail dataset](https://uci-ics-mlr-prod.aws.uci.edu/dataset/352/online%2Bretail), containing 541,909 transaction records from a UK-based non-store retailer between December 2010 and December 2011.

## Business questions

- How did sales and order volumes change by month?
- Which physical products generated the highest sales?
- Which customers generated the highest sales?
- Which customers made repeat purchases?
- How did sales change month on month?

## Tools used

- PostgreSQL 17
- pgAdmin 4
- SQL

## Data preparation

I created a `raw_transactions` table to store the original transaction data and a `sales_transactions` view for analysis.

The cleaned view:

- Excludes cancelled invoices, identified by invoice numbers beginning with `C`
- Excludes transactions with zero or negative quantities
- Excludes transactions with zero unit prices
- Calculates sales as `quantity * unit_price`
- Creates a monthly analysis field using `DATE_TRUNC('month', invoice_date)`

## SQL skills demonstrated

- Creating tables and views
- Data cleaning using `WHERE` clauses
- Aggregations using `SUM`, `COUNT`, `GROUP BY` and `HAVING`
- Date analysis using `DATE_TRUNC`
- Common Table Expressions (CTEs)
- Window functions using `LAG`
- Month-on-month sales analysis

## Key findings

1. **Monthly sales pattern:** Sales declined from £823,746 in December 2010 to £523,632 in February 2011. After recovering in March, sales remained relatively stable from April to August before rising sharply from September to November.

2. **Peak trading month:** November 2011 generated the highest sales, at **£1,509,496** across **2,769 distinct orders**.

3. **Product performance:** REGENCY CAKESTAND 3 TIER was the highest-performing physical product by sales value, generating **£174,484.74** from **13,879 units sold**.

4. **Customer value:** Customer **14646** generated the highest sales value of **£280,206.02** across **73 orders**.

5. **Month-on-month change:** The largest valid month-on-month sales increase was **43.27%** from April to May 2011. The largest decrease across complete months was **25.06%** from March to April 2011.

## Recommendations

1. **Peak-season planning:** Plan inventory, operational capacity and promotional activity ahead of the strong September-to-November sales period.

2. **Customer retention:** Prioritise retention activity for high-value, repeat customers, as a small number of customers can contribute substantial sales value.

3. **Product planning:** Prioritise stock availability and promotional activity for high-value products such as REGENCY CAKESTAND 3 TIER during high-demand periods.

## Limitation

The source data ends on 9 December 2011. December 2011 is therefore incomplete and is excluded from month-on-month performance conclusions.

## Repository files

- `create_table.sql` - table definition for the raw transaction data
- `create_view.sql` - cleaned sales view
- `analysis_queries.sql` - monthly, product and customer analysis queries

## Query-result screenshots

## [Monthly sales trend]<img width="647" height="457" alt="Monthly_sales" src="https://github.com/user-attachments/assets/43d0fd9d-bf89-4b4f-956a-2f3e507e1377" />


## [Month-on-month sales change]<img width="412" height="462" alt="Sales_Month" src="https://github.com/user-attachments/assets/1e8bca66-c5c9-4c6c-926d-5922181c9bbd" />


## [Best-performing physical products]<img width="600" height="365" alt="best_products_updated" src="https://github.com/user-attachments/assets/77b3a831-56c7-440b-9230-96907e4a0cae" />
