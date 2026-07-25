/*
============================================================
Business SQL #7
Question:
What percentage of delivered orders arrived on or before
the estimated delivery date?
============================================================
*/

SELECT

    COUNT(*) AS delivered_orders,

    SUM(

        CASE

            WHEN order_delivered_customer_date <= order_estimated_delivery_date

            THEN 1

            ELSE 0

        END

    ) AS on_time_orders,

    ROUND(

        100.0 *

        SUM(

            CASE

                WHEN order_delivered_customer_date <= order_estimated_delivery_date

                THEN 1

                ELSE 0

            END

        )

        /

        COUNT(*),

        2

    ) AS on_time_percentage

FROM vw_orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;