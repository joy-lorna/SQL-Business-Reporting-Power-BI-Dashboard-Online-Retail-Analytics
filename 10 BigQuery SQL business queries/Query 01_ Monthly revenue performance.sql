/*
Business question:
How is revenue trending month by month?

Business purpose:
Shows gross revenue, net revenue, order count, units sold, and average order value.

Logic:
Gross revenue excludes cancellation invoices.
Net revenue includes cancellations because cancellation rows carry negative revenue.
*/

SELECT
  year,
  month_num,
  month_name,
  year_month,
  ROUND(SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END), 2)
    AS gross_revenue,
  ROUND(SUM(gross_revenue), 2) AS net_revenue,
  COUNT(DISTINCT CASE WHEN NOT is_cancelled THEN invoice_no END) AS orders,
  SUM(CASE WHEN NOT is_cancelled THEN quantity ELSE 0 END) AS units,
  ROUND(
    SAFE_DIVIDE(
      SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END),
      COUNT(DISTINCT CASE WHEN NOT is_cancelled THEN invoice_no END)),
    2)
    AS avg_order_value
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
GROUP BY year, month_num, month_name, year_month
ORDER BY year, month_num;
