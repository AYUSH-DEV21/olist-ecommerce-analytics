WITH monthly_sales AS (

    SELECT

        strftime('%Y-%m', order_purchase_timestamp) AS order_month,

        SUM(total_payment) AS revenue

    FROM vw_customer_orders

    GROUP BY order_month

)

SELECT

    order_month,

    ROUND(revenue,2) AS revenue,

    ROUND(
        LAG(revenue) OVER (
            ORDER BY order_month
        ),
        2
    ) AS previous_month,

    ROUND(

        (
            revenue -
            LAG(revenue) OVER (
                ORDER BY order_month
            )
        )

        /

        LAG(revenue) OVER (
            ORDER BY order_month
        )

        *100,

        2

    ) AS mom_growth_pct

FROM monthly_sales;