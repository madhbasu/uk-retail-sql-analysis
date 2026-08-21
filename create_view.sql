CREATE OR REPLACE VIEW sales_transactions AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    quantity * unit_price AS sales,
    DATE_TRUNC('month', invoice_date)::date AS invoice_month
FROM raw_transactions
WHERE invoice_no NOT LIKE 'C%'
  AND quantity > 0
  AND unit_price > 0;