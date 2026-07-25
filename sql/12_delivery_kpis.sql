/*
============================================================
Business SQL #7
Question:
What are the overall delivery performance KPIs?
============================================================
*/

SELECT

    COUNT(*) AS delivered_orders,

    ROUND(
        AVG(
            JULIANDAY(order_delivered_customer_date) -
            JULIANDAY(order_purchase_timestamp)
        ),
        2
    ) AS avg_delivery_days,

    ROUND(
        AVG(
            JULIANDAY(order_estimated_delivery_date) -
            JULIANDAY(order_purchase_timestamp)
        ),
        2
    ) AS avg_estimated_delivery_days

FROM vw_orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;