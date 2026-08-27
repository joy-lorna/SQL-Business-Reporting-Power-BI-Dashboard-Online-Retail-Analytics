SELECT
  COUNTIF(p.product_key IS NULL) AS missing_product_keys,
  COUNTIF(c.country_key IS NULL) AS missing_country_keys,
  COUNTIF(d.date_key IS NULL) AS missing_date_keys
FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.fact_sales` f
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_product` p
  ON f.product_key = p.product_key
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_country` c
  ON f.country_key = c.country_key
LEFT JOIN `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_date` d
  ON f.date_key = d.date_key;

