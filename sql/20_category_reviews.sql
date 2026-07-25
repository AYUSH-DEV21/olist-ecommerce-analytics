/*
============================================================
Business SQL #8
Question:
Which product categories receive the highest customer ratings?
(Considering categories with at least 50 reviews)
============================================================
*/

SELECT

    p.category,

    ROUND(

        AVG(r.review_score),

        2

    ) AS average_rating,

    COUNT(*) AS total_reviews

FROM reviews r

JOIN vw_product_sales p

    ON r.order_id = p.order_id

GROUP BY p.category

HAVING COUNT(*) >= 50

ORDER BY average_rating DESC;