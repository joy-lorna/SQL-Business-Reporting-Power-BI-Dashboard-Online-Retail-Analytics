SELECT
  COUNT(*) AS total_rows,
  MIN(invoice_date) AS first_invoice_date,
  MAX(invoice_date) AS last_invoice_date,
  COUNT(DISTINCT invoice_no) AS distinct_invoices,
  COUNT(DISTINCT stock_code) AS distinct_stock_codes,
  COUNT(DISTINCT customer_id) AS distinct_customers,
  COUNT(DISTINCT country) AS distinct_countries,
  COUNTIF(customer_id IS NULL) AS rows_missing_customer_id,
  COUNTIF(description IS NULL OR TRIM(description) = '')
    AS rows_missing_description,
  COUNTIF(quantity < 0) AS rows_negative_quantity,
  COUNTIF(unit_price = 0) AS rows_zero_unit_price,
  COUNTIF(is_cancelled) AS cancellation_lines,
  COUNTIF(is_manual_adjustment) AS manual_adjustment_lines,
  ROUND(SUM(line_revenue), 2) AS total_net_revenue
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail`;
