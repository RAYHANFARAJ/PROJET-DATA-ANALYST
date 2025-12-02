# Data Analysis Project

## Introduction

This project analyzes data to extract insights and support data-driven decision-making. The main goal is to explore the dataset, identify key patterns, and summarize findings using SQL queries.

## Background

The dataset contains information about [job postings, skills, or specify domain]. The goal is to determine in-demand skills, top-paying jobs, and salary trends for Data Analysts, including remote positions.

## Tools I Used

* **SQL**: For querying and managing structured data.
* **pgAdmin: For executing SQL scripts and visualizing results.
* **Git & GitHub**: For version control and sharing project files.

## Analysis

1. **Data Cleaning**: Handled missing values and ensured data consistency using SQL.
2. **Exploratory Data Analysis (EDA)**:

   * Counted skill occurrences and job postings.
   * Calculated average salaries per skill.
   * Identified top-demanded skills and top-paying jobs.
3. **SQL Scripts**:

   * `top_demanded_skills.sql` – Finds the most requested skills.
   * `top_paying_job.sql` – Finds jobs with the highest average salary.
   * `top_salary_job.sql` – Compares salaries for remote positions.
   * `top_skills.sql` – Ranks skills by frequency.
   * `optimal_skills.sql` – Combines skill demand and salary data for analysis.

## What I Learned

* How to write complex SQL queries for analysis.
* How to join multiple tables to extract meaningful insights.
* How to summarize and rank data efficiently with SQL.
* The importance of structuring a database for easy querying.

## Conclusion

This project demonstrates the end-to-end use of SQL to analyze datasets, from data extraction to insightful summaries. It highlights key trends in skills and salaries for Data Analysts and provides practical experience in database querying and analysis.

---

**Repository Structure**

* `project_sql/` – SQL scripts used in the analysis.
* `sql_load/` – Scripts to create and modify the database.
* `.gitignore` – To exclude unnecessary files.
* `csv_files/` – Datasets (if any, depending on `.gitignore` rules).

---

Explore the SQL scripts in `project_sql/` to see how each analysis was performed.
