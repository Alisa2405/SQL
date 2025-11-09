create table if not exists Genre (
	genre_id serial primary key,
	name varchar(60) not null
);

create table if not exists Artist (
	artist_id serial primary key,
	name varchar(60) not null
);

create table if not exists GenreArtist (
	genreartist_id serial primary key,
	genre_id integer not null references Genre(genre_id),
	artist_id integer not null references Artist(artist_id)
);

create table if not exists Album (
	album_id serial primary key,
	title varchar(60) not null,
	year integer
);

create table if not exists ArtistAlbum (
	artistalbum_id serial primary key,
	album_id integer not null references Album(album_id),
	artist_id integer not null references Artist(artist_id)
);

create table if not exists Track (
	track_id serial primary key,
	title varchar(60) not null,
	duration integer,
	album_id integer not null references Album(album_id)
);

create table if not exists Collection (
	collection_id serial primary key,
	title varchar(60) not null,
	year integer
);

create table if not exists CollectionTrack (
	collectiontrack_id serial primary key,
	collection_id integer not null references Collection(collection_id),
	track_id integer not null references Track(track_id)
);
