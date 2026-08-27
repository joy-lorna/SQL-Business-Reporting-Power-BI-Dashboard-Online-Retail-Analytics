SELECT
  COUNT(*) AS total_fact_rows,
  COUNTIF(is_cancelled) AS cancellation_lines,
  COUNTIF(is_manual_adjustment) AS manual_adjustment_lines,
  ROUND(SUM(CASE WHEN is_cancelled THEN gross_revenue ELSE 0 END), 2)
    AS cancellation_value,
  ROUND(SUM(CASE WHEN is_manual_adjustment THEN gross_revenue ELSE 0 END), 2)
    AS manual_adjustment_value
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.fact_sales`;
