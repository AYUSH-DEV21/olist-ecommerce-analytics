/*
============================================================
Business SQL #6
Question:
What percentage of total merchandise value is contributed by each seller?
============================================================
*/

WITH seller_summary AS (

    SELECT

        seller_id,

        SUM(price) AS revenue

    FROM vw_product_sales

    GROUP BY seller_id

)

SELECT

    seller_id,

    ROUND(revenue,2) AS revenue,

    ROUND(

        revenue * 100.0

        /

        SUM(revenue) OVER(),

        2

    ) AS revenue_share_pct

FROM seller_summary

ORDER BY revenue DESC;