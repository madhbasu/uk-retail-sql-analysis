-- Monthly sales trend

select invoice_month,
round(sum(sales),2) as total_sales,
count (distinct invoice_no) as total_order
from sales_transactions
where invoice_date < '2011-12-01'
group by invoice_month
order by total_sales desc;

select * from sales_transactions;

-- Best-performing products

select description,
sum(sales) as total_sales,
sum(quantity) as units_sold
from sales_transactions
where description is NOT NULL
group by description
order by total_sales desc
LIMIT 10;
-- Best-performing physical products by sales value
SELECT
    description,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS units_sold
FROM sales_transactions
WHERE description IS NOT NULL
  AND UPPER(description) NOT IN (
      'DOTCOM POSTAGE',
      'POSTAGE',
      'MANUAL',
      'CARRIAGE',
      'BANK CHARGES'
  )
GROUP BY description
ORDER BY total_sales DESC
LIMIT 10;

-- Highest-value customers

select customer_id,
count(distinct invoice_no) as total_orders,
sum(sales) as total_sales
from sales_transactions
where customer_id is not null
group by customer_id
order by total_sales desc;

-- Repeat customers

select customer_id,
count(distinct invoice_no) as total_orders,
sum(sales) as total_sales
from sales_transactions
where customer_id is not null
group by customer_id
having count(distinct invoice_no) > 1
order by total_orders desc, sum(sales) desc

-- month-on-month sales change

WITH monthly_sales AS (
    SELECT
        invoice_month,
        SUM(sales) AS total_sales
    FROM sales_transactions
    GROUP BY invoice_month
)
SELECT
    invoice_month,
    ROUND(total_sales, 2) AS total_sales,
	LAG(total_sales) OVER (ORDER BY invoice_month),
    ROUND(
        100.0 * (total_sales - LAG(total_sales) OVER (ORDER BY invoice_month))
        / LAG(total_sales) OVER (ORDER BY invoice_month),
        2
    ) AS month_on_month_change_pct
FROM monthly_sales
ORDER BY invoice_month;

