-- create cleaned staging table and remove duplicates

WITH duplicate_cte AS(
  Select *,
    row_number() OVER(
      PARTITION BY company,location,industry,total_laid_off,
                   percentage_laid_off,'date',stage,country,funds_raised_millions
    ) AS row_num
  from layoffs_staging
)
SELECT *
from duplicate_cte 
where row_num > 1;

WITH duplicate_cte AS(
  Select *,
    row_number() OVER(
      PARTITION BY company,location,industry,total_laid_off,
                   percentage_laid_off,'date',stage,country,funds_raised_millions
    ) AS row_num
  from layoffs_staging
)
DELETE 
from duplicate_cte 
where row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2
where row_num > 1;

Insert into layoffs_staging2
select *,
  row_number() OVER(
    PARTITION BY company,location,industry,total_laid_off,
                 percentage_laid_off,'date',stage,country,funds_raised_millions
  ) AS row_num
from layoffs_staging;

Delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2;
