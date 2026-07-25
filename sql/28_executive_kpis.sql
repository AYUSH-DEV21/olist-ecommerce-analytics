/*
============================================================
Business SQL #10
Question:
What are the key marketplace KPIs?
============================================================
*/

SELECT

    ROUND(SUM(total_payment),2) AS total_revenue,

    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT customer_unique_id) AS total_customers,

    ROUND(
        AVG(total_payment),
        2
    ) AS average_order_value,

    ROUND(

        SUM(total_payment)

        /

        COUNT(DISTINCT customer_unique_id),

        2

    ) AS revenue_per_customer

FROM vw_customer_orders;