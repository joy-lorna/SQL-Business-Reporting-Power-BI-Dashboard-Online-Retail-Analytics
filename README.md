# SQL Business Reporting & Power BI Dashboard | Online Retail Analytics

## Project Overview

This project demonstrates an end-to-end SQL business reporting workflow built using the UCI Online Retail II dataset.

The objective was to translate business questions into governed SQL outputs, validate reporting results through reconciliation and data-quality controls, document KPI definitions, and deliver a management reporting dashboard in Power BI.

The project is structured as a business reporting solution rather than a collection of standalone SQL exercises. It emphasizes data governance, metric consistency, quality controls, reporting lineage, and analytical communication.

---

## Business Scenario

A fictional Luxembourg-headquartered European e-commerce retailer requires a reporting environment capable of answering key management questions regarding:

- Revenue performance
- Customer value and concentration
- Product category performance
- Geographic contribution
- Business growth trends
- Cancellation exposure

The reporting solution combines SQL analysis, validation controls, Excel reporting outputs, and interactive Power BI visualisation.

---

## Dashboard Access

### Power BI Dashboard

[View Interactive Power BI Dashboard](https://frelotraders-my.sharepoint.com/:u:/g/personal/joylorna_frelotraders_onmicrosoft_com/IQDe2FyYDzlGTbQvfgDxuJauAU6osoT5AIxypR38TdR0Svc?e=X1qRvR)

---

## Technologies Used

- Google BigQuery
- SQL
- Microsoft Excel
- Power BI
- GitHub

---

## Data Source

**Dataset:** UCI Online Retail II

The dataset contains historical transactional sales records from a UK-based online retailer and is publicly available for educational and analytical purposes.

Reporting Period:

- December 2009
- December 2011

Currency Treatment:

- Unit prices are treated as GBP (£)
- No foreign-exchange conversions were applied

---

## Project Architecture

```text
Source Data
    ↓
Data Profiling
    ↓
SQL Business Logic
    ↓
Validation Controls
    ↓
Governed Reporting Outputs
    ↓
Excel Reporting Pack
    ↓
Power BI Dashboard
```

The reporting workflow follows a controlled process where SQL outputs are validated before being consumed by the Power BI reporting layer.

---

## Business Questions Answered

### Q01 – Monthly Revenue Performance

How is revenue trending month by month?

### Q02 – Top Customers

Who generates the highest commercial value?

### Q03 – Product Category Performance

Which product categories contribute the most revenue?

### Q04 – Country Performance

Which countries generate the strongest commercial performance?

### Q05 – Cancellation Analysis

Where is cancellation exposure highest?

### Q06 – Running Revenue Total

How does cumulative revenue develop over time?

### Q07 – Customer Cohorts

How valuable are customer acquisition cohorts?

### Q08 – Regional Ranking

How do regions rank by revenue across quarters?

### Q09 – Month-on-Month Growth

What are the key growth and contraction periods?

### Q10 – Rolling Revenue Trend

What does the smoothed revenue trend reveal?

---

## Validation Framework

A formal validation layer was implemented before reporting outputs were published.

### Control Checks

| Control | Purpose |
|----------|----------|
| Row Reconciliation | Confirms complete transfer of records |
| Revenue Reconciliation | Confirms reporting values reconcile |
| Orphan Key Checks | Validates referential integrity |
| Raw Data Profiling | Identifies data-quality limitations |
| Cancellation Profiling | Reviews cancellation exposure |

Key validation results:

- Row reconciliation difference = 0
- Revenue reconciliation difference = 0
- Missing product keys = 0
- Missing country keys = 0
- Missing date keys = 0

---

## Power BI Dashboard Pages

### 1. Executive Overview

Management-level review of:

- Revenue
- Orders
- Customers
- Cancellation exposure
- Country contribution
- Product contribution

<img width="659" height="366" alt="image" src="https://github.com/user-attachments/assets/d9bae534-2b98-4e44-a814-312e24437544" />

### 2. Customer Analytics

Analysis of:

- Top customers
- Customer concentration
- Cohort performance
- Revenue per customer

<img width="665" height="367" alt="image" src="https://github.com/user-attachments/assets/83639b30-77b2-4f9f-8138-cd4b9f748152" />

### 3. Product Analytics

Analysis of:

- Product category revenue
- Product breadth
- Units sold
- Revenue share

<img width="655" height="364" alt="image" src="https://github.com/user-attachments/assets/11c68522-2da0-486d-ac1c-c2dec2b4e43a" />

### 4. Geographic Analytics

Analysis of:

- Country revenue
- Regional contribution
- Revenue per customer
- Regional rankings

<img width="658" height="364" alt="image" src="https://github.com/user-attachments/assets/68b8be8e-472c-4b41-8526-296689fb66ac" />

### 5. Revenue & Trend Analysis

Analysis of:

- Revenue trend
- Running revenue
- Month-on-month growth
- Rolling revenue averages

<img width="662" height="365" alt="image" src="https://github.com/user-attachments/assets/5add9318-63ea-46f4-97a4-b47a587dfcc9" />

---

## Key Findings

### Revenue Concentration

The United Kingdom contributes the majority of attributed revenue, highlighting both commercial strength and concentration risk.

### Seasonality

Revenue exhibits clear seasonal behaviour, with the strongest performance occurring during year-end trading periods.

### Product Classification Opportunity

A significant proportion of revenue falls within the "Other or Uncategorised" grouping, indicating potential improvements in product-governance classification.

### Customer Concentration

The largest customers contribute meaningful value but do not create excessive dependence on a single customer relationship.

---

## Deliverables

### Excel

- Reporting workbook
- Governance documentation
- KPI dictionary
- Validation controls
- Business query outputs

### SQL

- 10 business-reporting queries
- Window functions
- Ranking logic
- Growth calculations
- Cohort analysis

### Power BI

- Interactive dashboard
- Five analytical report pages
- Executive management reporting views

---

## Limitations

The project contains several documented limitations that should be considered when interpreting results:

- Customer IDs are missing for a portion of source transactions
- Product categories are derived analytically
- Currency conversion was not applied
- Revenue is highly concentrated in the UK
- Small customer populations can distort revenue-per-customer comparisons
- Cancellation rates may be volatile in low-volume markets

---

## Important Disclosure

This portfolio project uses the publicly available UCI Online Retail II dataset.

The Luxembourg business context, reporting structure, management commentary, and analytical outputs are simulated for portfolio and educational purposes.

No real client information, confidential company data, proprietary systems, or regulated reporting outputs are included.

This project should not be interpreted as a production system, regulatory filing, or officially approved reporting framework.

---

## Repository Structure

```text
/
│
├── README.md
├── online_retail_bi.xlsx
├── online_retail_bi.pbix
│
├── SQL/
│   ├── Query 01_ Monthly revenue performance.sql
│   ├── Query 02_ Top customers.sql
│   ├── Query 03_ Product-category performance.sql
│   ├── Query 04_ Country performance.sql
│   ├── Query 05_ Cancellation analysis.sql
│   ├── Query 06_ Running revenue total.sql
│   ├── Query 07_ Customer acquisition cohorts.sql
│   ├── Query 08_ Regional revenue ranking.sql
│   ├── Query 09_ Month-on-month growth.sql
│   └── Query 10_ Rolling revenue trend.sql
│     
├── Raw dataset
├── online_retail_power_bi_final.xlsx - dataset uploaded to power bi
├── SQL data preparation queries
```
---

## Skills Demonstrated

### SQL

- Aggregations
- Window functions
- Ranking functions
- Running totals
- Rolling averages
- Cohort analysis
- Growth calculations
- Conditional logic

### Business Intelligence

- KPI governance
- Reporting design
- Data validation
- Dashboard development
- Executive reporting

### Data Quality & Controls

- Reconciliation
- Referential-integrity testing
- Data-quality profiling
- Reporting validation

---

## Author

Joy Lorna

Financial Analysis | Business Intelligence | Financial Risk | Data Analytics
