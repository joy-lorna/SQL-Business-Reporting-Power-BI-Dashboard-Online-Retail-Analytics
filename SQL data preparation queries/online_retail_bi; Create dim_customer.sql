CREATE OR REPLACE TABLE `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_customer`
AS
WITH
  known_customers AS (
    SELECT
      customer_id,
      MIN(invoice_date) AS first_purchase_date,
      FORMAT_DATE('%Y-%m', MIN(invoice_date)) AS cohort_month,
      COUNT(DISTINCT invoice_no) AS lifetime_invoices,
      SUM(CASE WHEN NOT is_cancelled THEN line_revenue ELSE 0 END)
        AS lifetime_gross_revenue
    FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail`
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id
  ),
  segmented_customers AS (
    SELECT
      customer_id AS customer_key,
      customer_id,
      first_purchase_date,
      cohort_month,
      lifetime_invoices,
      lifetime_gross_revenue,
      CASE
        WHEN lifetime_gross_revenue >= 10000 THEN 'High value'
        WHEN lifetime_gross_revenue >= 2500 THEN 'Medium value'
        WHEN lifetime_gross_revenue > 0 THEN 'Low value'
        ELSE 'No positive sales'
        END
        AS customer_segment,
      FALSE AS is_unknown
    FROM known_customers
  )
SELECT
  -1 AS customer_key,
  CAST(NULL AS INT64) AS customer_id,
  CAST(NULL AS DATE) AS first_purchase_date,
  CAST(NULL AS STRING) AS cohort_month,
  0 AS lifetime_invoices,
  CAST(0 AS NUMERIC) AS lifetime_gross_revenue,
  'Unknown customer' AS customer_segment,
  TRUE AS is_unknown
UNION ALL
SELECT
  customer_key,
  customer_id,
  first_purchase_date,
  cohort_month,
  lifetime_invoices,
  lifetime_gross_revenue,
  customer_segment,
  is_unknown
FROM segmented_customers;
