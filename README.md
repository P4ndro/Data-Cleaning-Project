# Data Cleaning Project – Layoffs Dataset (SQL)

This repository contains a full SQL-based pipeline to clean and prepare a raw layoffs dataset for analysis.  
The project is structured into modular files, each representing a specific phase in the data cleaning workflow.

---

## 🧰 Tools & Techniques

- **SQL** (MySQL syntax)
- **Window Functions & CTEs** – for deduplication
- **String Functions** – `TRIM()`, `LIKE`, pattern matching
- **Date Conversion** – `STR_TO_DATE()`, `ALTER COLUMN`
- **Self-Join Updates** – to backfill missing values
- **Final Cleanup** – drop helper columns, remove unusable rows

---

## 📋 Workflow Overview

Each step of the data cleaning process is written in a separate `.sql` file:

1. **`01_remove_duplicates.sql`**  
   - Use `ROW_NUMBER()` to identify duplicates in `layoffs_staging`  
   - Preview and remove rows where `row_num > 1`

2. **`02_create_staging2_and_dedupe.sql`**  
   - Create a new cleaned table `layoffs_staging2`  
   - Insert deduplicated records using window functions

3. **`03_standardize_fields.sql`**  
   - Trim whitespace from `company`  
   - Normalize `industry` labels (e.g. `Crypto%` → `Crypto`)  
   - Strip trailing periods from `country`  
   - Convert `date` strings to proper `DATE` format

4. **`04_handle_nulls_and_backfill.sql`**  
   - Convert blank strings to `NULL`  
   - Backfill missing `industry` using self-joins  
   - Remove rows with both `total_laid_off` and `percentage_laid_off` as `NULL`

5. **`05_finalize_cleanup.sql`**  
   - Drop the helper column `row_num`  
   - Result: `layoffs_staging2` table is cleaned and ready for analysis

---

## 📂 Repo Contents

| File                        | Description                                 |
|-----------------------------|---------------------------------------------|
| `01_remove_duplicates.sql`  | Identifies and removes duplicate rows       |
| `02_create_staging2_and_dedupe.sql` | Creates cleaned table and deduplicates it |
| `03_standardize_fields.sql` | Trims and normalizes text & date fields     |
| `04_handle_nulls_and_backfill.sql` | Handles missing values and fills gaps      |
| `05_finalize_cleanup.sql`   | Final touches and cleanup                   |
| `README.md`                 | Project overview and instructions           |

---

## 🔗 Next Steps

- Load the cleaned `layoffs_staging2` into a BI tool (e.g. Tableau, Power BI)
- Analyze:
  - Layoff trends over time
  - Industry-specific job cuts
  - Regional patterns based on `country` or `location`

---

## 📌 Notes

- SQL code is written for **MySQL** — minor adjustments may be needed for other databases
- Designed to showcase **practical SQL data cleaning skills** on your portfolio or CV
- Scripts are modular — run in the listed order for expected results

---

Feel free to fork, adapt, or expand this pipeline for your own datasets or analysis workflows!
