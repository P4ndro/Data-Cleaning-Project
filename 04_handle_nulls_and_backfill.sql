-- 3. Null values or blank

-- find rows missing both layoff counts
select *
from layoffs_staging2
where total_laid_off IS NULL
  AND percentage_laid_off IS NULL;

-- convert empty strings to NULL for industry
UPDATE layoffs_staging2
set industry = null
where industry = '';

-- preview blanks
select *
from layoffs_staging2
where industry is null or industry =  '';

-- backfill industry via self‐join
select *
from layoffs_staging2 t1
JOIN layoffs_staging2 t2
  on t1.company = t2.company
  AND t1.location = t2.location
where (t1.industry is null OR t1.industry = '')
  and t2.industry is not null ;

update layoffs_staging2 t1
JOIN layoffs_staging2 t2
  on t1.company = t2.company
SET t1.industry = t2.industry
where t1.industry is null
  and t2.industry is not null ;
