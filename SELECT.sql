--Задание 2

SELECT title, duration  FROM Track

ORDER BY duration DESC 

LIMIT 1;


SELECT title, duration  FROM Track

WHERE duration >= 210;


SELECT title, year  FROM Collection

WHERE year BETWEEN '2018' AND '2021';


SELECT name FROM Artist

WHERE name NOT LIKE '% %';


SELECT title FROM Track

WHERE title  ILIKE 'my %'

OR title ILIKE '% my'

OR title ILIKE '% my %'

OR title ILIKE 'my';





--Задание 3

SELECT g.name AS Genre, COUNT(ga.artist_id) AS artist_count 

FROM Genre g

LEFT JOIN GenreArtist ga ON g.genre_id = ga.genre_id

GROUP BY  g.genre_id, g.name

ORDER BY genre;


SELECT COUNT(t.track_id) AS track_count

FROM Track t

JOIN Album a ON t.album_id = a.album_id

WHERE a.year BETWEEN '2018' AND '2021';


SELECT a.title AS Album, AVG(t.duration) AS avg_duration 

FROM Album a

JOIN Track t ON a.album_id = t.album_id

GROUP BY  a.album_id, a.title

ORDER BY a.title;


SELECT ar.name FROM Artist ar

WHERE ar.artist_id NOT IN (

	SELECT aa.artist_id

	FROM ArtistAlbum aa

	JOIN Album a ON aa.album_id = a.album_id

	WHERE a.year = 2020

);


SELECT DISTINCT c.title 

FROM Collection c

JOIN CollectionTrack ct ON c.collection_id = ct.collection_id

JOIN Track t ON ct.track_id = t.track_id

JOIN Album a ON t.album_id = a.album_id

JOIN ArtistAlbum aa ON a.album_id = aa.album_id

JOIN Artist ar ON aa.artist_id = ar.artist_id

WHERE ar.name = 'Sher';
