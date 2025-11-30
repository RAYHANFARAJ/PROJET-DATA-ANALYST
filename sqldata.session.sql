CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(225),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(225),
    status VARCHAR(50)
);
SELECT * from job_applied;
INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES
(1, '2025-11-09', TRUE, 'resume_rayhan_custom.pdf', TRUE, 'cover_letter_rayhan.pdf', 'Pending'),
(2, '2025-11-05', FALSE, 'resume_standard.pdf', FALSE, NULL, 'Rejected'),
(3, '2025-11-07', TRUE, 'resume_data_engineer.pdf', TRUE, 'cover_letter_data.pdf', 'Interview Scheduled'),
(4, '2025-11-02', TRUE, 'resume_ai_specialist.pdf', TRUE, 'cover_letter_ai.pdf', 'Offer Received');
ALTER TABLE job_applied ADD contact VARCHAR(225);
UPDATE job_applied SET contact='rayhan'
WHERE job_id=1;
UPDATE job_applied SET contact='youness'
WHERE job_id=2;
UPDATE job_applied SET contact='noura'
WHERE job_id=3;
UPDATE job_applied SET contact='samir'
WHERE job_id=4;
DROP TABLE job_applied;