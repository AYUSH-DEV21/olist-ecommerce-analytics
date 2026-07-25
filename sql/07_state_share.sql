/*
============================================================
Business SQL #5
Question:
What percentage of total revenue does each state contribute?
============================================================
*/

WITH state_summary AS (

    SELECT

        customer_state,

        SUM(total_payment) AS revenue

    FROM vw_customer_orders

    GROUP BY customer_state

)

SELECT

    customer_state,

    ROUND(
        revenue,
        2
    ) AS revenue,

    ROUND(

        revenue * 100.0

        /

        SUM(revenue) OVER(),

        2

    ) AS revenue_share_pct

FROM state_summary

ORDER BY revenue DESC;