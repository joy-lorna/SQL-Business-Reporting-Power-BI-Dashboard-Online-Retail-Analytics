/*
Business question:
Where is cancellation value highest?

Business purpose:
Highlights countries with high return or cancellation exposure.

Logic:
Cancellation value is converted to positive value using -gross_revenue.
Cancellation rate compares cancellation value to non-cancelled gross revenue.
*/

SELECT
  country_name,
  region,
  ROUND(SUM(CASE WHEN is_cancelled THEN -gross_revenue ELSE 0 END), 2)
    AS cancelled_value,
  ROUND(SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END), 2)
    AS gross_sales_value,
  ROUND(
    SAFE_DIVIDE(
      SUM(CASE WHEN is_cancelled THEN -gross_revenue ELSE 0 END),
      SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END)),
    4)
    AS cancellation_rate
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
GROUP BY country_name, region
HAVING gross_sales_value > 0
ORDER BY cancelled_value DESC;

