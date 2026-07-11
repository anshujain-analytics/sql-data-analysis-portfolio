Q 9 - Top 5 directors having rating more then average?
--SELECT avg(rating) from IMDBMovieData;
Select director, actors, rating from IMDBMovieData where rating > (SELECT avg(rating) from IMDBMovieData) order by rating limit 5;

Q 10 - Top 3 highest-rated movies per year
SELECT year, title, rating
FROM (
    SELECT 
        year,
        title,
        rating,
        RANK() OVER (PARTITION BY year ORDER BY rating DESC) AS rnk
    FROM IMDBMovieData
) t
WHERE rnk <= 3;

Q 11 - Director with highest average movie rating (min 3 movies)
SELECT director, AVG(rating) AS avg_rating, COUNT(*) AS total_movies
FROM imdb_movies
GROUP BY director
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC
LIMIT 1;

Q 12 - Movies earning above genre average revenue
SELECT title, genre, revenue_millions
FROM IMDBMovieData m1
WHERE revenue_millions > (
    SELECT AVG(revenue_millions)
    FROM IMDBMovieData m2
    WHERE m1.genre = m2.genre
);
