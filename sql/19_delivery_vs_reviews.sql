/*
============================================================
Business SQL #8
Question:
How does delivery time relate to customer review scores?
============================================================
*/

SELECT

    r.review_score,

    ROUND(

        AVG(

            JULIANDAY(o.order_delivered_customer_date)

            -

            JULIANDAY(o.order_purchase_timestamp)

        ),

        2

    ) AS average_delivery_days,

    COUNT(*) AS total_reviews

FROM reviews r

JOIN orders o

    ON r.order_id = o.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL

GROUP BY r.review_score

ORDER BY r.review_score;