/*
============================================================
Business SQL #7
Question:
Which sellers have the longest average delivery times?
(Considering sellers with at least 20 delivered orders)
============================================================
*/

SELECT

    p.seller_id,

    COUNT(DISTINCT p.order_id) AS delivered_orders,

    ROUND(

        AVG(

            JULIANDAY(o.order_delivered_customer_date) -

            JULIANDAY(o.order_purchase_timestamp)

        ),

        2

    ) AS avg_delivery_days

FROM vw_product_sales p

JOIN vw_orders o

    ON p.order_id = o.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL

GROUP BY p.seller_id

HAVING COUNT(DISTINCT p.order_id) >= 20

ORDER BY avg_delivery_days DESC;