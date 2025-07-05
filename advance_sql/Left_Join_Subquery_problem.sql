/*Determine the size category ("Small", "Medium", or "Large") for each company by first identifying the number of job postings they have. Use a subquery to calculate the total job postings per company.
A company is considered 'Small' if it has less than 10 job postings,
'Medium' if the number of job postings is between 10 and 50, and
'Large' if it has more than 50 job postings.
*/

WITH job_counts AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)

SELECT 
    cd.name AS company_name,
    job_counts.total_jobs,
    CASE 
        WHEN job_counts.total_jobs < 10 THEN 'Small'
        WHEN job_counts.total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM 
    company_dim cd
LEFT JOIN 
    job_counts 
    ON cd.company_id = job_counts.company_id;
