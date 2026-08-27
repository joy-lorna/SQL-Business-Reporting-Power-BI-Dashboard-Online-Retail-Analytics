/*
Business question:
Who are the highest-value customers?

Business purpose:
Identifies customers contributing the most revenue.

Logic:
Excludes cancellation lines and unknown customer rows.
*/

SELECT
  customer_id,
  customer_segment,
  ROUND(SUM(gross_revenue), 2) AS revenue,
  COUNT(DISTINCT invoice_no) AS orders,
  ROUND(SAFE_DIVIDE(SUM(gross_revenue), COUNT(DISTINCT invoice_no)), 2)
    AS avg_order_value,
  ROUND(
    100 * SAFE_DIVIDE(SUM(gross_revenue), SUM(SUM(gross_revenue)) OVER ()), 2)
    AS pct_of_total_revenue
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
WHERE NOT is_cancelled AND customer_id IS NOT NULL
GROUP BY customer_id, customer_segment
ORDER BY revenue DESC
LIMIT 10;
