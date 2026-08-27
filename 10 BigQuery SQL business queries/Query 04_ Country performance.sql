/*
Business question:
Which countries generate the strongest commercial performance?

Business purpose:
Compares revenue, active customers, invoice count, and revenue per customer.

Logic:
Uses country and customer dimensions joined through the analytics view.
*/

SELECT
  country_name,
  region,
  COUNT(DISTINCT customer_id) AS active_customers,
  COUNT(DISTINCT invoice_no) AS invoices,
  ROUND(SUM(gross_revenue), 2) AS revenue,
  ROUND(SAFE_DIVIDE(SUM(gross_revenue), COUNT(DISTINCT customer_id)), 2)
    AS revenue_per_customer
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
WHERE NOT is_cancelled AND customer_id IS NOT NULL
GROUP BY country_name, region
ORDER BY revenue DESC;

