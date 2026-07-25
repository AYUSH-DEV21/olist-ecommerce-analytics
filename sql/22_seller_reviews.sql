/*
============================================================
Business SQL #8
Question:
Which sellers receive the highest average customer ratings?
(Considering sellers with at least 20 reviewed orders)
============================================================
*/

SELECT

    p.seller_id,

    ROUND(

        AVG(r.review_score),

        2

    ) AS average_rating,

    COUNT(DISTINCT r.order_id) AS reviewed_orders

FROM reviews r

JOIN vw_product_sales p

    ON r.order_id = p.order_id

GROUP BY p.seller_id

HAVING COUNT(DISTINCT r.order_id) >= 20

ORDER BY average_rating DESC;