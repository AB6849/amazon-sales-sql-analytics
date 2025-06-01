WITH Cleaned AS (
  SELECT
    product_name,
    category,
    REPLACE(REPLACE(discounted_price, '₹', ''), ',', '') AS discounted_price_raw,
    REPLACE(REPLACE(actual_price, '₹', ''), ',', '') AS actual_price_raw,
    REPLACE(discount_percentage, '%', '') AS discount_pct_raw,
    rating
  FROM Amazon_Sales
  WHERE 
    -- Filter out rows where price or discount fields contain junk
    REPLACE(REPLACE(discounted_price, '₹', ''), ',', '') ~ '^[0-9.]+$' AND
    REPLACE(REPLACE(actual_price, '₹', ''), ',', '') ~ '^[0-9.]+$' AND
    REPLACE(discount_percentage, '%', '') ~ '^[0-9.]+$' AND
    rating ~ '^[0-9.]+$'
),
Typed AS (
  SELECT
    product_name,
    category,
    CAST(discounted_price_raw AS DOUBLE) AS discounted_price,
    CAST(actual_price_raw AS DOUBLE) AS actual_price,
    CAST(discount_pct_raw AS DOUBLE) AS discount_percentage,
    CAST(rating AS DOUBLE) AS rating
  FROM Cleaned
  WHERE discount_pct_raw != '' AND rating != ''
)
SELECT *,
  ROUND(actual_price - discounted_price, 2) AS difference
FROM Typed
WHERE discount_percentage > 40 AND rating < 3
ORDER BY difference DESC;
