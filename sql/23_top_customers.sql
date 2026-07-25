/*
============================================================
Business SQL #9
Question:
Who are the highest-value customers based on total lifetime spending?
============================================================
*/

SELECT

    customer_unique_id,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(
        SUM(total_payment),
        2
    ) AS lifetime_value,

    ROUND(
        AVG(total_payment),
        2
    ) AS average_order_value

FROM vw_customer_orders

GROUP BY customer_unique_id

ORDER BY lifetime_value DESC

LIMIT 20;