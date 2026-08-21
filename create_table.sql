CREATE TABLE raw_transactions (
    invoice_no varchar,
    stock_code varchar,
    description varchar,
    quantity int,
    invoice_date TIMESTAMP,
    unit_price NUMERIC(12,2),
    customer_id NUMERIC,
    country varchar
);