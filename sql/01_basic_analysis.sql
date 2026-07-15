-- IBM HR Analytics
-- 基本集計：社員数、離職状況、離職率、平均年齢、平均月収


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
    COUNTIF(Attrition = 'Yes') AS attrition_count,
    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Attrition = 'Yes'),
            COUNT(*)
        ) * 100,
        2
    ) AS attrition_rate_percent
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`;


-- 4. 全体の平均年齢・平均月収
SELECT
    ROUND(AVG(Age), 1) AS avg_age,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`;
