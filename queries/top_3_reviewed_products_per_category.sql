WITH RankedProducts AS (
  SELECT
    product_id,
    product_name,
    category,
    rating_count,
    RANK() OVER (PARTITION BY category ORDER BY rating_count DESC) AS rank_within_category
  FROM Amazon_Sales
  WHERE rating_count IS NOT NULL
)
SELECT *
FROM RankedProducts
WHERE rank_within_category <= 3
ORDER BY category, rank_within_category;
