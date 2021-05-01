show databases;

create database sheet_music_database;

use sheet_music_database;

show tables;

CREATE TABLE instruments (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE `groups` (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    date DATE
);

CREATE TABLE genres (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE type_write_of_compositions (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE type_of_musical_instruments (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE achivements (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    difficulty_of_obtaining ENUM('легко', 'средне', 'сложно') NOT NULL,
    description VARCHAR(256) NOT NULL UNIQUE
);

CREATE TABLE users (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL UNIQUE,
    avatar VARCHAR(256),
    password VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE mini_games (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL UNIQUE,
    difficult VARCHAR(20) NOT NULL
);

#ИЗМЕНЕНИЕ В ТАБЛИЦЕ
ALTER TABLE mini_games CHANGE COLUMN
difficult difficult ENUM('легко', 'средне', 'сложно') NOT NULL;


CREATE TABLE characteristics (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_instrument INT NOT NULL
);

#ИЗМЕНЕНИЕ В ТАБЛИЦЕ
ALTER TABLE characteristics ADD COLUMN
name VARCHAR(30) NOT NULL UNIQUE;


ALTER TABLE characteristics 
ADD CONSTRAINT fk_characteristics_instruments_id_instrument
FOREIGN KEY (id_instrument) REFERENCES instruments(id);


CREATE TABLE val_of_char (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_char INT NOT NULL
);

#ИЗМЕНЕНИЕ В ТАБЛИЦЕ
ALTER TABLE val_of_char ADD COLUMN
value int;


ALTER TABLE val_of_char 
ADD CONSTRAINT fk_val_of_char_characteristics_id_char
FOREIGN KEY (id_char) REFERENCES characteristics(id);


CREATE TABLE user_and_char (
    id_user INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    val INT,
    id_val_of_char INT NOT NULL
);

#RENAME
ALTER TABLE user_and_char
RENAME COLUMN val TO val_num;


ALTER TABLE user_and_char  
ADD CONSTRAINT fk_user_and_char_val_of_char_id_val_of_char
FOREIGN KEY (id_val_of_char) REFERENCES val_of_char(id);

ALTER TABLE user_and_char 
ADD CONSTRAINT fk_user_and_char_users_id_user
FOREIGN KEY (id_user) REFERENCES users(id);

#RENAME
ALTER TABLE user_and_char
RENAME COLUMN id_user TO id;

#ИЗМЕНЕНИЯ В ТАБЛИЦЕ
ALTER TABLE user_and_char 
DROP COLUMN id;

#ИЗМЕНЕНИЯ В ТАБЛИЦЕ
ALTER TABLE user_and_char 
ADD COLUMN id_user INT PRIMARY KEY NOT NULL;


CREATE TABLE users_and_achivements (
    id_of_user INT NOT NULL,
    id_of_achivement INT NOT NULL
);

#ИЗМЕНЕНИЯ В ТАБЛИЦЕ
ALTER TABLE users_and_achivements ADD
PRIMARY KEY(id_of_user, id_of_achivement);


ALTER TABLE users_and_achivements  
ADD CONSTRAINT fk_users_and_achivements_users_id_of_user
FOREIGN KEY (id_of_user) REFERENCES users(id);

ALTER TABLE users_and_achivements 
ADD CONSTRAINT fk_users_and_achivements_achivements_id_of_achivement
FOREIGN KEY (id_of_achivement) REFERENCES achivements(id);

CREATE TABLE achivements_and_mini_games (
    id_of_achivement INT NOT NULL,
    id_of_mini_games INT NOT NULL
);

#ИЗМЕНЕНИЯ В ТАБЛИЦЕ
ALTER TABLE achivements_and_mini_games ADD
PRIMARY KEY(id_of_achivement, id_of_mini_games);


ALTER TABLE achivements_and_mini_games  
ADD CONSTRAINT fk_achivements_and_mini_games_mini_games_id_of_mini_games
FOREIGN KEY (id_of_mini_games) REFERENCES mini_games(id);

ALTER TABLE achivements_and_mini_games 
ADD CONSTRAINT fk_achivements_and_mini_games_achivements_id_of_achivement
FOREIGN KEY (id_of_achivement) REFERENCES achivements(id);


CREATE TABLE users_and_mini_games (
    id_of_user INT NOT NULL,
    id_of_mini_games INT NOT NULL,
    date_time DATETIME NOT NULL,
    PRIMARY KEY (id_of_user , id_of_mini_games)
);

ALTER TABLE users_and_mini_games  
ADD CONSTRAINT fk_users_and_mini_games_mini_games_id_of_mini_games
FOREIGN KEY (id_of_mini_games) REFERENCES mini_games(id);

ALTER TABLE users_and_mini_games  
ADD CONSTRAINT fk_users_and_mini_games_users_id_of_user
FOREIGN KEY (id_of_user) REFERENCES users(id);

CREATE TABLE composers (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    avatar VARCHAR(256),
    id_of_music_group INT
);

ALTER TABLE composers  
ADD CONSTRAINT fk_composers_groups_id_of_music_group
FOREIGN KEY (id_of_music_group) REFERENCES `groups`(id);


CREATE TABLE compositions (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    date_of_creation DATE NOT NULL,
    difficult VARCHAR(15) NOT NULL,
    temp INT NOT NULL,
    id_of_composer INT,
    id_of_group INT
);

#ИЗМЕНЕНИЕ В ТАБЛИЦЕ
ALTER TABLE compositions CHANGE COLUMN
difficult difficult ENUM('легко', 'средне', 'сложно') NOT NULL;



ALTER TABLE compositions  
ADD CONSTRAINT fk_compositions_groups_id_of_group
FOREIGN KEY (id_of_group) REFERENCES `groups`(id);

ALTER TABLE compositions  
ADD CONSTRAINT fk_compositions_composers_id_of_composer
FOREIGN KEY (id_of_composer) REFERENCES composers(id);

CREATE TABLE ratings (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    review VARCHAR(256) NOT NULL,
    grade TINYINT NOT NULL,
    id_of_user INT NOT NULL,
    id_of_composition INT NOT NULL
);

ALTER TABLE ratings  
ADD CONSTRAINT fk_ratings_compositions_id_of_composition
FOREIGN KEY (id_of_composition) REFERENCES compositions(id);

ALTER TABLE ratings  
ADD CONSTRAINT fk_ratings_users_id_of_user
FOREIGN KEY (id_of_user) REFERENCES users(id);

#ИЗМЕНЕНИЯ В ТАБЛИЦЕ
alter table ratings
ADD CONSTRAINT CHK_grade CHECK (grade>=0 AND grade<=10);


CREATE TABLE musical_instruments (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    id_of_type_of_music_instrument INT NOT NULL,
    type INT NOT NULL
);

#ИЗМЕНЕНИЯ В ТАБЛИЦЕ
alter table musical_instruments
DROP COLUMN type;


ALTER TABLE musical_instruments  
ADD CONSTRAINT fk_musical_instruments_type_id_of_type_of_music_instrument
FOREIGN KEY (id_of_type_of_music_instrument) REFERENCES type_of_musical_instruments(id);


CREATE TABLE mini_games_and_musical_instruments (
    id_of_music_instrument INT NOT NULL,
    id_of_mini_game INT NOT NULL,
    PRIMARY KEY (id_of_music_instrument , id_of_mini_game)
);

ALTER TABLE mini_games_and_musical_instruments  
ADD CONSTRAINT fk_mini_games_and_musical_instrument_id_of_music_instrument
FOREIGN KEY (id_of_music_instrument) REFERENCES musical_instruments(id);

ALTER TABLE mini_games_and_musical_instruments 
ADD CONSTRAINT fk_mini_games_and_musical_instruments_mini_games_id_of_mini_game
FOREIGN KEY (id_of_mini_game) REFERENCES mini_games(id);


CREATE TABLE compositions_and_musical_instruments (
    id_of_music_instrument INT NOT NULL,
    id_of_composition INT NOT NULL,
    PRIMARY KEY (id_of_music_instrument , id_of_composition)
);

ALTER TABLE compositions_and_musical_instruments  
ADD CONSTRAINT fk_compositions_and_musical_instruments_id_of_music_instrument
FOREIGN KEY (id_of_music_instrument) REFERENCES musical_instruments(id);

ALTER TABLE compositions_and_musical_instruments  
ADD CONSTRAINT fk_compositions_and_musical_instruments_id_of_composition
FOREIGN KEY (id_of_composition) REFERENCES compositions(id);


CREATE TABLE users_and_compositions (
    id_of_user INT NOT NULL,
    id_of_composition INT NOT NULL,
    PRIMARY KEY (id_of_user , id_of_composition)
);

ALTER TABLE users_and_compositions  
ADD CONSTRAINT fk_users_and_compositions_users_id_of_user
FOREIGN KEY (id_of_user) REFERENCES users(id);

ALTER TABLE users_and_compositions  
ADD CONSTRAINT fk_users_and_compositions_compositions_id_of_composition
FOREIGN KEY (id_of_composition) REFERENCES compositions(id);


CREATE TABLE compositions_and_genres (
    id_of_genre INT NOT NULL,
    id_of_composition INT NOT NULL,
    PRIMARY KEY (id_of_genre , id_of_composition)
);

ALTER TABLE compositions_and_genres  
ADD CONSTRAINT fk_compositions_and_genres_genres_id_of_genre
FOREIGN KEY (id_of_genre) REFERENCES genres(id);

ALTER TABLE compositions_and_genres  
ADD CONSTRAINT fk_compositions_and_genres_compositions_id_of_composition
FOREIGN KEY (id_of_composition) REFERENCES compositions(id);


CREATE TABLE compositions_and_type_write_of_compositions (
    id_of_type_note INT NOT NULL,
    id_of_composition INT NOT NULL,
    PRIMARY KEY (id_of_type_note , id_of_composition)
);

ALTER TABLE compositions_and_type_write_of_compositions  
ADD CONSTRAINT fk_compositions_and_type_write_of_compositions_id_of_type_note
FOREIGN KEY (id_of_type_note) REFERENCES type_write_of_compositions(id);

ALTER TABLE compositions_and_type_write_of_compositions  
ADD CONSTRAINT fk_compositions_and_type_write_of_compositions_id_of_composition
FOREIGN KEY (id_of_composition) REFERENCES compositions(id);


#Добавление записей
INSERT INTO type_of_musical_instruments(name) VALUES
('Струнный'),
('Клавишный');

INSERT INTO musical_instruments(name, id_of_type_of_music_instrument) VALUES
('Пианино', 2),
('Гитара', 1);

INSERT INTO `groups`(name, date) VALUES
('Dragonforce', 19990000);

INSERT INTO compositions(name, date_of_creation, difficult, temp, id_of_composer, id_of_group) VALUES
('Through the Fire and Flames', 20060803, 'сложно', 200, NULL, 1);

INSERT INTO genres(name) VALUES
('Пауэр-метал');

INSERT INTO compositions_and_genres(id_of_genre, id_of_composition) VALUES
(1, 1);

INSERT INTO users(name, avatar, password, email) VALUES
('admin', NULL, '123956', 'admin@gmail.com');

INSERT INTO users_and_compositions(id_of_user, id_of_composition) VALUES
(1, 1);

#удаление таблиц
ALTER TABLE users_and_achivements 
DROP CONSTRAINT fk_users_and_achivements_achivements_id_of_achivement;

ALTER TABLE achivements_and_mini_games 
DROP CONSTRAINT fk_achivements_and_mini_games_achivements_id_of_achivement;

DROP TABLE achivements;

DROP TABLE achivements_and_mini_games;

ALTER TABLE val_of_char  
DROP CONSTRAINT fk_val_of_char_characteristics_id_char;

DROP TABLE characteristics;

ALTER TABLE compositions  
DROP CONSTRAINT fk_compositions_composers_id_of_composer;

DROP TABLE composers;

DROP TABLE compositors;

ALTER TABLE ratings   
DROP CONSTRAINT fk_ratings_compositions_id_of_composition;

ALTER TABLE compositions_and_genres   
DROP CONSTRAINT fk_compositions_and_genres_compositions_id_of_composition;

ALTER TABLE compositions_and_musical_instruments   
DROP CONSTRAINT fk_compositions_and_musical_instruments_id_of_composition;

ALTER TABLE compositions_and_type_write_of_compositions   
DROP CONSTRAINT fk_compositions_and_type_write_of_compositions_id_of_composition;

ALTER TABLE users_and_compositions   
DROP CONSTRAINT fk_users_and_compositions_compositions_id_of_composition;

DROP TABLE compositions;

DROP TABLE compositions_and_genres;

DROP TABLE compositions_and_musical_instruments;

DROP TABLE compositions_and_type_write_of_compositions;

DROP TABLE genres;

DROP TABLE `groups`;

DROP TABLE instruments;

ALTER TABLE users_and_mini_games   
DROP CONSTRAINT fk_users_and_mini_games_mini_games_id_of_mini_games;

ALTER TABLE mini_games_and_musical_instruments   
DROP CONSTRAINT fk_mini_games_and_musical_instruments_mini_games_id_of_mini_game; 

DROP TABLE mini_games;

DROP TABLE mini_games;

DROP TABLE mini_games_and_musical_instruments;

DROP TABLE musical_instruments;

DROP TABLE ratings;

DROP TABLE type_of_musical_instruments;

DROP TABLE type_write_of_compositions;

DROP TABLE user_and_char;

ALTER TABLE users_and_achivements   
DROP CONSTRAINT fk_users_and_achivements_users_id_of_user;

ALTER TABLE users_and_compositions   
DROP CONSTRAINT fk_users_and_compositions_users_id_of_user;

ALTER TABLE users_and_mini_games   
DROP CONSTRAINT fk_users_and_mini_games_users_id_of_user;

DROP TABLE users;

DROP TABLE users_and_achivements;

DROP TABLE users_and_compositions;

DROP TABLE users_and_mini_games;

DROP TABLE val_of_char;

DROP DATABASE sheet_music_database;