show databases;

use games_database;

show tables;


-- Функциональные требования 

#Показать игры заданного разработчика
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM companies_to_games
JOIN games ON games.Id = companies_to_games.Id_game
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Разработчик') types_company ON types_company.Id = companies_to_games.Id_type_company
JOIN(SELECT * FROM companies WHERE companies.Name = 'Rockstar Games' ) companies ON companies.Id = companies_to_games.Id_company;

#Показать игры заданного издателя
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM companies_to_games
JOIN games ON games.Id = companies_to_games.Id_game
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Издатель') types_company ON types_company.Id = companies_to_games.Id_type_company
JOIN(SELECT * FROM companies WHERE companies.Name = 'Rockstar Games' ) companies ON companies.Id = companies_to_games.Id_company;

#Показать игры на заданной платформе
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM platforms_to_games
JOIN games ON games.Id = platforms_to_games.Id_game
JOIN(SELECT * FROM platforms WHERE platforms.Name = 'Windows') platforms ON platforms.Id = platforms_to_games.Id_platform;

#Показать игры заданного жанра
SELECT games.Name
FROM  genres_to_games
JOIN games ON games.Id = genres_to_games.Id_game
JOIN(SELECT * FROM genres WHERE genres.Name = 'action') genres ON genres.Id = genres_to_games.Id_genre;

#Показать игры с заданным режимом игры
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM game_modes_to_games
JOIN games ON games.Id = game_modes_to_games.Id_game
JOIN(SELECT * FROM game_modes WHERE game_modes.Name = 'однопользовательский') game_modes ON game_modes.Id = game_modes_to_games.Id_game_mode;

#Показать игры в заданной серии игр
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
JOIN(SELECT * FROM game_series WHERE game_series.Name = 'Red Dead') game_series ON game_series.Id =  games.Id_Game_series;

#Показать игры на заданном движке
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
JOIN(SELECT * FROM engines WHERE engines.Name = 'RAGE') engines ON engines.Id =  games.Id_engine;

#Рассчитать среднюю оценку заданной игры
SELECT AVG(reviews.Rating) 
FROM reviews
JOIN(SELECT * FROM games WHERE games.Name = 'The Witcher 3') games ON reviews.id_Game = games.Id;

#Рассчитать кол-во игр в заданной серии игр
SELECT COUNT(games.Id) AS Count_games
FROM games
JOIN(SELECT * FROM game_series WHERE game_series.Name = 'Red Dead') game_series ON games.Id_Game_series = game_series.Id;

#Рассчитать кол-во сотрудников в студии разработки
SELECT COUNT(id_company) AS Count_staff
FROM staff
JOIN(SELECT * FROM companies WHERE companies.Name = 'CD Projekt RED') companies ON companies.Id = staff.Id_company;

