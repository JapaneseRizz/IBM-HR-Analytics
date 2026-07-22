-- ============================================
-- 06_summary.sql
-- 複数条件を組み合わせて離職傾向を分析する
-- ============================================

-- 1. 残業有無 × 勤続年数別の離職状況
WITH employee_grouped AS (
    SELECT
        Attrition,
        OverTime,
        CASE
            WHEN YearsAtCompany < 3 THEN '3年未満'
            WHEN YearsAtCompany < 5 THEN '3～4年'
            WHEN YearsAtCompany < 10 THEN '5～9年'
            ELSE '10年以上'
        END AS years_group,
        CASE
            WHEN YearsAtCompany < 3 THEN 1
            WHEN YearsAtCompany < 5 THEN 2
            WHEN YearsAtCompany < 10 THEN 3
            ELSE 4
        END AS years_group_order
    FROM
        `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
)

SELECT
    OverTime,
    years_group,
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
    employee_grouped
GROUP BY
    OverTime,
    years_group,
    years_group_order
ORDER BY
    OverTime,
    years_group_order;


-- 2. 残業有無 × 仕事満足度別の離職状況
SELECT
    OverTime,
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
    OverTime,
    JobSatisfaction
ORDER BY
    OverTime,
    JobSatisfaction;


-- 3. 部署 × 残業有無別の離職状況
SELECT
    Department,
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
    Department,
    OverTime
ORDER BY
    attrition_rate_percent DESC,
    total_employees DESC;


-- 4. 全体平均と比較した高離職率セグメントのランキング
WITH company_summary AS (
    SELECT
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) AS overall_attrition_rate
    FROM
        `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
),

segment_summary AS (
    SELECT
        Department,
        JobRole,
        OverTime,
        COUNT(*) AS total_employees,
        COUNTIF(Attrition = 'Yes') AS attrition_count,
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) AS attrition_rate
    FROM
        `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
    GROUP BY
        Department,
        JobRole,
        OverTime
),

filtered_segments AS (
    SELECT
        s.Department,
        s.JobRole,
        s.OverTime,
        s.total_employees,
        s.attrition_count,
        s.attrition_rate,
        c.overall_attrition_rate,
        s.attrition_rate - c.overall_attrition_rate
            AS difference_from_overall
    FROM
        segment_summary AS s
    CROSS JOIN
        company_summary AS c
    WHERE
        s.total_employees >= 10
)

SELECT
    Department,
    JobRole,
    OverTime,
    total_employees,
    attrition_count,
    ROUND(attrition_rate * 100, 2)
        AS attrition_rate_percent,
    ROUND(overall_attrition_rate * 100, 2)
        AS overall_attrition_rate_percent,
    ROUND(difference_from_overall * 100, 2)
        AS difference_from_overall_percent,
    RANK() OVER (
        ORDER BY attrition_rate DESC
    ) AS risk_rank
FROM
    filtered_segments
ORDER BY
    risk_rank,
    total_employees DESC;


-- 5. 各部署で離職率が最も高いセグメント
WITH segment_summary AS (
    SELECT
        Department,
        JobRole,
        OverTime,
        COUNT(*) AS total_employees,
        COUNTIF(Attrition = 'Yes') AS attrition_count,
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) AS attrition_rate
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
    ROUND(attrition_rate * 100, 2)
        AS attrition_rate_percent
FROM
    segment_summary
WHERE
    total_employees >= 10
QUALIFY
    ROW_NUMBER() OVER (
        PARTITION BY Department
        ORDER BY
            attrition_rate DESC,
            total_employees DESC
    ) = 1
ORDER BY
    attrition_rate_percent DESC;
