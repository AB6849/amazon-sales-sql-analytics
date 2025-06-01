WITH CleanedReviews AS (
  SELECT
    product_id,
    product_name,
    CAST(rating AS DOUBLE) AS rating,
    CAST(rating_count AS INTEGER) AS rating_count
  FROM Amazon_Sales
  WHERE 
    rating IS NOT NULL AND
    rating != '' AND
    rating ~ '^[0-9.]+$' AND
    rating_count IS NOT NULL AND
    rating_count != '' AND
    rating_count ~ '^[0-9]+$'
),
ProductScores AS (
  SELECT
    product_id,
    product_name,
    AVG(rating) AS avg_rating,
    MAX(rating_count) AS max_rating_count,
    -- A simple score: average rating multiplied by log of number of ratings
    AVG(rating) * LOG(1 + MAX(rating_count)) AS trust_score
  FROM CleanedReviews
  GROUP BY product_id, product_name
)
SELECT
  product_id,
  product_name,
  ROUND(avg_rating, 2) AS avg_rating,
  max_rating_count,
  ROUND(trust_score, 2) AS trust_score
FROM ProductScores
ORDER BY trust_score DESC
LIMIT 10;
