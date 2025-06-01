WITH CleanedData AS (
  SELECT
    category,
    CAST(REPLACE(discount_percentage, '%', '') AS DOUBLE) AS discount_percentage,
    CAST(rating AS DOUBLE) AS rating
  FROM Amazon_Sales
  WHERE
    discount_percentage IS NOT NULL
    AND discount_percentage != ''
    AND rating IS NOT NULL
    AND rating != ''
    AND rating ~ '^[0-9.]+$'
),
CategoryDiscountStats AS (
  SELECT
    category,
    AVG(discount_percentage) AS avg_discount,
    AVG(rating) AS avg_rating,
    COUNT(*) AS product_count
  FROM CleanedData
  GROUP BY category
)
SELECT
  category,
  ROUND(avg_discount, 2) AS avg_discount_percentage,
  ROUND(avg_rating, 2) AS avg_rating,
  product_count
FROM CategoryDiscountStats
ORDER BY avg_discount_percentage DESC;
