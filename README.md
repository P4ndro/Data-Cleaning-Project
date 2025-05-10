# 📊 Layoffs Dataset – SQL Data Cleaning & EDA Project

This project demonstrates my skills in SQL by walking through a complete data pipeline: **cleaning a real-world layoffs dataset** and then performing **exploratory data analysis (EDA)** to uncover trends across industries, countries, and time.

---

## 🔧 Tools & Techniques

**SQL (MySQL)** – All data prep and analysis done in SQL  
- **Window Functions** – Identifying duplicates, ranking  
- **String Functions** – Text standardization  
- **Date Handling** – Parsing dates, monthly/yearly grouping  
- **Self-Joins** – Filling missing values  
- **Aggregations & CTEs** – Used extensively in EDA  
- **Rolling Totals & RANK** – For trend and top-N analysis  

---

## 📁 Data Cleaning Steps

The cleaning process is split into 5 modular SQL scripts:

| File                                  | Description                                                  |
|---------------------------------------|--------------------------------------------------------------|
| `01_remove_duplicates.sql`            | Use `ROW_NUMBER()` to flag and remove duplicate rows         |
| `02_create_staging2_and_dedupe.sql`   | Create `layoffs_staging2` with deduplicated records          |
| `03_standardize_fields.sql`          | Clean and normalize company, industry, and country fields; convert dates |
| `04_handle_nulls_and_backfill.sql`    | Replace blanks with NULLs, fill missing industry values using a self-join |
| `05_finalize_cleanup.sql`             | Drop helper columns and finalize the clean table             |

**Final output:** A clean, analysis-ready table named `layoffs_staging2`.

---

## 📊 EDA: Exploratory Data Analysis

Once the data is cleaned, I performed EDA to uncover trends and insights, using SQL queries such as:

- 📈 **Total Layoffs Over Time** – Monthly, yearly, and rolling totals  
- 🏭 **Top Industries by Layoffs** – Industry-wise aggregation  
- 🌍 **Layoffs by Country** – Which regions saw the most cuts?  
- 🏢 **Top Companies per Year** – Using `DENSE_RANK()` to highlight the hardest-hit companies annually  
- 💰 **Funding vs Layoffs** – Which highly funded companies still laid off staff?  
- 📅 **Earliest & Latest Layoffs** – Dataset range analysis  

See `eda_queries.sql` (or in a Jupyter notebook if included) for full SQL breakdown.

---

## 📂 Repo Contents

| File                                          | Description                                   |
|-----------------------------------------------|-----------------------------------------------|
| `01_remove_duplicates.sql` → `05_finalize_cleanup.sql` | Full data cleaning pipeline                  |
| `eda_queries.sql` (optional)                  | Key EDA queries on cleaned data              |
| `README.md`                                   | This project overview and walkthrough         |

---

## 📌 Insights Found

- Layoffs peaked in **[YEAR or MONTH]** with over **[X]** people laid off  
- **[Industry X]** was the most affected sector  
- Companies like **[Company A, Company B]** ranked highest in layoffs during **[Year]**  


---

## 🚀 Next Steps

- Visualize the EDA using Python (e.g., pandas, matplotlib) or BI tools like Tableau  
- Explore trends over quarters and correlate layoffs with funding data  
- Build a dashboard or simple app to interact with the cleaned data  

---

## 📝 Notes

- The project uses **MySQL syntax**, but queries can be adapted to other SQL dialects  
- All scripts are modular – just run them in order  
- This is a strong portfolio piece showing both **data wrangling** and **analytical thinking**  
