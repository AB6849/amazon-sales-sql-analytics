WITH CleanedData AS (
  SELECT
    category,
    product_name,
    CAST(rating AS DOUBLE) AS rating
  FROM Amazon_Sales
  WHERE 
    rating IS NOT NULL AND
    rating != '' AND
    rating ~ '^[0-9.]+$'  -- keeps only numeric ratings
),
CategoryAvg AS (
  SELECT
    category,
    AVG(rating) AS avg_rating
  FROM CleanedData
  GROUP BY category
),
Deviants AS (
  SELECT
    c.category,
    c.product_name,
    c.rating,
    ca.avg_rating,
    c.rating - ca.avg_rating AS deviation
  FROM CleanedData c
  JOIN CategoryAvg ca ON c.category = ca.category
)
SELECT *
FROM Deviants
WHERE ABS(deviation) >= 1.0  -- threshold: deviation of 1.0 or more
ORDER BY deviation DESC;
