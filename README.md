# IBM HR Analytics - Employee Attrition Analysis

## 概要

IBM HR Analytics Employee Attrition & Performance データセットを用いて、
従業員の離職状況をSQLとTableauで分析したポートフォリオです。

---

## 分析目的

従業員の離職状況を把握し、部署・職種・社員属性・給与・勤務状況などの観点から、離職率との関連性を分析することを目的としています。

本分析では、各項目を単独で比較するだけでなく、複数の条件を組み合わせることで、離職率が高い傾向にある社員層を確認します。

---

## 使用技術

| 技術 | 用途 |
|------|------|
| SQL(BigQuery) | データ抽出・集計・分析 |
| Tableau | 分析結果の可視化・ダッシュボード作成 |
| GitHub | SQLファイル・READMEの管理 |

---

## 分析内容

本プロジェクトでは、全体の離職状況を確認したうえで、部署・職種、社員属性、待遇、勤務状況の順に分析を進めます。

| ファイル | 分析内容 |
|----------|----------|
| `01_basic.sql` | 全社員数・離職者数・在籍者数・全体離職率の確認 |
| `02_department.sql` | 部署・職種ごとの社員数と離職率の比較 |
| `03_employee.sql` | 年代・性別・婚姻状況・出張頻度など社員属性ごとの離職率比較 |
| `04_salary.sql` | 給与・勤続年数・昇進状況など待遇面と離職率の分析 |
| `05_workstyle.sql` | 残業・満足度・ワークライフバランスなど勤務状況と離職率の分析 |
| `06_summary.sql` | 複数条件を組み合わせた離職傾向の分析 |
| `07_tableau.sql` | Tableauで使用する可視化用データセットの作成 |

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

## 分析結果

SQLによる分析結果をもとに、以下の観点から離職率が高い傾向にある社員層を整理します。

- 部署・職種による違い
- 年代や婚姻状況など社員属性による違い
- 給与や勤続年数による違い
- 残業や満足度など勤務状況による違い
- 複数条件を組み合わせた場合の違い

※ 分析完了後、具体的な数値と考察を追記予定です。

---

## Tableauダッシュボード

SQLで作成した分析用データをTableauに取り込み、離職状況を確認できるダッシュボードを作成します。

主な可視化項目は以下を予定しています。

- 全体離職率
- 部署・職種別離職率
- 年代別離職率
- 給与帯別離職率
- 残業有無別離職率
- 満足度別離職率
- 離職率が高い社員層の比較

ダッシュボード完成後、画像またはTableau PublicのURLを掲載予定です。

---

## データセット

本プロジェクトでは、Kaggleで公開されているデータセットを使用しています。

- データセット：IBM HR Analytics Employee Attrition & Performance
- 公開元：Kaggle
- URL：:contentReference[oaicite:0]{index=0}

本データセットは、IBMのデータサイエンティストによって作成された架空の人事データであり、従業員の属性、職種、給与、勤務状況、満足度、離職状況などの情報が含まれています。:contentReference[oaicite:1]{index=1}

本プロジェクトでは、BigQuery上の以下のテーブルを使用して分析を行いました。

```sql
`sql-project-459910.IBM_HR_ANALYTICS.risyoku_kaggle`
```


