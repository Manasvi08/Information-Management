-- CREATE DATABASE sql_project;
USE sql_project;

CREATE TABLE instrument(
    instrument_name VARCHAR(30) NOT NULL,
    developed_in INTEGER NOT NULL DEFAULT 0,
    inventor VARCHAR(30) NOT NULL,
    classification VARCHAR(14) NOT NULL,
    PRIMARY KEY(instrument_name)
);

CREATE TABLE record_label(
	record_label_id VARCHAR(4) NOT NULL DEFAULT 0,
    record_name VARCHAR(30) NOT NULL UNIQUE,
    distributor VARCHAR(50) NOT NULL,
    country_origin VARCHAR(20) NOT NULL,
    founder VARCHAR(30) DEFAULT NULL,
    founded_in YEAR NOT NULL,
    PRIMARY KEY(record_label_id)
);

CREATE TABLE singer(
	singer_id INTEGER NOT NULL DEFAULT 0,
    singer_name VARCHAR(50) NOT NULL UNIQUE,
    country_of_birth VARCHAR(30) NOT NULL,
    years_active_till_present INTEGER DEFAULT NULL,
    gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
    age INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(singer_id)
);

CREATE TABLE genre(
    genre_id INTEGER NOT NULL DEFAULT 0,
	genre VARCHAR(17) NOT NULL unique,
    PRIMARY KEY(genre_id)
);

CREATE TABLE album(
	album_id INTEGER NOT NULL DEFAULT 0,
    album_name VARCHAR(30) NOT NULL UNIQUE,
    no_of_songs INTEGER NOT NULL,
    length_of_album TIME NOT NULL,
    producer VARCHAR(30) DEFAULT NULL,
    singer_name VARCHAR(50) NOT NULL,
    record_label_id VARCHAR(4) NOT NULL,
    date_released DATE NOT NULL,
    PRIMARY KEY(album_id),
    FOREIGN KEY (singer_name) REFERENCES singer(singer_name),
    FOREIGN KEY (record_label_id) REFERENCES record_label(record_label_id)
);

CREATE TABLE song(
	song_id INTEGER NOT NULL DEFAULT 0,
    song_name VARCHAR(30) NOT NULL UNIQUE,
    song_language VARCHAR(10) NOT NULL,
    duration TIME NOT NULL,
    album_name VARCHAR(30) NOT NULL UNIQUE,
    date_released DATE NOT NULL,
    PRIMARY KEY(song_id),
    FOREIGN KEY (album_name) REFERENCES album(album_name)
);

CREATE TABLE perform(
    song_name VARCHAR(30) NOT NULL,
	singer_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (song_name) REFERENCES song(song_name),
    FOREIGN KEY (singer_name) REFERENCES singer(singer_name)
);

