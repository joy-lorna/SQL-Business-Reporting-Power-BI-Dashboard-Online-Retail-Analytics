SELECT
  ROUND(
    (
      SELECT SUM(line_revenue)
      FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail`
    ),
    2)
    AS staging_revenue,
  ROUND(
    (
      SELECT SUM(gross_revenue)
      FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.fact_sales`
    ),
    2)
    AS fact_revenue;

