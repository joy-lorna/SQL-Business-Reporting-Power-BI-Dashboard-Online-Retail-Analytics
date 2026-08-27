/*
Business question:
What is the cumulative revenue trend across the reporting period?

Business purpose:
Shows whether the business is building revenue momentum over time.

Technique:
CTE plus window function.
*/
WITH
  monthly AS (
    SELECT
      year,
      month_num,
      month_name,
      year_month,
      SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END)
        AS monthly_revenue
    FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
    GROUP BY year, month_num, month_name, year_month
  )
SELECT
  year,
  month_num,
  month_name,
  year_month,
  ROUND(monthly_revenue, 2) AS monthly_revenue,
  ROUND(
    SUM(monthly_revenue)
      OVER (
        ORDER BY year, month_num
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ),
    2)
    AS running_total_revenue
FROM monthly
ORDER BY year, month_num;

