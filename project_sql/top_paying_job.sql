select job_id,job_title,job_location,job_schedule_type,salary_year_avg,job_posted_date,cmp.name AS name_company
FROM job_postings_fact 
LEFT JOIN company_dim  as cmp ON cmp.company_id=job_postings_fact.company_id
where job_title_short = 'Data Analyst' and job_location='Anywhere' and salary_year_avg is NOT NULL
order by salary_year_avg DESC
LIMIT 10;