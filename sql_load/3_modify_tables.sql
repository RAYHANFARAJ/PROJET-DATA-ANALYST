/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

Possible Errors: 
- ERROR >>  duplicate key value violates unique constraint "company_dim_pkey"
- ERROR >> could not open file "C:\Users\...\company_dim.csv" for reading: Permission denied

1. Drop the Database 
            DROP DATABASE IF EXISTS sql_course;
2. Repeat steps to create database and load table schemas
            - 1_create_database.sql
            - 2_create_tables.sql
3. Open pgAdmin
4. In Object Explorer (left-hand pane), navigate to `sql_course` database
5. Right-click `sql_course` and select `PSQL Tool`
            - This opens a terminal window to write the following code
6. Get the absolute file path of your csv files
            1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
7. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM '[Insert File Path]/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '[Insert File Path]/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '[Insert File Path]/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '[Insert File Path]/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding
COPY company_dim
FROM 'C:\Users\faraj\OneDrive\Escritorio\sqlfordata\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\faraj\OneDrive\Escritorio\sqlfordata\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\faraj\OneDrive\Escritorio\sqlfordata\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\faraj\OneDrive\Escritorio\sqlfordata\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
select * from job_postings_fact limit 10;

select * from skills_dim;
select * from skills_job_dim
LIMIT 100;
select EXTRACT(DAY from job_posted_date) as date_column from job_postings_fact LIMIT 10;
SELECT salary_hour_avg ,salary_year_avg from job_postings_fact  WHERE job_posted_date::DATE >= '2023-06-01'
 GROUP BY job_schedule_type;
 SELECT 
    job_schedule_type,
    AVG(salary_hour_avg) AS avg_hour_salary,
    AVG(salary_year_avg) AS avg_year_salary
FROM job_postings_fact
WHERE job_posted_date::DATE >= '2023-06-01'
GROUP BY job_schedule_type;

create table january_jobs as 
select* from job_postings_fact WHERE
EXTRACT(MONTH FROM job_posted_date) =1;
create table february_jobs as 
select* from job_postings_fact WHERE
EXTRACT(MONTH FROM job_posted_date) =2;
create table march_jobs as 
select* from job_postings_fact WHERE
EXTRACT(MONTH FROM job_posted_date) =3;
SELECT job_posted_date FROM march_jobs;
select*from skills_dim;
select * from skills_job_dim;
select*from job_postings_fact limit 10;
WITH Top_skil as (select skills ,skill_id ,count(*) as counts from skills_dim GROUP BY skills,skill_id ORDER BY counts desc LIMIT 5) 

select Top_skil.skills , job_postings_fact.job_title from 
Top_skil left join skills_job_dim on Top_skil.skill_id=skills_job_dim.skill_id
left join job_postings_fact on job_postings_fact.job_id=skills_job_dim.job_id;
