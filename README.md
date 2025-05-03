# Data Cleaning Project – Layoffs Dataset (SQL)

This repository contains a full SQL script to clean a raw layoffs dataset.

## 🧰 Tools & Techniques
- **SQL** (MySQL syntax)  
- **Window Functions & CTEs:** for deduplication  
- **String functions:** `TRIM()`, `LIKE` patterns  
- **Date conversion:** `STR_TO_DATE()` + `ALTER COLUMN`  
- **Self-join updates:** to backfill missing fields  
- **Cleanup:** drop helper columns, remove unusable rows

## 📋 Workflow Overview
1. **Remove Duplicates**  
   - Identify with `ROW_NUMBER() OVER (PARTITION BY …)`  
   - Delete rows where `row_num > 1`
2. **Standardize Text**  
   - Trim whitespace from company names  
   - Consolidate variants (e.g. `Crypto%` → `Crypto`)  
   - Strip trailing periods from country names
3. **Convert Date**  
   - Parse text to DATE using `STR_TO_DATE()`  
   - Modify column type to `DATE`
4. **Handle Nulls & Blanks**  
   - Blank strings → `NULL`  
   - Backfill `industry` via self-join  
   - Delete rows missing both layoff counts and percentages
5. **Finalize**  
   - Drop staging/helper columns (`row_num`)  
   - Output: `layoffs_staging2` ready for analysis

## 📂 Repo Contents

| File                | Description                                    |
|---------------------|------------------------------------------------|
| `data_cleaning.sql` | Full SQL script performing all cleaning steps  |
| `README.md`         | Project overview and documentation             |

---

## 🔗 Next Steps
- Load cleansed data into a BI tool  
- Analyze layoff trends by industry / geography  

