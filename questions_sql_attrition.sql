use Srishtidb;

select * from employees limit 100;
 
-- sql questions
-- Attrition Analysis
-- What is the overall attrition rate?

SELECT
  (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM employees;

-- Which departments have the highest attrition?
select department, count(*) as total_employees,sum( case when attrition ="yes" then 1 else 0 end) as attrition_count,round((sum( case when attrition = "yes" then 1 else 0 end) / count(*))*100,2) as attrition_rate
from employees
group by department;


-- Is attrition higher among employees who travel frequently?

SELECT
BusinessTravel,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
 ROUND(
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
  ) AS attrition_rate_percent
FROM employees
GROUP BY BusinessTravel
ORDER BY attrition_rate_percent DESC;


-- Does job satisfaction correlate with attrition?
SELECT
 JobSatisfaction,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
 ROUND(
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
  ) AS attrition_rate_percent
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- What is the attrition rate by gender and age group?
select
 gender,
 agegroup,
 sum(case when attrition= "yes" then 1 else 0 end ) as attrition_count,
 round((sum(case when attrition= "yes" then 1 else 0 end)/count(*))*100,2) as attrition_rate
from employees
group by gender, agegroup
order by agegroup;


-- Demographics & Workforce Composition
-- What is the distribution of employees by age group and gender?

select gender, agegroup, count(*) as count_emp
from employees
group by gender, agegroup
order by agegroup;

-- How many employees belong to each department and job role?
select
department,
jobroles,
count(*) as total_count
from employees
group by department, jobroles;


-- What is the educational qualification distribution across departments?
SELECT
  Department,
 SUM(CASE WHEN EducationField = 'Life Sciences' THEN 1 ELSE 0 END) AS Life_Sciences,
 SUM(CASE WHEN EducationField = 'Medical' THEN 1 ELSE 0 END) AS Medical,
 SUM(CASE WHEN EducationField = 'Marketing' THEN 1 ELSE 0 END) AS Marketing,
 SUM(CASE WHEN EducationField = 'Technical Degree' THEN 1 ELSE 0 END) AS Technical,
 SUM(CASE WHEN EducationField = 'Human Resources' THEN 1 ELSE 0 END) AS HR,
 SUM(CASE WHEN EducationField = 'Other' THEN 1 ELSE 0 END) AS Other
FROM employees
GROUP BY Department;



-- How many employees are working remotely (DistanceFromHome = 0)?
select distancefromhome, count(*) as no_emp
from employees
where distancefromhome = 0;

-- Salary & Compensation
-- What is the average monthly income by job role?
select jobrole, round( avg(monthlyincome),2) as avg_income, count(*) as total_employees
from employees
group by jobrole
order by avg_income DESC;




