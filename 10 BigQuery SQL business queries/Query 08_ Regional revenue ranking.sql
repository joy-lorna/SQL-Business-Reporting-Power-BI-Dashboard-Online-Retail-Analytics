/*
Business question:
How do regions rank by revenue each quarter?

Business purpose:
Compares regional performance across time.

Technique:
CTE plus RANK window function.
*/

WITH
  regional_quarterly AS (
    SELECT
      year,
      quarter,
      region,
      SUM(CASE WHEN NOT is_cancelled THEN gross_revenue ELSE 0 END) AS revenue
    FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.vw_sales_analytics`
    GROUP BY year, quarter, region
  )
SELECT
  year,
  quarter,
  region,
  ROUND(revenue, 2) AS revenue,
  RANK() OVER (PARTITION BY year, quarter ORDER BY revenue DESC) AS region_rank
FROM regional_quarterly
ORDER BY year, quarter, region_rank;

