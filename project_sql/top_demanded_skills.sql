SELECT skills,COUNT(skills_job_dim.job_id) AS NMBR FROM job_postings_fact 
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short ='Data Analyst' and job_work_from_home=TRUE
GROUP BY skills
ORDER BY NMBR DESC
limit 5