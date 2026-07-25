/*
============================================================
Business SQL #6
Question:
Which sellers have the highest average order value?
============================================================
*/

SELECT

    seller_id,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(SUM(price),2) AS merchandise_value,

    ROUND(

        SUM(price)

        /

        COUNT(DISTINCT order_id),

        2

    ) AS average_order_value

FROM vw_product_sales

GROUP BY seller_id

ORDER BY average_order_value DESC;