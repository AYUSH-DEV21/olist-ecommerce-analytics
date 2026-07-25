/*
============================================================
Business SQL #8
Question:
What is the overall customer satisfaction based on review scores?
============================================================
*/

SELECT

    COUNT(*) AS total_reviews,

    ROUND(
        AVG(review_score),
        2
    ) AS average_rating,

    MIN(review_score) AS minimum_rating,

    MAX(review_score) AS maximum_rating

FROM reviews;