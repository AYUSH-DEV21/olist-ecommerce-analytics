/*
============================================================
Business SQL #8
Question:
What is the distribution of customer review scores?
============================================================
*/

SELECT

    review_score,

    COUNT(*) AS total_reviews,

    ROUND(

        COUNT(*) * 100.0

        /

        SUM(COUNT(*)) OVER(),

        2

    ) AS percentage

FROM reviews

GROUP BY review_score

ORDER BY review_score;