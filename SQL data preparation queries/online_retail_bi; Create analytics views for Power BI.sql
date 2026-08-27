CREATE OR REPLACE VIEW `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
AS
SELECT
  f.sales_key,
  f.invoice_no,
  d.full_date,
  d.year,
  d.quarter,
  d.month_num,
  d.month_name,
  d.year_month,
  c.customer_id,
  c.customer_segment,
  c.cohort_month,
  p.stock_code,
  p.description,
  p.category,
  p.is_adjustment,
  ctry.country_name,
  ctry.region,
  f.quantity,
  f.unit_price,
  f.gross_revenue,
  f.is_cancelled,
  f.is_manual_adjustment,
  f.source_file
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.fact_sales` f
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_date` d
  ON f.date_key = d.date_key
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_customer` c
  ON f.customer_key = c.customer_key
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_product` p
  ON f.product_key = p.product_key
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_country` ctry
  ON f.country_key = ctry.country_key;
