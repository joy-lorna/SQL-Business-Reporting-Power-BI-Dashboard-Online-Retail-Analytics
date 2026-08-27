CREATE OR REPLACE TABLE `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail` AS

WITH retail_09_10 AS (
  SELECT
    'online_retail_09_10.csv' AS source_file,
    Invoice AS invoice_no,
    StockCode AS stock_code,
    Description AS description,
    SAFE_CAST(Quantity AS INT64) AS quantity,
    SAFE.PARSE_TIMESTAMP('%m/%d/%Y %H:%M', InvoiceDate) AS invoice_timestamp,
    DATE(SAFE.PARSE_TIMESTAMP('%m/%d/%Y %H:%M', InvoiceDate)) AS invoice_date,
    SAFE_CAST(Price AS NUMERIC) AS unit_price,
    SAFE_CAST(NULLIF(CustomerID, '') AS INT64) AS customer_id,
    Country AS country
  FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.raw_online_retail_09_10`
),

retail_10_11 AS (
  SELECT
    'online_retail_10_11.csv' AS source_file,
    InvoiceNo AS invoice_no,
    StockCode AS stock_code,
    Description AS description,
    SAFE_CAST(Quantity AS INT64) AS quantity,
    SAFE.PARSE_TIMESTAMP('%m/%d/%Y %H:%M', InvoiceDate) AS invoice_timestamp,
    DATE(SAFE.PARSE_TIMESTAMP('%m/%d/%Y %H:%M', InvoiceDate)) AS invoice_date,
    SAFE_CAST(UnitPrice AS NUMERIC) AS unit_price,
    SAFE_CAST(NULLIF(CustomerID, '') AS INT64) AS customer_id,
    Country AS country
  FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.raw_online_retail_10_11`
)

SELECT
  ROW_NUMBER() OVER (
    ORDER BY source_file, invoice_no, stock_code, invoice_timestamp, customer_id
  ) AS staging_row_id,
  source_file,
  invoice_no,
  stock_code,
  description,
  quantity,
  invoice_timestamp,
  invoice_date,
  unit_price,
  customer_id,
  country,
  quantity * unit_price AS line_revenue,
  STARTS_WITH(invoice_no, 'C') AS is_cancelled,
  quantity < 0 AND NOT STARTS_WITH(invoice_no, 'C') AS is_manual_adjustment
FROM (
  SELECT * FROM retail_09_10
  UNION ALL
  SELECT * FROM retail_10_11
);
