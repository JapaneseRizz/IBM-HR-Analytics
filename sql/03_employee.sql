-- ============================================
-- 03_employee.sql
-- 社員属性ごとの離職状況を確認する
-- ============================================

-- 1. 年代別の離職状況
SELECT
    CASE
        WHEN Age < 30 THEN '20代以下'
        WHEN Age < 40 THEN '30代'
        WHEN Age < 50 THEN '40代'
        ELSE '50代以上'
    END AS age_group,
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    age_group
ORDER BY
    CASE age_group
        WHEN '20代以下' THEN 1
        WHEN '30代' THEN 2
        WHEN '40代' THEN 3
        WHEN '50代以上' THEN 4
    END;


-- 2. 性別の離職状況
SELECT
    Gender,
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    Gender
ORDER BY
    attrition_rate_percent DESC;


-- 3. 婚姻状況別の離職状況
SELECT
    MaritalStatus,
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    MaritalStatus
ORDER BY
    attrition_rate_percent DESC;


-- 4. 出張頻度別の離職状況
SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    BusinessTravel
ORDER BY
    attrition_rate_percent DESC;
