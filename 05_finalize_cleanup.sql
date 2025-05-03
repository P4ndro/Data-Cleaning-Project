-- 4. Remove any columns (and drop unusable rows)

select *
from layoffs_staging2
where total_laid_off IS NULL
  AND percentage_laid_off IS null;

DELETE
from layoffs_staging2
where total_laid_off IS NULL
  AND percentage_laid_off IS null;

select * 
from layoffs_staging2;

ALTER TABLE layoffs_staging2
  drop column row_num;
