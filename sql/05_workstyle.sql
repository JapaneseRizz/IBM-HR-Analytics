-- ============================================
-- 05_workstyle.sql
-- 働き方・職場環境ごとの離職状況を確認する
-- ============================================

-- 1. 残業有無別の離職状況
SELECT
    OverTime,
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
    OverTime
ORDER BY
    attrition_rate_percent DESC;


-- 2. 仕事満足度別の離職状況
SELECT
    JobSatisfaction,
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
    JobSatisfaction
ORDER BY
    JobSatisfaction;


-- 3. 職場環境満足度別の離職状況
SELECT
    EnvironmentSatisfaction,
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
    EnvironmentSatisfaction
ORDER BY
    EnvironmentSatisfaction;


-- 4. ワークライフバランス別の離職状況
SELECT
    WorkLifeBalance,
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
    WorkLifeBalance
ORDER BY
    WorkLifeBalance;


-- 5. 仕事への関与度別の離職状況
SELECT
    JobInvolvement,
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
    JobInvolvement
ORDER BY
    JobInvolvement;
