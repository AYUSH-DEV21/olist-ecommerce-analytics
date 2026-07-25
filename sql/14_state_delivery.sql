/*
============================================================
Business SQL #7
Question:
How does average delivery time vary across customer states?
============================================================
*/

SELECT

    customer_state,

    COUNT(*) AS delivered_orders,

    ROUND(

        AVG(

            JULIANDAY(order_delivered_customer_date) -

            JULIANDAY(order_purchase_timestamp)

        ),

        2

    ) AS avg_delivery_days

FROM vw_orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL

GROUP BY customer_state

ORDER BY avg_delivery_days DESC;