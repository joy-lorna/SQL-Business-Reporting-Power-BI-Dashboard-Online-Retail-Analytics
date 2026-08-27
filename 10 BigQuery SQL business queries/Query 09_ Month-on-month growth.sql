/*
Business question:
What is the month-on-month revenue growth rate?

Business purpose:
Identifies growth, contraction, and seasonal movement.

Technique:
LAG window function.
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
  ),
  monthly_with_prior AS (
    SELECT
      *, LAG(revenue) OVER (ORDER BY year, month_num) AS prior_month_revenue
    FROM monthly
  )
SELECT
  year,
  month_num,
  month_name,
  year_month,
  ROUND(revenue, 2) AS revenue,
  ROUND(prior_month_revenue, 2) AS prior_month_revenue,
  ROUND(revenue - prior_month_revenue, 2) AS absolute_change,
  ROUND(
    100 * SAFE_DIVIDE(revenue - prior_month_revenue, prior_month_revenue), 2)
    AS pct_change
FROM monthly_with_prior
ORDER BY year, month_num;

