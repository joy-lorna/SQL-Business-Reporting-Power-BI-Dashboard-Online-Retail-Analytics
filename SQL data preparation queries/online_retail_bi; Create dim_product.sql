CREATE OR REPLACE TABLE `project-f57ec015-00f5-4842-84d.online_retail_bi.dim_product`
AS
WITH
  ranked_descriptions AS (
    SELECT
      stock_code,
      description,
      COUNT(*) AS description_count,
      ROW_NUMBER()
        OVER (PARTITION BY stock_code ORDER BY COUNT(*) DESC, description) AS rn
    FROM `project-f57ec015-00f5-4842-84d.online_retail_bi.stg_online_retail`
    WHERE stock_code IS NOT NULL
    GROUP BY stock_code, description
  )
SELECT
  FARM_FINGERPRINT(stock_code) AS product_key,
  stock_code,
  description,
  CASE
    WHEN
      stock_code IN (
        'POST', 'DOT', 'M', 'm', 'D', 'S', 'ADJUST', 'ADJUST2', 'AMAZONFEE',
        'CRUK', 'PADS', 'B', 'GIFT', 'DCGSSGIRL', 'DCGSSBOY', 'DCGSLBOY',
        'DCGSLGIRL', 'C2', 'BANK CHARGES', 'TEST001', 'TEST002')
      THEN 'Non-merchandise fees and adjustments'
    WHEN
      UPPER(description) LIKE '%CHRISTMAS%'
      OR UPPER(description) LIKE '%XMAS%'
      THEN 'Christmas and seasonal'
    WHEN
      UPPER(description) LIKE '%LIGHT%'
      OR UPPER(description) LIKE '%CANDLE%'
      OR UPPER(description) LIKE '%LANTERN%'
      THEN 'Lighting and candles'
    WHEN UPPER(description) LIKE '%BAG%' OR UPPER(description) LIKE '%BOX%'
      THEN 'Bags and storage'
    WHEN
      UPPER(description) LIKE '%MUG%'
      OR UPPER(description) LIKE '%CUP%'
      OR UPPER(description) LIKE '%KITCHEN%'
      OR UPPER(description) LIKE '%TEA%'
      OR UPPER(description) LIKE '%CAKE%'
      THEN 'Kitchen and dining'
    WHEN
      UPPER(description) LIKE '%CARD%'
      OR UPPER(description) LIKE '%PAPER%'
      OR UPPER(description) LIKE '%GIFT%'
      OR UPPER(description) LIKE '%WRAP%'
      THEN 'Stationery and gifts'
    WHEN
      UPPER(description) LIKE '%NECKLACE%'
      OR UPPER(description) LIKE '%BRACELET%'
      OR UPPER(description) LIKE '%EARRING%'
      OR UPPER(description) LIKE '%RING%'
      THEN 'Jewellery and accessories'
    WHEN
      UPPER(description) LIKE '%TOY%'
      OR UPPER(description) LIKE '%GAME%'
      OR UPPER(description) LIKE '%DOLL%'
      THEN 'Toys and games'
    WHEN
      UPPER(description) LIKE '%HEART%'
      OR UPPER(description) LIKE '%FRAME%'
      OR UPPER(description) LIKE '%CUSHION%'
      OR UPPER(description) LIKE '%CLOCK%'
      OR UPPER(description) LIKE '%MIRROR%'
      OR UPPER(description) LIKE '%DOORMAT%'
      THEN 'Home and living'
    ELSE 'Other or uncategorised'
    END
    AS category,
  stock_code IN (
    'POST', 'DOT', 'M', 'm', 'D', 'S', 'ADJUST', 'ADJUST2', 'AMAZONFEE', 'CRUK',
    'PADS', 'B', 'GIFT', 'DCGSSGIRL', 'DCGSSBOY', 'DCGSLBOY', 'DCGSLGIRL', 'C2',
    'BANK CHARGES', 'TEST001', 'TEST002')
    AS is_adjustment
FROM ranked_descriptions
WHERE rn = 1;
