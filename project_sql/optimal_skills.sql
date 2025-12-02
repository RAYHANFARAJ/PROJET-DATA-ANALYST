
with skill_demand as(
    SELECT skills_dim.skill_id,skills_dim.skills,COUNT(skills_job_dim.job_id) AS NMBR FROM job_postings_fact 
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short ='Data Analyst' and job_work_from_home=TRUE  and salary_year_avg is NOT NULL
GROUP BY skills_dim.skill_id
), aveg_salary as (
    SELECT skills_job_dim.skill_id, ROUND(AVG(job_postings_fact.salary_year_avg),2) as avg_salary
 FROM job_postings_fact 
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short ='Data Analyst' and salary_year_avg is NOT NULL and job_work_from_home=TRUE
GROUP BY skills_job_dim.skill_id

)
select skill_demand.skill_id,
skill_demand.skills,
NMBR,
avg_salary
from skill_demand INNER JOIN aveg_salary on aveg_salary.skill_id=skill_demand.skill_id
ORDER BY NMBR desc, avg_salary DESC
limit 5