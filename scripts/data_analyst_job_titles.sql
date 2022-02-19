/*How many rows are in the data_analyst_jobs table? */
select count(*)
from data_analyst_jobs;


/*Write a query to look at just the first 10 rows*/
select *
from data_analyst_jobs
Limit 10;
/*What company is associated with the job posting on the 10th row:XTO Land Data Analyst*/


/*How many postings are in Tennessee? How many are there in either Tennessee or Kentucky? */
select count(title)
from data_analyst_jobs
where location = 'TN';
/* How many are there in either Tennessee or Kentucky? */
select count(title)
from data_analyst_jobs
where location = 'TN' or location='KY';


/*How many postings in Tennessee have a star rating above 4?:3*/
select count(title)
from data_analyst_jobs
where location = 'TN' and star_rating > 4;


/*How many postings in the dataset have a review count between 500 and 1000?:151*/
select count(title)
from data_analyst_jobs
where review_count between 500 and 1000 ;


/*Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating.*/
select location as state,
ROUND(avg(star_rating),2) as avg_rating
from data_analyst_jobs
where star_rating is not null
group by location
order by avg_rating DESC ;
/*Which state shows the highest average rating?:NE*/


/*Select unique job titles from the data_analyst_jobs table. How many are there?*/
select DISTINCT title
from data_analyst_jobs
where company is not null;
/*How many are there?:881 if you include NULL companies; 876 if NULL companie are not included*/


/*How many unique job titles are there for California companies?:230*/
select COUNT(DISTINCT title)
from data_analyst_jobs
where location ='CA';


/*Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?:41 if you count NULL value, 40 if you don't*/
select company,
avg(star_rating)
from data_analyst_jobs
 where review_count > 5000 and company is not null
group by company;


/*Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating?: Unilever,General Motors,Nike,American Express,Microsoft,Kaiser Permanente.
What is that rating?:4.20*/
select  company, 
ROUND(avg(star_rating),2) as ave_rating
from data_analyst_jobs
where review_count > 5000 
and company is not null
group by company
order by ave_rating DESC;


/*Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?:754 with LIKE, 774 with ILIKE*/
select DISTINCT title
FROM data_analyst_jobs
where title ILIKE '%Analyst%';


/*How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’:?*/
select title
FROM data_analyst_jobs
where title NOT ILIKE '%Analy%';
/*What word do these positions have in common?: Tableu*/

/*You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
Disregard any postings where the domain is NULL.
Order your results so that the domain with the greatest number of hard to fill jobs is at the top.*/
select count(title) as job_title_count,
domain
FROM data_analyst_jobs
where skill  like '%SQL%' 
and days_since_posting > 21
and domain is not null
group by domain
order by job_title_count DESC;
/*Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
62	"Internet and Software"
61	"Banks and Financial Services"
57	"Consulting and Business Services"*/
