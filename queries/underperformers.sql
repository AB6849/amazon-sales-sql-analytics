WITH CleanedRatings AS (
  SELECT
    product_id,
    product_name,
    CAST(rating AS DOUBLE) AS rating,
    CAST(rating_count AS INTEGER) AS rating_count
  FROM Amazon_Sales
  WHERE
    rating IS NOT NULL AND rating != '' AND rating ~ '^[0-9.]+$' AND
    rating_count IS NOT NULL AND rating_count != '' AND rating_count ~ '^[0-9]+$'
),
ProductStats AS (
  SELECT
    product_id,
    product_name,
    AVG(rating) AS avg_rating,
    MAX(rating_count) AS max_rating_count
  FROM CleanedRatings
  GROUP BY product_id, product_name
)
SELECT
  product_id,
  product_name,
  ROUND(avg_rating, 2) AS avg_rating,
  max_rating_count
FROM ProductStats
WHERE max_rating_count > 5   -- Only products with decent number of ratings
  AND avg_rating < 3.0       -- Products rated below 3 stars (poor rating)
ORDER BY avg_rating ASC, max_rating_count DESC
LIMIT 10;
