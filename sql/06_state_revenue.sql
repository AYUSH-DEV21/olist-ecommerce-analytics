/*
============================================================
Business SQL #5
Question:
Which states generate the highest revenue, order volume,
and customer base?
============================================================
*/

SELECT

    customer_state,

    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT customer_unique_id) AS unique_customers,

    ROUND(
        SUM(total_payment),
        2
    ) AS revenue,

    ROUND(
        AVG(total_payment),
        2
    ) AS average_order_value

FROM vw_customer_orders

GROUP BY customer_state

ORDER BY revenue DESC;