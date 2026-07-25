/*
============================================================
Business SQL #9
Question:
How many new customers are acquired each month?
============================================================
*/

SELECT

    acquisition_month,

    COUNT(*) AS new_customers

FROM (

    SELECT

        customer_unique_id,

        strftime(
            '%Y-%m',
            MIN(order_purchase_timestamp)
        ) AS acquisition_month

    FROM vw_customer_orders

    GROUP BY customer_unique_id

)

GROUP BY acquisition_month

ORDER BY acquisition_month;