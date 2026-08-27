/*
Business question:
Which product categories drive the most revenue?

Business purpose:
Shows revenue, units, product count, and share of revenue by product category.

Logic:
Excludes cancellations and non-merchandise adjustment codes.
*/

SELECT
  category,
  ROUND(SUM(gross_revenue), 2) AS revenue,
  SUM(quantity) AS units,
  COUNT(DISTINCT stock_code) AS product_count,
  ROUND(
    100 * SAFE_DIVIDE(SUM(gross_revenue), SUM(SUM(gross_revenue)) OVER ()), 2)
    AS pct_of_revenue
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
WHERE NOT is_cancelled AND NOT is_adjustment
GROUP BY category
ORDER BY revenue DESC;

