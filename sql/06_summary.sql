-- ============================================
-- 06_summary.sql
-- 複数条件を組み合わせた離職傾向を分析する
-- ============================================

-- 1. 残業 × 勤続年数別の離職率
SELECT
    OverTime,
    CASE
        WHEN YearsAtCompany < 3 THEN '3年未満'
        WHEN YearsAtCompany < 5 THEN '3～4年'
        WHEN YearsAtCompany < 10 THEN '5～9年'
        ELSE '10年以上'
    END AS years_group,
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(COUNTIF(Attrition = 'Yes'), COUNT(*)) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    OverTime,
    years_group
ORDER BY
    OverTime,
    years_group;


-- 2. 残業 × 仕事満足度別の離職率
SELECT
    OverTime,
    JobSatisfaction,
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(COUNTIF(Attrition = 'Yes'), COUNT(*)) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    OverTime,
    JobSatisfaction
ORDER BY
    OverTime,
    JobSatisfaction;


-- 3. 部署 × 残業別の離職率
SELECT
    Department,
    OverTime,
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(COUNTIF(Attrition = 'Yes'), COUNT(*)) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    Department,
    OverTime
ORDER BY
    attrition_rate_percent DESC;


-- 4. 離職率の高い組み合わせランキング
WITH attrition_summary AS (
    SELECT
        Department,
        JobRole,
        OverTime,
        COUNT(*) AS total_employees,
        COUNTIF(Attrition = 'Yes') AS attrition_count,
        ROUND(
            SAFE_DIVIDE(COUNTIF(Attrition = 'Yes'), COUNT(*)) * 100,
            2
        ) AS attrition_rate_percent
    FROM
        `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
    GROUP BY
        Department,
        JobRole,
        OverTime
)

SELECT
    Department,
    JobRole,
    OverTime,
    total_employees,
    attrition_count,
    attrition_rate_percent
FROM
    attrition_summary
WHERE
    total_employees >= 10
ORDER BY
    attrition_rate_percent DESC,
    total_employees DESC;
