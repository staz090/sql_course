SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 120000 THEN 'High'
        WHEN salary_year_avg >= 70000 THEN 'Standard'
        ELSE 'Low'
    END AS salary_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;
