-- ============================================
-- 01_basic.sql
-- 全体の離職状況を確認する
-- ============================================

SELECT
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = FALSE) AS active_employees,
    COUNTIF(Attrition = TRUE) AS attrition_count,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Attrition = TRUE),
            COUNT(*)
        ) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`;
