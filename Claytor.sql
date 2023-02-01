--1 How many rows are in the names table?
SELECT count(*)
FROM names;
-- There are 1957046 rows

--2 How many total registered people appear in the dataset?
SELECT SUM(num_registered) AS total_registered_people
FROM names;
-- There are 351,653,025 names in the in the dataset

--3  Which name had the most appearances in a single year in the dataset?
SELECT * 
FROM names
ORDER BY num_registered DESC
LIMIT 5;
-- Linda had the most appearances in a single year. She appeared 99,689 times in 1947!

--4  What range of years are included?
SELECT MIN(year) AS Alpha, MAX(year) as Omega
FROM names;
-- the dataset includes years from 1880 to 2018

--5 What year has the largest number of registrations?
SELECT year, SUM(num_registered) AS number_of_registrations
FROM names
GROUP BY year
ORDER BY number_of_registrations DESC
LIMIT 5;
-- 1957 had the largest number of 4,200,022

6-- How many different (distinct) names are contained in the dataset?
SELECT COUNT(DISTINCT (name)) AS distinct_names
FROM names;
-- 98,400 distinct names in the database

--7 Are there more males or more females registered?
SELECT gender, SUM(num_registered) AS gender_reveal
FROM names
GROUP BY gender
ORDER BY gender_reveal DESC;
-- There are more male registrations

--8  What are the most popular male and female names overall (i.e., the most total registrations)?
SELECT name, gender, SUM(num_registered) AS name_affirming
FROM names
GROUP BY name, gender
ORDER BY name_affirming DESC;
-- James and Mary

--9 What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT name, gender, SUM(num_registered) AS oughties_names
FROM names
WHERE year >= 2000
	AND year <=2009
GROUP BY name, gender
ORDER BY oughties_names DESC;
--  The most popular names in the oughties were Jacob and Emily

--10 Which year had the most variety in names (i.e. had the most distinct names)?
SELECT year, COUNT(DISTINCT names) AS spice_of_life
FROM names
GROUP BY year
ORDER BY spice_of_life DESC
LIMIT 5;
-- 2008 had the most variety

--11  What is the most popular name for a girl that starts with the letter X?
SELECT name, SUM(num_registered) AS x_women
FROM names
WHERE gender = 'F'
	AND name LIKE 'X%'
GROUP BY name
ORDER BY x_women DESC
LIMIT 5;
-- Ximena is the most popular

--12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
SELECT COUNT(DISTINCT name) as byebye_quincy
FROM names 
WHERE name LIKE 'Q%' 
	AND name NOT LIKE '_u%';  
-- 46 names start with 'Q' and whose second leter is not 'u'.

--13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
SELECT name, SUM(num_registered) AS i_prefer_stehphan
FROM names 
WHERE name = 'Stephen' 
	OR name = 'Steven'
GROUP BY name
ORDER BY i_prefer_stehphan DESC;
-- Steven is the the most popular spelling with 1,286,951 registrations vs 860,972 registrations of Stephen

--14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?
SELECT name 
FROM names
GROUP BY name
HAVING COUNT(DISTINCT gender) = 2;
-- 10,773 Names of 98,400 names are unisex. That is, 10.95%

--15. How many names have made an appearance in every single year since 1880?
SELECT name AS ancient_ones
FROM names 
GROUP BY name
HAVING COUNT(DISTINCT year) = 139;
-- 921 names appeared in all years

--16. How many names have only appeared in one year?
SELECT name AS rare_ones
FROM names 
GROUP BY name
HAVING COUNT(DISTINCT year)=1;
--  21, 123 names only appeared in one year

--17. How many names only appeared in the 1950s?
SELECT name
FROM names
GROUP BY name
HAVING MIN(year) >= 1950
	AND MAX(year) <= 1959;
-- There were 661 names that only appeared in the 1950s

--18. How many names made their first appearance in the 2010s?
SELECT name
FROM names
GROUP BY name
HAVING MIN(year) >= 2010;
-- 11,270 names made their first appearence in the 2010s

--19. Find the names that have not be used in the longest.
SELECT name, MAX(year) AS last_year_used
FROM names
GROUP BY name
ORDER BY last_year_used;
-- 98,400 have not been used the longest.

--20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
--
