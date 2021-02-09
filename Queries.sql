/*List clients with contracts which have urgent status. */

select distinct first_name,last_name
from clients,contracts
where clients.client_id = contracts.client_id
and contract_status = 'U';

/*List all the contractors who are currently not working on more than two part-time job. Sort the list in descending order. */
select contractor_name
from contractors where contractor_id in
(select contractor_id
from job_contractor
group by contractor_id,contractor_job_status
having count(*)<=1 and count(contractor_job_status) =1 and contractor_job_status = 'P' or contractor_job_status = 'F')
order by contractor_name DESC;

/*List top five skills that are high in demand based on the contracts received so far. */
select * from
(select skill_description, count(*)
from contractors,skills
where contractors.skill_id = skills.skill_id
group by skill_description
order by count(*) desc)
where rownum <= 5;

/*Which contractor has the highest paid salary from IT-Pro? */
select * from
(select contractor_name, MAX(pay_rate*hours_worked) as salary
from skills,contractors
where skills.skill_id = contractors.skill_id
group by contractor_name,skills.skill_id,pay_rate,hours_worked
order by (pay_rate*hours_worked) desc)
where rownum <= 1;

/*List all the outstanding jobs for each contract. */
select jobs.job_id, jobs.job_description, jobs.contract_id
from jobs
where job_status = 'O';

/*List all the jobs for each contractor along with their skills for all contracts with a standard ‘S’ status */
SELECT contractors.contractor_id, skills.skill_description, contracts.contract_status, jobs.job_id
FROM contractors
INNER JOIN skills ON contractors.skill_id = skills.skill_id
INNER JOIN contracts ON contractors.contract_id = contracts.contract_id
INNER JOIN jobs ON jobs.skill_id = skills.skill_id
WHERE contracts.contract_status = 'S';

/*List contractors with their skill description, the contract status of the contract they are working on and the job_id of the job they are working on for all the contractors working full time.  */
SELECT contractors.contractor_id, skills.skill_description, contracts.contract_status, jobs.job_id,job_contractor.contractor_job_status
FROM contractors
INNER JOIN skills ON contractors.skill_id = skills.skill_id
INNER JOIN contracts ON contractors.contract_id = contracts.contract_id
INNER JOIN jobs ON jobs.skill_id = skills.skill_id
INNER JOIN job_contractor ON job_contractor.job_id = jobs.job_id 
WHERE job_contractor.contractor_job_status = 'F';
