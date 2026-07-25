/*
============================================================
Business SQL #10
Question:
How do the key business KPIs trend month over month?
============================================================
*/

SELECT

    strftime('%Y-%m', order_purchase_timestamp) AS month,

    ROUND(
        SUM(total_payment),
        2
    ) AS revenue,

    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT customer_unique_id) AS total_customers,

    ROUND(
        AVG(total_payment),
        2
    ) AS average_order_value

FROM vw_customer_orders

GROUP BY month

ORDER BY month;