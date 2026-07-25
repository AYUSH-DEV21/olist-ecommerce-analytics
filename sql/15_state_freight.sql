/*
============================================================
Business SQL #7
Question:
Which customer states incur the highest freight costs?
============================================================
*/

SELECT

    customer_state,

    ROUND(

        AVG(freight_value),

        2

    ) AS avg_freight_cost,

    ROUND(

        SUM(freight_value),

        2

    ) AS total_freight_cost

FROM vw_product_sales

GROUP BY customer_state

ORDER BY avg_freight_cost DESC;