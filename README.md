# Amazon Sales SQL Analytics

This repository contains advanced SQL queries analyzing the Amazon Sales dataset by KARKAVELRAJA J (from Kaggle). These queries extract valuable business insights on product performance, customer ratings, discounts, and review authenticity.

## Dataset Schema

| Column             | Description                                  |
|--------------------|----------------------------------------------|
| product_id         | Product ID                                  |
| product_name       | Name of the Product                         |
| category           | Product Category                            |
| discounted_price   | Discounted Price                            |
| actual_price       | Actual Price                               |
| discount_percentage| Discount Percentage (e.g. '64%')           |
| rating            | Product Rating (numeric)                    |
| rating_count      | Number of Ratings                           |
| about_product     | Product Description                         |
| user_id           | User ID who reviewed                        |
| user_name         | User Name who reviewed                      |
| review_id         | Review ID                                   |
| review_title      | Short Review Title                          |
| review_content    | Long Review Content                         |
| img_link          | Product Image URL                           |
| product_link      | Official Product Link                       |

---

## Queries Overview

1. **top_3_reviewed_products_per_category.sql**  
   Finds the top 3 most reviewed products for each category.

2. **high_discount_low_rating_products.sql**  
   Identifies products with high discounts but low ratings — useful for spotting ineffective discount strategies.

3. **avg_rating_by_category_vs_rating.sql**  
   Detects products whose ratings deviate significantly from the category average.

4. **most_loved_products.sql**  
   Lists the top 10 products trusted by customers based on rating quality and number of ratings.

5. **underperformers.sql**  
   Finds products with many reviews but poor ratings (below 3 stars), indicating possible quality issues.

6. **category_wise_discount_effectiveness.sql**  
   Analyzes discount impact by category, comparing average discounts and average ratings.

---

## How to Use

- Import the `amazon.csv` dataset into your SQL environment.
- Run individual `.sql` query files to explore different insights.
- Modify queries for your custom analysis or to fit your SQL dialect.

---

## About

Created by Amal Bobby as a personal project to demonstrate advanced SQL analysis skills using real-world e-commerce data.
