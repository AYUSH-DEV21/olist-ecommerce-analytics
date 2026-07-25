/*
============================================================
Business SQL #5
Question:
Which states generate the highest revenue per customer?
============================================================
*/

SELECT

    customer_state,

    COUNT(DISTINCT customer_unique_id) AS customers,

    ROUND(
        SUM(total_payment),
        2
    ) AS revenue,

    ROUND(

        SUM(total_payment)

        /

        COUNT(DISTINCT customer_unique_id),

        2

    ) AS revenue_per_customer

FROM vw_customer_orders

GROUP BY customer_state

ORDER BY revenue_per_customer DESC;