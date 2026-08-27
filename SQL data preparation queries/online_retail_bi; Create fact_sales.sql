CREATE OR REPLACE TABLE `project-f57ec015-00f5-4842-84d.online_retail_bi.fact_sales`
AS
SELECT
  s.staging_row_id AS sales_key,
  s.invoice_no,
  CAST(FORMAT_DATE('%Y%m%d', s.invoice_date) AS INT64) AS date_key,
  COALESCE(c.customer_key, -1) AS customer_key,
  p.product_key,
  ctry.country_key,
  s.stock_code,
  s.quantity,
  s.unit_price,
  s.line_revenue AS gross_revenue,
  s.is_cancelled,
  s.is_manual_adjustment,
  s.source_file
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail` s
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_customer` c
  ON s.customer_id = c.customer_id
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_product` p
  ON s.stock_code = p.stock_code
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_country` ctry
  ON s.country = ctry.country_name
WHERE s.invoice_date IS NOT NULL AND s.stock_code IS NOT NULL;
