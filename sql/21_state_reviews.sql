/*
============================================================
Business SQL #8
Question:
How does customer satisfaction vary across states?
(Considering states with at least 100 reviews)
============================================================
*/

SELECT

    o.customer_state,

    ROUND(

        AVG(r.review_score),

        2

    ) AS average_rating,

    COUNT(*) AS total_reviews

FROM reviews r

JOIN vw_orders o

    ON r.order_id = o.order_id

GROUP BY o.customer_state

HAVING COUNT(*) >= 100

ORDER BY average_rating DESC;