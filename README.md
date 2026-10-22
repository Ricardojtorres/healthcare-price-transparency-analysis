# Healthcare Price Transparency Analysis
## TGH Crystal River Hospital — 2026

### Overview
Ran an SQL and Power BI analysis of hospital price transparency data published by Tampa General Hospital Crystal River (Florida) under the CMS price transparency rule. The dataset contains 114,076 entries of negotiated rates between the hospital and commercial insurance payers across all medical procedures.

### Data Source
- **Source:** Tampa General Hospital Crystal River website — mandatory price transparency file, published under Centers for Medicare & Medicaid Services (CMS) requirement
- **Records:** 114,076 rows | 15 columns
- **Period:** 2026

### Tools 
- **SQL Server Express + SSMS** — data storage and analysis
- **Power BI Desktop** — dashboard and visualization
- **Excel** — data preprocessing and cleaning

### SQL Analyses
| File | Description |
|------|-------------|
| 01_avg_rate_by_payer_ranked | Average negotiated rate by payer with DENSE_RANK |
| 02_price_variation_by_procedure | Procedures with largest price variation across payers |
| 03_top_payer_by_procedure | Highest-paying payer per procedure using ROW_NUMBER |
| 04_avg_rate_by_payer_and_billing_class | Average rate by payer and billing class (facility vs professional) |

### Key Findings
- **Humana** offers the highest negotiated rates for complex procedures (transplants, CAR T-Cell therapy)
- **Freedom Health** and **Wellcare** have the lowest average negotiated rates overall
- **Chimeric Antigen Receptor (CAR) T-Cell therapy** shows the largest price variation across payers (~$798K spread)
- All contracts in this dataset are classified as **facility** billing class (all procedures were performed on a hospital setting) 
