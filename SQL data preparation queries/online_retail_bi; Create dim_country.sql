CREATE OR REPLACE TABLE `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_country`
AS
SELECT
  ROW_NUMBER() OVER (ORDER BY country) AS country_key,
  country AS country_name,
  CASE
    WHEN country = 'United Kingdom' THEN 'United Kingdom'
    WHEN
      country IN (
        'EIRE', 'Germany', 'France', 'Netherlands', 'Spain', 'Portugal',
        'Italy', 'Belgium', 'Austria', 'Finland', 'Cyprus', 'Malta', 'Greece')
      THEN 'Eurozone'
    WHEN
      country IN (
        'Switzerland', 'Norway', 'Sweden', 'Denmark', 'Poland',
        'Czech Republic', 'Iceland', 'Channel Islands', 'European Community',
        'Lithuania')
      THEN 'Other Europe'
    WHEN country = 'Unspecified' OR country IS NULL THEN 'Unknown'
    ELSE 'Rest of World'
    END
    AS region
FROM
  (
    SELECT DISTINCT country
    FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail`
    WHERE country IS NOT NULL
  );
