-- 2. standardize the Data

-- trim company names
select company,TRIM(company)
from layoffs_staging2;

Update layoffs_staging2
SET company = TRIM(company);

-- unify Crypto industry
select *
from layoffs_staging2
where industry LIKE 'Crypto%' ;

UPDATE layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

-- clean trailing dots in country
Select distinct country, trim(Trailing '.' from country)
from layoffs_staging2
where country like 'United States%'
order by 1;

update layoffs_staging2
set country = trim(Trailing '.' from country)
where country like 'United States%';

-- convert text date into DATE
select `date`, 
  str_to_date(`date`, '%m/%d/%Y') 
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y') ;

Alter table layoffs_staging2
  modify column `date` DATE;
