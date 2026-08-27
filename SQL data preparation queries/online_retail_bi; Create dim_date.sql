CREATE OR REPLACE TABLE `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_date`
AS
SELECT
  CAST(FORMAT_DATE('%Y%m%d', calendar_date) AS INT64) AS date_key,
  calendar_date AS full_date,
  FORMAT_DATE('%A', calendar_date) AS day_name,
  EXTRACT(DAYOFWEEK FROM calendar_date) AS day_of_week,
  EXTRACT(WEEK FROM calendar_date) AS week_of_year,
  EXTRACT(MONTH FROM calendar_date) AS month_num,
  FORMAT_DATE('%B', calendar_date) AS month_name,
  EXTRACT(QUARTER FROM calendar_date) AS quarter,
  EXTRACT(YEAR FROM calendar_date) AS year,
  FORMAT_DATE('%Y-%m', calendar_date) AS year_month
FROM
  UNNEST(
    GENERATE_DATE_ARRAY(
      (
        SELECT MIN(invoice_date)
        FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail`
      ),
      (
        SELECT MAX(invoice_date)
        FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail`
      ),
      INTERVAL 1 DAY))
    AS calendar_date;
