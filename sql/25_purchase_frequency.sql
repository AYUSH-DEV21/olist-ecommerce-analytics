/*
============================================================
Business SQL #9
Question:
What is the purchase frequency distribution of customers?
============================================================
*/

SELECT

    total_orders,

    COUNT(*) AS customers,

    ROUND(

        COUNT(*) * 100.0

        /

        SUM(COUNT(*)) OVER(),

        2

    ) AS customer_percentage

FROM (

    SELECT

        customer_unique_id,

        COUNT(DISTINCT order_id) AS total_orders

    FROM vw_customer_orders

    GROUP BY customer_unique_id

)

GROUP BY total_orders

ORDER BY total_orders;