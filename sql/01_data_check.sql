-- IBM HR Analytics データセットの基本確認

-- 1. 総レコード数
SELECT
    COUNT(*) AS total_records
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`;


-- 2. 主要項目の基本統計
SELECT
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    AVG(Age) AS avg_age,
    MIN(MonthlyIncome) AS min_monthly_income,
    MAX(MonthlyIncome) AS max_monthly_income,
    AVG(MonthlyIncome) AS avg_monthly_income
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`;


-- 3. 離職者数と在籍者数
SELECT
    Attrition,
    COUNT(*) AS employee_count
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    Attrition
ORDER BY
    employee_count DESC;


-- 4. 部署ごとの社員数
SELECT
    Department,
    COUNT(*) AS employee_count
FROM
    `sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
GROUP BY
    Department
ORDER BY
    employee_count DESC;
