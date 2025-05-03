-- 1. remove Duplicates
-- inspect raw staging
select *
from layoffs_staging;

Insert layoffs_staging
Select *
from layoffs;

-- preview candidate duplicates
Select *,
row_number() OVER(
  PARTITION BY company,industry,total_laid_off,percentage_laid_off,'date'
) AS row_num
from layoffs_staging;