CREATE TABLE belong(
    song_id INTEGER NOT NULL DEFAULT 0,
	genre_id INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (song_id) REFERENCES song(song_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE play(
    song_id INTEGER NOT NULL DEFAULT 0,
	instrument_name VARCHAR(30) NOT NULL,
    FOREIGN KEY (song_id) REFERENCES song(song_id),
    FOREIGN KEY (instrument_name) REFERENCES instrument(instrument_name)
);



ALTER TABLE play
  ADD genre_name VARCHAR(20);

insert into instrument values 
    ("Acoustic Guitar", 1796, "Christian Frederick Martin", "String"),
    ("Piano", 1700, "Bartolomeo Cristofori", "Keyboard"),
    ("Programmed Drums", 1957, "Harry Chamberlin", "Drum"),
    ("Banjo", 1700, "Joel Walker Sweeney", "chordophone "),
    ("Flute", 0900, "Theobald Boehm", "Woodwind"),
    ("Violin", 1500, "Andrea Amati", "chordophone"),
    ("Oboe", 1650, "Jacques Hotteterre", "Wind"),
    ("Trumpet", 1922, "Howard Carter", "Brass"),
    ("Soprano Saxophone", 1846, "Adolphe Sax", "Woodwind");

insert into record_label values 
	("AS12", "Asylum", "Warner Music Group", "United States", "David Geffen", 1971),
    ("BM05", "Big Machine", "Universal Music Group", "United States", "Scott Borchetta", 2004),
    ("RP34", "Republic", "Universal Music Group", "United States", "Monte Lipman", 1995),
    ("G09", "Geffen", "Interscope Geffen A&M", "United States", "David Geffen", 1980),
    ("TS78", "T-Series", "Music record label", "India", "Gulshan Kumar", 1983),
    ("UL11", "Universal Latin", "Universal Music Group", "United States", null , 2008),
    ("I55", "Island", "EMI records", "United Kingdom", "Chris Blackwell", 1959); 
    
 insert into singer values    
	(1, "Ed Sheeran", "England", 18, "Male", '1991-02-17',31),
    (2, "Taylor Swift", "United States", 18, "Female", '1989-12-13',32),
    (3, "Ruby Carr", "South Africa", null, "Female", '1997-04-01',24),
    (4, "Natalia Panzarella", "United States", null, "Female", '1997-02-17',25),
    (5, "Olivia Isabel Rodrigo", "United States", 17, "Female", '2003-02-20',19),
    (6, "Shilpa Rao", "India", 15, "Female", '1984-04-11',37),
    (7, "Sreerama Chandra Mynampati", "India", 14, "Male", '1989-01-19',33),
    (8, "Luis Alfonso Rodríguez López-Cepero", "Puerto Rico", 24, "Male", '1978-04-15',43),
    (9, "Shawn Peter Raul Mendes", "Canada", 9, "Male", '1998-08-08',23),
    (10, "Ariana Grande-Butera", "United States", 14, "Female", '1993-06-26',28);    

insert into genre values 
	(186, "Folk Pop"),
    (243, "Hip hop"),
    (873, "Country"),
    (342, "Soft rock"),
    (456, "R&B"),
    (372, "Reggaeton"),
    (546, "trap"),
    (83, "Pop"),
    (324, "Latin pop"),
    (765, "Electro pop");
    
insert into album values 
	(11, "x", 5, '00:50:23.000000',"Benny Blanco","Ed Sheeran", "AS12",'2014-06-20'),
    (22, "Red", 7, '01:05:09.000000',"Taylor Swift","Taylor Swift", "BM05",'2012-10-22'),
    (33, "Thank U, Next", 3, '00:41:11.000000',"Charles Anderson","Ariana Grande-Butera", "RP34",'2019-02-08'),
    (44, "÷", 5, '00:46:14.000000',"Benny Blanco","Ed Sheeran", "AS12",'2017-03-03'),
    (55, "Sour", 5, '00:34:41.000000',"Dan Nigro","Olivia Isabel Rodrigo", "G09",'2021-05-21'),
    (66, "Yeh Jawaani Hai Deewani", 10, '00:40:19.000000',"Karan Johar","Sreerama Chandra Mynampati", "TS78",'2013-04-29'),
    (77, "Vida", 5, '00:52:25.000000',"Mauricio Rengifo","Luis Alfonso Rodríguez López-Cepero", "UL11",'2019-02-01'),
    (88, "1989", 7, '00:48:41.000000',"Max Martin","Taylor Swift", "BM05",'2014-10-27'),
    (99, "illuminate", 3, '00:44:34.000000',"Jake Gosling","Shawn Peter Raul Mendes", "I55",'2016-09-23');    
    
insert into song values
	(101, "Photograph", "English", '00:04:19.000000',"x",'2015-05-11'),
    (202, "Red", "English", '00:03:40.000000',"Red",'2013-06-24'),
    (303, "7 Rings", "English", '00:02:58.000000',"Thank U, Next",'2019-01-18'), 
    (404, "Perfect", "English", '00:04:23.000000',"÷",'2017-09-26'), 
    (505, "Drivers License", "English", '00:04:02.000000',"Sour",'2021-01-08'), 
    (606, "Subanallah", "Hindi", '00:04:11.000000',"Yeh Jawaani Hai Deewani",'2013-05-31'), 
    (707, "Despacito", "Spanish", '00:03:47.000000',"Vida",'2017-01-12'),
    (808, "Blank Space", "English", '00:03:52.000000',"1989",'2014-11-10'),
    (909, "Treat you better", "English", '00:03:07.000000',"Illuminate",'2016-06-03'); 
    
insert into perform values 
	("Photograph","Ed Sheeran"),
    ("Red","Taylor Swift"),
    ("7 Rings","Ariana Grande-Butera"),
    ("Perfect","Ed Sheeran"),
    ("Drivers License","Olivia Isabel Rodrigo"),
    ("Subanallah","Shilpa Rao"),
    ("Subanallah","Sreerama Chandra Mynampati"),
    ("Despacito","Luis Alfonso Rodríguez López-Cepero"),
    ("Blank Space","Taylor Swift"),
    ("Treat You Better","Shawn Peter Raul Mendes");
    
insert into belong values 
	(101, 186),
    (202, 873),
    (202, 342),
    (303, 546),
    (303, 243),
    (303, 456),
    (404, 83),
    (707, 324),
    (707, 372),
    (808, 765);
    
insert into play values 
	(101, "Acoustic Guitar"),
    (101, "Piano"),
    (101, "Programmed Drums"),
    (202, "Banjo"),
    (202, "Acoustic Guitar"),
    (404, "Flute"),
    (404, "Violin"),
    (404, "Oboe");

CREATE VIEW `Latest Album Releases` AS
SELECT album.date_released, album.album_name, album.no_of_songs, album.producer
FROM album 
ORDER BY album.date_released DESC;


CREATE VIEW `Genre and Song` AS
SELECT singer.singer_name, singer.country_of_birth, singer.gender
FROM singer
WHERE singer.country_of_birth="United States";

CREATE VIEW `Album and Singer` AS
SELECT album.album_name, song.song_name, song.song_language
FROM song
INNER JOIN album
ON song.song_name=album.album_name;

CREATE VIEW record_label_security AS
SELECT *
FROM record_label
WHERE distributor = "Universal Music Group";
GRANT SELECT ON record_label_security TO XXX WITH GRANT OPTION;
 
CREATE TRIGGER  new_song_name 
BEFORE INSERT
ON song
FOR EACH ROW
SET NEW.song_name = new.song_id;

DELIMITER //
CREATE PROCEDURE get_song_names ()
BEGIN
SELECT song_name FROM song;
END//
DELIMITER //

show triggers in sql_project;
drop trigger new_song_name;

    
    

    
    
    
    
    






