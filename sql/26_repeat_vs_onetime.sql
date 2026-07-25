/*
============================================================
Business SQL #9
Question:
How do one-time and repeat customers compare in terms of
customer count and revenue contribution?
============================================================
*/

WITH customer_summary AS (

    SELECT

        customer_unique_id,

        COUNT(DISTINCT order_id) AS total_orders,

        SUM(total_payment) AS revenue

    FROM vw_customer_orders

    GROUP BY customer_unique_id

)

SELECT

    CASE

        WHEN total_orders = 1 THEN 'One-Time'

        ELSE 'Repeat'

    END AS customer_type,

    COUNT(*) AS customers,

    ROUND(
        SUM(revenue),
        2
    ) AS total_revenue,

    ROUND(
        AVG(revenue),
        2
    ) AS average_customer_value

FROM customer_summary

GROUP BY customer_type;s