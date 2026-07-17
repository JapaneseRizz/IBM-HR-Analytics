# IBM HR Analytics - Employee Attrition Analysis

## 概要

IBM HR Analytics Employee Attrition & Performance データセットを用いて、
従業員の離職状況を分析したSQL・Tableauのポートフォリオです。

---

## 使用技術

- SQL(BigQuery)
- Tableau
- GitHub

---

## 分析目的

以下の観点から離職状況を分析しました。

- 全体の離職状況の把握
- 部署・職種ごとの離職率比較
- 社員属性と離職率の比較
- 給与・勤続年数と離職率の比較
- 勤務環境・満足度と離職率の比較
- 複数条件を組み合わせた離職傾向の分析

---

## ディレクトリ構成

```text
IBM-HR-Analytics/
├── README.md
├── sql/
│   ├── 01_basic.sql
│   ├── 02_department.sql
│   ├── 03_employee.sql
│   ├── 04_salary.sql
│   ├── 05_workstyle.sql
│   ├── 06_summary.sql
│   └── 07_tableau.sql
└── tableau/
    └── dashboard.png
```

---

## SQL一覧

| ファイル | 内容 |
|----------|------|
| 01_basic.sql | 全体の離職状況を確認 |
| 02_department.sql | 部署・職種別の離職率分析 |
| 03_employee.sql | 社員属性ごとの離職率分析 |
| 04_salary.sql | 給与・勤続年数と離職率分析 |
| 05_workstyle.sql | 残業・満足度など勤務環境の分析 |
| 06_summary.sql | 複数条件を組み合わせた離職傾向分析 |
| 07_tableau.sql | Tableau用データ作成 |
```

---

## 分析結果

SQLによる分析結果をもとに、以下の観点から離職率が高い傾向にある社員層を整理します。

- 部署・職種による違い
- 年代や婚姻状況など社員属性による違い
- 給与や勤続年数による違い
- 残業や満足度など勤務状況による違い
- 複数条件を組み合わせた場合の違い

※ 分析完了後、具体的な数値と考察を追記予定です。

---

## ダッシュボード

Tableauで分析結果を可視化しています。

（ダッシュボード画像を掲載予定）

---

## データセット

IBM HR Analytics Employee Attrition & Performance
