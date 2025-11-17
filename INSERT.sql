INSERT INTO Genre(name) 

VALUES('Pop'), ('Rock'), ('Jazz');


INSERT INTO Artist(name) 

VALUES('Ariana Grande'), ('Sher'), ('Linkin Park'), ('Louis Armstrong');


INSERT INTO GenreArtist(artist_id, genre_id) 

VALUES(1, 1), (2, 1), (3, 2), (4, 3);


INSERT INTO Album(title, year) 

VALUES('Positions', 2020), ('Gold', 2005), ('Heavy', 2017), ('Gospel', 1958);


INSERT INTO ArtistAlbum(artist_id, album_id) 

VALUES(1, 1), (2, 2), (3, 3), (4, 4);


INSERT INTO Track(title, duration, album_id) 

VALUES('Hello', 202, 1), ('So What', 545, 1), ('Emmy', 201, 2), ('Love', 350, 2), ('Green', 350, 3), ('More', 359, 4);


INSERT INTO Collection(title, year) 

VALUES('Top 100', 2020), ('Top 30', 2005), ('Top 50', 2017), ('Mix', 2015);


INSERT INTO CollectionTrack(collection_id, track_id) 

VALUES(1, 1), (1, 2), (2, 2), (3, 3), (3, 1), (4, 2), (4, 4), (4, 5), (4, 6);
