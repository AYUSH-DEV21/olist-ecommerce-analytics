SELECT

    category,

    COUNT(*) AS items_sold,

    ROUND(
        SUM(price),
        2
    ) AS merchandise_value,

    ROUND(
        AVG(price),
        2
    ) AS average_price,

    ROUND(
        SUM(freight_value),
        2
    ) AS total_freight,

    COUNT(DISTINCT order_id) AS unique_orders

FROM vw_product_sales

GROUP BY category

ORDER BY merchandise_value DESC;

-----------------------------------------------------------------------------

WITH category_summary AS (

    SELECT

        category,

        SUM(price) AS revenue

    FROM vw_product_sales

    GROUP BY category

)

SELECT

    category,

    ROUND(revenue,2) AS revenue,

    ROUND(

        revenue
        *100.0
        /

        SUM(revenue)
        OVER(),

        2

    ) AS revenue_share_pct

FROM category_summary

ORDER BY revenue DESC;

-----------------------------------------------------------------------------

WITH category_summary AS (

    SELECT

        category,

        SUM(price) AS revenue

    FROM vw_product_sales

    GROUP BY category

)

SELECT

    category,

    ROUND(revenue,2) AS revenue,

    ROUND(

        revenue
        *100.0

        /

        SUM(revenue)
        OVER(),

        2

    ) AS revenue_share,

    ROUND(

        SUM(revenue)
        OVER(

            ORDER BY revenue DESC

        )

        *100.0

        /

        SUM(revenue)
        OVER(),

        2

    ) AS cumulative_share

FROM category_summary

ORDER BY revenue DESC;

-------------------------------------------------------------------------------------

WITH category_summary AS (

    SELECT

        category,

        SUM(price) AS revenue

    FROM vw_product_sales

    GROUP BY category

)

SELECT

    RANK() OVER(
        ORDER BY revenue DESC
    ) AS revenue_rank,

    category,

    ROUND(revenue,2) AS revenue

FROM category_summary

ORDER BY revenue DESC;