#Рассчитать кол-во игр заданного жанра у заданного разработчика
SELECT COUNT(games.Id) AS Count_games
FROM games
JOIN(SELECT companies_to_games.Id_game FROM companies_to_games
	JOIN(SELECT * FROM companies WHERE companies.Name = 'Rockstar Games') companies ON companies_to_games.Id_company = companies.Id
	JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Разработчик') types_company ON companies_to_games.Id_type_company = types_company.Id) companies_to_games ON companies_to_games.Id_game = games.Id
JOIN(SELECT genres_to_games.Id_game FROM  genres_to_games
	JOIN(SELECT * FROM genres WHERE genres.Name = 'action') genres ON genres_to_games.Id_genre = genres.Id) genres_to_games ON genres_to_games.Id_game = games.Id;

#Рассчитать кол-во игр на заданной платформе у заданного разработчика
SELECT COUNT(games.Id) AS Count_games
FROM games
JOIN(SELECT companies_to_games.Id_game FROM companies_to_games
	JOIN(SELECT * FROM companies WHERE companies.Name = 'Rockstar Games') companies ON companies_to_games.Id_company = companies.Id
	JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Разработчик') types_company ON companies_to_games.Id_type_company = types_company.Id) companies_to_games ON companies_to_games.Id_game = games.Id
JOIN(SELECT platforms_to_games.Id_game FROM platforms_to_games
	JOIN(SELECT * FROM platforms WHERE platforms.Name = 'Windows') platforms ON platforms_to_games.Id_platform = platforms.Id) platforms_to_games ON platforms_to_games.Id_game = games.Id;

#Рассчитать среднюю оценку по играм у заданного разработчика
SELECT AVG(reviews.Rating) AS Average_rating
FROM companies_to_games
JOIN games ON games.Id = companies_to_games.Id_game
JOIN(SELECT * FROM companies WHERE companies.Name = 'CD Projekt RED') companies ON companies_to_games.Id_company = companies.Id 
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Разработчик' ) types_company ON companies_to_games.Id_type_company = types_company.Id
JOIN reviews ON reviews.Id_Game = games.Id;

#Показать игры, выходящие в ближайший год
SELECT DISTINCT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
JOIN(SELECT * FROM platforms_to_games WHERE YEAR(platforms_to_games.Release_date) = 2019) platforms_to_games ON games.Id = platforms_to_games.Id_game;

#Показать игры с заданным рейтингом
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
JOIN(SELECT AVG(reviews.Rating), reviews.Id_Game
	FROM reviews
	GROUP BY reviews.Id_Game
	HAVING AVG(reviews.Rating) = 9) reviews 
ON games.Id = reviews.Id_Game;


-- update запросы

#Изменить отзыв с индексом 1
UPDATE reviews
SET Review_text = 'Best game!', Date = '20190415105401', Id_User = 5, Id_Game = 5
WHERE Id = 1;

#Изменить пароль у пользователя с логином Blee
UPDATE users
SET users.Password = 'l;kjadj1'
WHERE users.Login = 'Blee';

#Изменить сайт у компании Black Isle Studios
UPDATE companies
SET Site_URL = 'http://www.blackisle.com/'
WHERE Name = 'Black Isle Studios';

#Изменить название жанра
UPDATE genres
SET Name = 'strategy in real-time'
WHERE Name = 'strategy in Real-Time';

#Изменить оценку у отзыва с 17 айди
UPDATE reviews
SET Rating = 7
WHERE Id = 17;


-- DELETE с WHERE

INSERT INTO age_ratings(name) VALUES
('PEG: 11');
DELETE FROM age_ratings WHERE name = 'PEG: 11';

INSERT INTO users(name, login, password) VALUES
('sadasfasga', 'login', 'password1234');
DELETE FROM users WHERE login = 'login';

INSERT INTO companies(name, Location, Date_of_foundation) VALUES
('Asgasd', 'США', 20310000),
('Рфывфыв', 'Россия', 20310000);
DELETE FROM companies WHERE Site_URL IS NULL;

INSERT INTO languages_to_games(id_game, id_language, id_type_language) VALUES
(10, 1, 2);
DELETE FROM languages_to_games WHERE id_game = 10 AND id_language = 1 AND id_type_language = 2;

INSERT INTO game_modes_to_games(id_game, id_game_mode) VALUES
(6, 2);
DELETE FROM game_modes_to_games WHERE id_game = 6 AND id_game_mode = 2;


-- select запросы

#Вывод отзывов написанный за этот год
SELECT reviews.Review_text
FROM reviews
WHERE YEAR(reviews.Date) = 2021;

#Вывод игр анонсированные в заданный год
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
WHERE YEAR(games.Date_announce) = 2012;

#Вывод компаний находящиеся в заданной стране
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies
WHERE companies.Location = 'США';

#Вывод игр имеющие сайт
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
WHERE games.Game_website_URL IS NOT NULL;

#Вывод компаний имеющие сайт
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies
WHERE companies.Site_URL IS NOT NULL;

#Вывод игр не имеющие игровую серию
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
WHERE games.Id_Game_series IS NULL;

#Вывод всех отзывов в заданном промежутке оценок
SELECT reviews.Rating, reviews.Review_Text, reviews.Date 
FROM reviews
WHERE reviews.Rating BETWEEN 5 AND 9;

#Вывод сотрудников с заданным именем
SELECT Name, Surname, Post
FROM staff
WHERE Name = "Роб";

#Вывод айди игр, которые выпустились в 2020 году или 2019 году
SELECT DISTINCT Id_game
FROM platforms_to_games
WHERE YEAR(Release_date) = 2020 OR YEAR(Release_date) = 2019; 

#Вывести игры с заданным айди движка
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
WHERE games.Id_engine = 1;

#Вывести сотрудников с заданным айди компании
SELECT Name, Surname, Post
FROM staff
WHERE id_company = 3;

#Вывести отзывы с заданным айди пользователя
SELECT Rating, Review_Text, Date 
FROM reviews
WHERE id_user = 5;

#Вывести айди игр с заданным айди жанра
SELECT Id_game
FROM genres_to_games
WHERE id_genre = 11;

#Вывести строки с заданным айди типа языка и айди языка
SELECT *
FROM languages_to_games
WHERE id_type_language = 2 AND id_language = 1;

#Вывести строки с заданным айди типа компании и айди компании
SELECT *
FROM companies_to_games
WHERE id_type_company = 1 AND id_company = 4;

#Вывести игры с заданной серией игр
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM games
WHERE id_game_series = 1;

#Вывести отзывы написанные в заданный день
SELECT reviews.Rating, reviews.Review_Text, reviews.Date 
FROM reviews
WHERE date(Date) = '2020-05-16';

#Вывод компаний созданный в заданный год
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies
WHERE YEAR(Date_of_foundation) = 1996;

#Вывод всех строк таблицы игры
SELECT *
FROM games;

#Вывод всех сотрудников имеющие заданную должность
SELECT Name, Surname, Post
FROM staff
WHERE Post = 'Генеральный директор';


-- like запросы

#Вывести всех директоров в сотрудниках
SELECT * FROM staff
WHERE Post LIKE '%директор%';

#Вывести игры имеющие заданную цифру в названии
SELECT Name
FROM games
WHERE Name LIKE '%2%';

#Вывести пользователей имеющие заданные последовательности символов в пароле
SELECT * FROM users
WHERE password LIKE '%123%';

#Вывести имя и фамилии сотрудников
SELECT CONCAT(surname, " ", name) AS full_name
FROM staff;

#Вывести все серии заданной платформы
SELECT Name
FROM platforms
WHERE Name LIKE '%Playstation%';


-- SELECT INTO или INSERT SELECT 

CREATE TABLE companies_from_usa (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(30) NOT NULL UNIQUE,
    Location VARCHAR(25) NOT NULL,
    Date_of_foundation DATE,
    Site_URL VARCHAR(255) UNIQUE
);

CREATE TABLE games_announced_in_2012 (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Brief_description VARCHAR(500),
    Date_announce DATE,
    Trailer_URL VARCHAR(250),
    Game_cover_URL VARCHAR(250),
    Game_website_URL VARCHAR(250),
    Id_Engine INT,
    Id_Game_series INT
);

#Скопировать в новую таблицу компании, которые находятся в США
INSERT companies_from_usa(Id, Name, Location, Date_of_foundation, Site_URL)
SELECT *
FROM companies
WHERE Location = 'США';

#Скопировать в новую таблицу игры, которые анонсированы в 2012 году
INSERT games_announced_in_2012(Id, Name, Brief_description, Date_announce, Trailer_URL, Game_cover_URL, Game_website_URL, Id_Engine, Id_Game_series)
SELECT *
FROM games
WHERE YEAR(Date_announce) = 2012;


-- join запросы

#Вывод языков интерфейса у заданной игры
SELECT languages.Name AS language_name
FROM languages_to_games
JOIN languages ON languages.Id = languages_to_games.Id_language
JOIN(SELECT * FROM games WHERE games.Name = 'Red dead redemption 2') games ON languages_to_games.Id_game = games.Id
JOIN(SELECT * FROM types_language WHERE types_language.Name = 'Интерфейс' ) types_language ON languages_to_games.Id_type_language = types_language.Id;

#Вывод таблицы сотношения названий игр к названиям рейтингов
SELECT games.Name as Name_game, age_ratings.Name as Name_age_rating
FROM age_ratings_to_games
JOIN age_ratings ON age_ratings_to_games.Id_age_rating = age_ratings.Id
JOIN games ON age_ratings_to_games.Id_game = games.Id;

#Вывод имен и фамилий сотрудников заданной компании
SELECT staff.Name, staff.Surname
FROM staff
JOIN(SELECT * FROM companies WHERE companies.Name = 'Rockstar Games') companies ON staff.Id_company = companies.Id;

#Вывод текстов и оценки отзывов и названия игры, которой был написан отзыв, заданного пользователя
SELECT reviews.Rating, reviews.Review_text, games.Name as Name_game
FROM reviews
JOIN(SELECT * FROM users WHERE users.Name = 'Grey') users ON reviews.Id_User = users.Id
JOIN games ON games.Id = reviews.Id_Game;

#Вывод всех компаний являющиеся издателями
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies_to_games
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Издатель') types_company ON companies_to_games.Id_type_company = types_company.Id
JOIN companies ON companies.Id = companies_to_games.Id_company;

#Вывод всех жанров заданной игры
SELECT genres.Name
FROM genres_to_games
JOIN(SELECT * FROM games WHERE games.Name = 'Red dead redemption 2') games ON genres_to_games.Id_game = games.Id
JOIN genres ON genres.Id = genres_to_games.Id_genre;

#Вывод издателей заданной игры
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies_to_games
JOIN(SELECT * FROM games WHERE games.Name = 'Warcraft 3: The Frozen Throne') games ON games.Id = companies_to_games.Id_game
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Издатель') types_company ON companies_to_games.Id_type_company = types_company.Id
JOIN companies ON companies.Id = companies_to_games.Id_company;

#Вывод игр заданного возрастного рейтинга
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM age_ratings_to_games
JOIN games ON games.Id = age_ratings_to_games.Id_game
JOIN(SELECT * FROM age_ratings WHERE age_ratings.Name = 'ESRB: M') age_ratings ON age_ratings_to_games.Id_age_rating = age_ratings.Id;

#Вывод игр на заданном языке
SELECT distinct games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM languages_to_games
JOIN(SELECT * FROM languages WHERE languages.Name = 'Английский') languages ON languages_to_games.Id_language = languages.Id
JOIN games ON games.Id = languages_to_games.Id_game;

#Вывод компании, в которой работает заданный сотрудник
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies
JOIN(SELECT * FROM staff WHERE staff.Name = 'Роб') staff ON companies.Id = staff.Id_company;

#Вывод всех платформ заданной игры
SELECT platforms.Name
FROM platforms_to_games
JOIN(SELECT * FROM games WHERE games.Name = 'Red dead redemption 2') games ON games.Id = platforms_to_games.Id_game
JOIN platforms ON platforms.Id = platforms_to_games.Id_platform;

#Вывод всех разработчиков у зданной игры 
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies_to_games
JOIN(SELECT * FROM games WHERE games.Name = 'The Witcher 3') games ON games.Id = companies_to_games.Id_game
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Разработчик') types_company ON types_company.Id = companies_to_games.Id_type_company
JOIN companies ON companies.Id = companies_to_games.Id_company;

#Вывод игр имеющие один из двух жанров
SELECT games.Name, games.Brief_description, games.Date_announce, games.Game_cover_URL, games.Game_website_URL
FROM genres_to_games
JOIN(SELECT * FROM genres WHERE genres.Name = 'action' OR genres.Name = 'strategy in real-time') genres ON genres_to_games.Id_genre = genres.Id
JOIN games ON games.Id = genres_to_games.Id_game;

#Вывод всех пользователей, кто не оставил отзывы об играх
SELECT users.Name, users.Login, users.Password
FROM users
LEFT JOIN reviews ON reviews.Id_user = users.Id
WHERE reviews.Id_user IS NULL;

#Вывод всех серий игр, в которых нет игр
SELECT game_series.Name
FROM games
RIGHT JOIN game_series ON games.Id_game_series = game_series.Id
WHERE games.Id_game_series IS NULL;

#Вывод всех сочетаний игр и компаний
SELECT games.Name AS game_name, companies.Name AS company_name
FROM games
CROSS JOIN companies;

#Вывод таблицы соотношения игр к режимам игр
SELECT games.name_game, games.Brief_description, games.Date_announce, games.Trailer_URL, games.Game_cover_URL, games.Game_website_URL, game_modes.name_game_mode
FROM game_modes_to_games
NATURAL JOIN(SELECT Id AS Id_game, Name AS name_game, Brief_description, Date_announce, Trailer_URL, Game_cover_URL, Game_website_URL FROM games) games
NATURAL JOIN(SELECT Id AS Id_game_mode, Name AS name_game_mode FROM game_modes) game_modes;

#Вывод таблицы соотношения компаний и игры
SELECT games.name_game, companies.name_company, types_company.name_type_company
FROM companies_to_games
NATURAL JOIN(SELECT Id AS Id_game, Name AS name_game, Brief_description, Date_announce, Trailer_URL, Game_cover_URL, Game_website_URL FROM games) games
NATURAL JOIN(SELECT Id AS Id_company, Name AS name_company, Location, Date_of_foundation FROM companies) companies
NATURAL JOIN(SELECT Id AS Id_type_company, Name AS name_type_company FROM types_company) types_company;

#Вывод всех сочетаний языков и игр
SELECT games.Name AS name_game, languages.Name AS name_language
FROM games
CROSS JOIN languages;

#Вывод всех сочетаний пользователей и игр к которым они могут написать отзывы
SELECT games.Name AS name_game, users.Name AS name_user
FROM users
CROSS JOIN games;


-- GROUP BY

#Вывести id платформ которые имеют больше заданного кол-во игр
SELECT Id_platform, COUNT(Id_game) AS count_games
FROM platforms_to_games
GROUP BY Id_platform
HAVING count_games > 2;

#Вывести Id языков и кол-во игр на заданном языке
SELECT Id_language, COUNT(Id_game) AS count_games
FROM languages_to_games
GROUP BY Id_language;

#Вывести страны и кол-во компаний в этих странах
SELECT Location, COUNT(Id) AS count_companies
FROM companies
GROUP BY Location;

#Вывести средние оценки для каждой игры
SELECT Id_game, AVG(Rating) AS average_rating
FROM reviews
GROUP BY Id_game;

#Вывести средние оценки каждого пользователя
SELECT Id_user, AVG(Rating) AS average_rating
FROM reviews
GROUP BY id_user;

#Вывести id движка и кол-во игр на данном движке
SELECT Id_engine, COUNT(Id) AS count_games
FROM games
WHERE Id_engine IS NOT NULL
GROUP BY Id_engine;

#Вывести id жанра и кол-во игр в заданном жанре
SELECT Id_genre, COUNT(Id_game) AS count_games
FROM genres_to_games
GROUP BY Id_genre;

#Вывести id типа компании и кол-во компаний кажого типа
SELECT Id_type_company, COUNT(Id_company) AS count_company
FROM companies_to_games
GROUP BY Id_type_company;

#Вывести максимальную оценкую всех пользовтелей всех отзывов, что написал пользователь
SELECT Id_user, MAX(Rating) AS max_rating
FROM reviews
GROUP BY Id_user;

#Вывести id компании и кол-во сотрудников в кажой компании
SELECT Id_company, COUNT(Id) AS count_staff
FROM staff
GROUP BY Id_company;

#Вывести оценки и кол-во пользователей поставивших данные оценки 
SELECT Rating, COUNT(Id_user) AS count_users
FROM reviews
GROUP BY Rating;

#Вывести id возрастного рейтинга и кол-во игр с данным рейтингом
SELECT Id_age_rating, COUNT(Id_game) AS count_games
FROM age_ratings_to_games
GROUP BY Id_age_rating;

#Вывести игры имеюищие средний рейтинг большее 5
SELECT Id_game, AVG(Rating) AS average_rating
FROM reviews
GROUP BY Id_game
HAVING average_rating > 5;

#Вывести id серий игр и кол-во игр в этих сериях
SELECT Id_game_series, COUNT(Id)
FROM games
WHERE Id_game_series IS NOT NULL
GROUP BY Id_game_series;

#Вывести id игрового режима и кол-во игр в каждом режиме игры
SELECT Id_game_mode, COUNT(Id_game)
FROM game_modes_to_games
GROUP BY Id_game_mode;

#Вывести id платформ и кол-во игр на каждой платформе
SELECT Id_platform, COUNT(Id_game) AS count_games
FROM platforms_to_games
GROUP BY Id_platform;

#Вывести id компаний и кол-во игр для каждой компании
SELECT Id_company, COUNT(Id_game) AS count_games
FROM companies_to_games
GROUP BY Id_company;

#Вывести id игр и кол-во языков у каждой игры
SELECT Id_game, COUNT(Id_language) AS count_languages
FROM languages_to_games
WHERE Id_type_language = 2
GROUP BY Id_game;

#Вывести id игр и кол-во жанров у каждой игры
SELECT Id_game, COUNT(Id_genre) AS count_genres
FROM genres_to_games
GROUP BY Id_game;

#Вывести id игр и кол-во возрастных рейтингов у каждой игры
SELECT Id_game, COUNT(Id_age_rating) AS count_age_ratings
FROM age_ratings_to_games
GROUP BY Id_game;


-- UNION, EXCEPT, INTERSECT

#Вывести языки игры, которые встречаются в двух играх
SELECT languages.Name AS language_name
FROM languages_to_games
JOIN languages ON languages.Id = languages_to_games.Id_language
JOIN(SELECT * FROM games WHERE games.Name = 'Red dead redemption 2') games ON languages_to_games.Id_game = games.Id
JOIN(SELECT * FROM types_language WHERE types_language.Name = 'Интерфейс' ) types_language ON languages_to_games.Id_type_language = types_language.Id
UNION
SELECT languages.Name AS language_name
FROM languages_to_games
JOIN languages ON languages.Id = languages_to_games.Id_language
JOIN(SELECT * FROM games WHERE games.Name = 'The Witcher 3') sun ON languages_to_games.Id_game = sun.Id
JOIN(SELECT * FROM types_language WHERE types_language.Name = 'Интерфейс' ) suk ON languages_to_games.Id_type_language = suk.Id;

#Вывести разработчиков, которые встречаются в двух играх
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies_to_games
JOIN(SELECT * FROM games WHERE games.Name = 'The Witcher 3') games ON games.Id = companies_to_games.Id_game
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Разработчик') types_company ON types_company.Id = companies_to_games.Id_type_company
JOIN companies ON companies.Id = companies_to_games.Id_company
UNION
SELECT companies.Name, companies.Location, companies.Date_of_foundation
FROM companies_to_games
JOIN(SELECT * FROM games WHERE games.Name = 'Red dead redemption 2') games ON games.Id = companies_to_games.Id_game
JOIN(SELECT * FROM types_company WHERE types_company.Name = 'Разработчик') types_company ON types_company.Id = companies_to_games.Id_type_company
JOIN companies ON companies.Id = companies_to_games.Id_company;

#Вывести кол-во игр у двух серий игр
SELECT game_series.Name, COUNT(games.Id) AS Count_games
FROM games
JOIN(SELECT * FROM game_series WHERE game_series.Name = 'Red Dead') game_series ON games.Id_Game_series = game_series.Id
UNION
SELECT game_series.Name, COUNT(games.Id) AS Count_games
FROM games
JOIN(SELECT * FROM game_series WHERE game_series.Name = 'The Witcher') game_series ON games.Id_Game_series = game_series.Id;


-- Вложенные SELECT

#Вывести айди пользователей, которые написали отзыв с максимальной оценкой
SELECT Id_user, 
	(SELECT MAX(Rating) AS max_rating 
	FROM reviews) AS max_rating 
FROM reviews 
WHERE reviews.Rating = (SELECT MAX(Rating) AS max_rating FROM reviews);

#Вывывести игры и кол-во языков у них
SELECT Name, (SELECT COUNT(Id_language) FROM languages_to_games WHERE languages_to_games.Id_game = games.Id) AS count_languages
FROM games;

#Вывести платформы и кол-во игр на них
SELECT Name, (SELECT COUNT(Id_game) FROM platforms_to_games WHERE platforms_to_games.Id_platform = platforms.Id) AS count_games
FROM platforms;


-- агрегатные функцию 

#Вывести строкой все возрастные рейтинки заданной игры
SELECT GROUP_CONCAT(' ', age_ratings.Name) AS age_ratings
FROM age_ratings, age_ratings_to_games, games
WHERE games.Name = 'Dark Souls II' AND age_ratings_to_games.id_game = games.Id AND age_ratings.Id = age_ratings_to_games.Id_age_rating;

#Вывести кол-во языков интерфеса у заданной игры
SELECT COUNT(languages.Id) AS Count_languages
FROM languages_to_games
JOIN languages ON languages_to_games.Id_language = languages.Id
JOIN(SELECT * FROM games WHERE games.Name = 'Red dead redemption 2') games ON languages_to_games.Id_game = games.Id
JOIN(SELECT * FROM types_language WHERE types_language.Name = 'Интерфейс') types_language ON languages_to_games.Id_type_language = types_language.Id;

#Подсчитать кол-во игр на заданном языке
SELECT COUNT(games.Id) AS count_games
FROM languages, languages_to_games, games, types_language
WHERE languages.Name = 'Английский' AND languages_to_games.Id_game = games.Id AND languages_to_games.Id_language = languages.Id 
AND types_language.Name = 'Интерфейс' AND languages_to_games.Id_type_language = types_language.Id;


-- Сложные запросы, входящие в большинство групп выше

#Расчитать для каждой игры среднюю оценку
SELECT games.Name AS game_name, reviews.average_rating
FROM games
JOIN(SELECT Id_game, AVG(Rating) AS average_rating
	FROM reviews
	GROUP BY Id_game) reviews ON reviews.Id_game = games.Id;

#Расчитать среднюю оценку, которую пользователь поставил по всех играм
SELECT reviews.average_rating
FROM users
JOIN(SELECT Id_user, AVG(Rating) AS average_rating
	FROM reviews
	GROUP BY id_user) reviews ON reviews.Id_user = users.Id
WHERE users.Name = 'Jasdas';

#Вывести средние оценки средних оценок игр на каждой платформе 
SELECT platforms.Name AS name_platform, AVG(reviews.average_rating) AS average_rating
FROM platforms_to_games
JOIN(SELECT Id_game, AVG(Rating) AS average_rating
	FROM reviews
	GROUP BY Id_game) reviews ON reviews.Id_game = platforms_to_games.Id_game
JOIN platforms ON platforms.Id = platforms_to_games.Id_platform
GROUP BY Id_platform;

#Вывести средние оценки средних оценок игр каждого разработчика
SELECT companies.Name AS name_company, AVG(reviews.average_rating) AS average_rating
FROM companies_to_games
JOIN(SELECT Id_game, AVG(Rating) AS average_rating
	FROM reviews
	GROUP BY Id_game) reviews ON reviews.Id_game = companies_to_games.Id_game
JOIN companies ON companies.Id = companies_to_games.Id_company
GROUP BY Id_company;

#Вывести количество игр в каждом жанре у заданного разработчика
SELECT genres.Name AS  name_genre, COUNT(genres_to_games.Id_game) AS count_games
FROM genres_to_games
JOIN(SELECT Id_game
	FROM companies_to_games
	JOIN(SELECT * FROM companies 
		WHERE companies.Name = 'CD Projekt RED') companies ON companies.Id = companies_to_games.Id_company
	JOIN(SELECT * FROM types_company 
		WHERE types_company.Name = 'Разработчик') types_company ON types_company.Id = companies_to_games.Id_type_company) companies_to_games ON companies_to_games.Id_game = genres_to_games.Id_game
RIGHT JOIN genres ON genres.Id = genres_to_games.Id_genre
GROUP BY genres.Id;

