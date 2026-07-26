-- ============================================
-- 04_salary.sql
-- 給与・勤続年数ごとの離職状況を確認する
-- ============================================

-- 1. 給与帯別の離職状況
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN '3,000未満'
        WHEN MonthlyIncome < 6000 THEN '3,000～5,999'
        WHEN MonthlyIncome < 9000 THEN '6,000～8,999'
        WHEN MonthlyIncome < 12000 THEN '9,000～11,999'
        ELSE '12,000以上'
    END AS income_group,
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
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    income_group
ORDER BY
    CASE income_group
        WHEN '3,000未満' THEN 1
        WHEN '3,000～5,999' THEN 2
        WHEN '6,000～8,999' THEN 3
        WHEN '9,000～11,999' THEN 4
        WHEN '12,000以上' THEN 5
    END;

-- 2. 勤続年数別の離職状況
SELECT
    CASE
        WHEN YearsAtCompany < 3 THEN '3年未満'
        WHEN YearsAtCompany < 5 THEN '3～4年'
        WHEN YearsAtCompany < 10 THEN '5～9年'
        WHEN YearsAtCompany < 15 THEN '10～14年'
        ELSE '15年以上'
    END AS years_group,
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
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    years_group
ORDER BY
    CASE years_group
        WHEN '3年未満' THEN 1
        WHEN '3～4年' THEN 2
        WHEN '5～9年' THEN 3
        WHEN '10～14年' THEN 4
        WHEN '15年以上' THEN 5
    END;


-- 3. 昇進からの経過年数別の離職状況
SELECT
    YearsSinceLastPromotion,
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
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    YearsSinceLastPromotion
ORDER BY
    YearsSinceLastPromotion;


-- 4. 離職者・在籍者の平均月収比較
SELECT
    Attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    Attrition
ORDER BY
    Attrition;
