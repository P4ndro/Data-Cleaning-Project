# 🧹 Layoffs Dataset – SQL Data Cleaning Project

This project is something I put together to show my understanding of SQL, especially when it comes to cleaning and prepping real-world data for analysis. It’s a full walkthrough of how I cleaned a messy layoffs dataset using only SQL (MySQL syntax), broken into clear, modular steps.

---

## 🔧 Tools & Techniques

- **SQL (MySQL)**
- **Window Functions** – for finding and removing duplicates  
- **String Functions** – cleaning up messy text  
- **Date Handling** – converting strings to proper date types  
- **Self-Joins** – used for filling in missing values  
- **General Cleanup** – removing bad data and helper columns

---

## 📁 Cleaning Steps

The cleaning process is split into 5 parts:

1. **`01_remove_duplicates.sql`**  
   - Use `ROW_NUMBER()` to flag duplicate rows in `layoffs_staging`  
   - Delete any rows where `row_num > 1`

2. **`02_create_staging2_and_dedupe.sql`**  
   - Create a new table `layoffs_staging2`  
   - Insert only the cleaned, deduplicated records

3. **`03_standardize_fields.sql`**  
   - Trim extra spaces in `company` names  
   - Clean up `industry` labels (like `Crypto%` → `Crypto`)  
   - Fix `country` values (remove periods)  
   - Convert string dates to `DATE` format

4. **`04_handle_nulls_and_backfill.sql`**  
   - Replace blank strings with `NULL`  
   - Fill in missing `industry` values using a self-join  
   - Remove rows missing both `total_laid_off` and `percentage_laid_off`

5. **`05_finalize_cleanup.sql`**  
   - Drop helper columns like `row_num`  
   - Final cleaned table: `layoffs_staging2`

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

## 🔍 Next Steps

Once the data is clean, you can load `layoffs_staging2` into a BI tool (like Tableau or Power BI) and explore questions like:

- How have layoffs changed over time?
- Which industries were hit the hardest?
- Are there any trends by country or region?

---

## 📝 Notes

- This project uses **MySQL syntax**, but you can tweak the SQL to work with other databases.
- It’s a great example of hands-on SQL cleaning for your portfolio or resume.
- Each script is standalone — just run them in order to get the final cleaned table.

---


