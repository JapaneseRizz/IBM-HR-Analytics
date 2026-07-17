-- ============================================
-- 01_basic.sql
-- 全体の離職状況を確認する
-- ============================================

-- 1. 総社員数
SELECT
    COUNT(*) AS total_employees
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`;


-- 2. 離職状況別の社員数
SELECT
    Attrition,
    COUNT(*) AS employee_count
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    Attrition
ORDER BY
    employee_count DESC;


-- 3. 全体離職率
SELECT
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = true) AS attrition_count,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Attrition = true),
            COUNT(*)
        ) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`;
