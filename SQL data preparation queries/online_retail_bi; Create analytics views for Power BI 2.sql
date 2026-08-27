CREATE OR REPLACE VIEW `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_monthly_summary`
AS
SELECT
  year,
  month_num,
  month_name,
  year_month,
  ROUND(SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END), 2)
    AS gross_revenue,
  ROUND(SUM(gross_revenue), 2) AS net_revenue,
  COUNT(DISTINCT CASE WHEN NOT is_cancelled THEN invoice_no END) AS orders,
  SUM(CASE WHEN NOT is_cancelled THEN quantity ELSE 0 END) AS units
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
GROUP BY year, month_num, month_name, year_month;
