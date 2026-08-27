/*
Business question:
What is the smoothed revenue trend?

Business purpose:
Reduces month-to-month noise using a rolling 3-month average.

Technique:
Windowed AVG.
*/

WITH
  monthly AS (
    SELECT
      year,
      month_num,
      month_name,
      year_month,
      SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END) AS revenue
    FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
    GROUP BY year, month_num, month_name, year_month
  )
SELECT
  year,
  month_num,
  month_name,
  year_month,
  ROUND(revenue, 2) AS revenue,
  ROUND(
    AVG(revenue)
      OVER (ORDER BY year, month_num ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),
    2)
    AS rolling_3_month_avg
FROM monthly
ORDER BY year, month_num;

