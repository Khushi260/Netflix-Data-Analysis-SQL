SELECT * FROM NETFLIX_DB;

--1. Count the Number of Movies vs TV Shows
SELECT TYPE, COUNT(*) FROM NETFLIX_DB
GROUP BY (1);

--2. Find the Most Common Rating for Movies and TV Shows
SELECT TYPE,RATING FROM (
	SELECT type, rating, total_count,
	    RANK() OVER (PARTITION BY type ORDER BY total_count DESC) AS rank
	FROM (
	    SELECT type, rating, COUNT(*) AS total_count
	    FROM netflix_db
	    GROUP BY type, rating
	) AS sub
	) WHERE RANK = 1;

--3. List All Movies Released in a Specific Year (e.g., 2020)
	SELECT DISTINCT TITLE FROM NETFLIX_DB
	WHERE TYPE = 'Movie' 
	AND RELEASE_YEAR = '2020';

--4.Find the Top 5 Countries with the Most Content on Netflix
	SELECT COUNTRY, COUNT(*) AS TOTAL_CONTENT
	FROM NETFLIX_DB
	WHERE COUNTRY IS NOT NULL
	GROUP BY 1
	ORDER BY TOTAL_CONTENT DESC
	LIMIT 5;

--5.Identify the Longest Movie
	SELECT TITLE, DURATION, SPLIT_PART(duration, ' ', 1)::INT AS TIME
	FROM NETFLIX_DB
	WHERE TYPE = 'Movie' AND DURATION IS NOT NULL
	ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC
	LIMIT 1;

--6. Find Content Added in the Last 5 Years
	SELECT *
	FROM NETFLIX_DB
	WHERE TO_DATE(DATE_ADDED, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--7.Find All Movies/TV Shows by Director 'Rajiv Chilaka'
	SELECT * FROM NETFLIX_DB
	WHERE DIRECTOR ILIKE '%Rajiv Chilaka%';

--8. List All TV Shows with More Than 5 Seasons
	SELECT * FROM NETFLIX_DB
	WHERE TYPE = 'TV Show' and SPLIT_PART(DURATION,' ',1):: INT > 5; 

--9. Count the Number of Content Items in Each Genre
	SELECT 
	    UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	    COUNT(*) AS total_content
	FROM NETFLIX_DB
	GROUP BY 1;
	
--10.Find each year and the average numbers of content release in India on netflix.

	SELECT 
	    country,
	    release_year,
	    COUNT(show_id) AS total_release,
	    ROUND(
	        COUNT(show_id)::numeric /
	        (SELECT COUNT(show_id) FROM NETFLIX_DB WHERE country = 'India')::numeric * 100, 2
	    ) AS avg_release
	FROM NETFLIX_DB
	WHERE country = 'India'
	GROUP BY country, release_year
	ORDER BY avg_release DESC
	LIMIT 5;

	
--11. List All Movies that are Documentaries
	SELECT * 
	FROM NETFLIX_DB
	WHERE listed_in LIKE '%Documentaries';

--12. Find All Content Without a Director
	SELECT * 
	FROM NETFLIX_DB
	WHERE director IS NULL;

--13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
	SELECT * 
	FROM NETFLIX_DB
	WHERE casts LIKE '%Salman Khan%'
	AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;

--14. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India
	SELECT UNNEST(STRING_TO_ARRAY(CASTS,',')) AS ACTOR,
		COUNT(*) AS TOTAL
	FROM NETFLIX_DB
	WHERE TYPE = 'Movie'
	AND COUNTRY = 'India'
	GROUP BY 1
	ORDER BY TOTAL DESC
	LIMIT 10;

--15. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
		SELECT CATEGORY, COUNT(*) AS CATEGORY_COUTN FROM (
		SELECT *,
		CASE WHEN DESCRIPTION ILIKE '%Kill%' OR DESCRIPTION ILIKE '%Violence%'
		THEN 'BAD' ELSE 'GOOD' END AS CATEGORY
		FROM NETFLIX_DB
		) GROUP BY 1;

