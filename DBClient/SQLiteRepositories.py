from Interfaces import *
import sqlite3

class SQLiteGameRepository(IGameRepository):
    """
    Класс для работы с таблицей 'игры' в SQLite
    """
    def __init__(self):
        """
        Конструктор класса
        """
        self.connectingStr = "BDGames.db"

    def getAll(self):
        games = list()  # Список игр
        # SQL запрос для получение всех игр
        sql = f"SELECT `Id`, `Name`, `Brief_description`, `Date_announce`, `Trailer_URL`, " \
              f"`Game_cover_URL`, `Game_website_URL`, `Id_Engine`, `Id_Game_series`" \
              f"FROM games"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            items = cursor.fetchall()
            # Создать из полученных данных объекты игр
            for item in items:
                games.append(Game(item[1], item[2], item[3], item[4], item[5], item[6], SQLiteEngineRepository().getById(item[7]), SQLiteGameSeriesRepository().getById(item[8]), item[0]))
            connection.close()
            # Вернуть список игр
            return games
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getById(self, id: int):
        # SQL запрос для получение игры по id
        sql = f"SELECT `Id`, `Name`, `Brief_description`, `Date_announce`, `Trailer_URL`, " \
              f"`Game_cover_URL`, `Game_website_URL`, `Id_Engine`, `Id_Game_series`" \
              f"FROM games WHERE games.Id = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (id,))
            # Получение результата SQL запроса
            item = cursor.fetchall()
            connection.close()
            # Если результат есть, создать объект игры и вернуть ее
            if len(item) != 0:
                game = item[0]
                return Game(game[1], game[2], game[3], game[4], game[5], game[6],
                            SQLiteEngineRepository().getById(game[7]), SQLiteGameSeriesRepository().getById(game[8]),
                            game[0])
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getByName(self, name: str):
        # SQL запрос для получение игры по названию
        sql = f"SELECT `Id`, `Name`, `Brief_description`, `Date_announce`, `Trailer_URL`, " \
              f"`Game_cover_URL`, `Game_website_URL`, `Id_Engine`, `Id_Game_series`" \
              f"FROM games WHERE games.Name = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (name,))
            # Получение результата SQL запроса
            item = cursor.fetchall()
            connection.close()
            # Если результат есть, создать объект игры и вернуть ее
            if len(item) != 0:
                game = item[0]
                return Game(game[1], game[2], game[3], game[4], game[5], game[6],
                            SQLiteEngineRepository().getById(game[7]), SQLiteGameSeriesRepository().getById(game[8]),
                            game[0])
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def add(self, game: Game):
        # SQL запрос для добавления игры в БД
        sql = f"INSERT INTO games (Name, Brief_description, Date_announce, Trailer_URL, Game_cover_URL, Game_website_URL, Id_Engine, Id_Game_series)" \
              f"VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (game.Name, game.BriefDescription, game.DateAnnounce,
            game.TrailerURL, game.GameCoverURL, game.GameWebsiteURL, game.IdEngine, game.IdGameSeries))
            # Сохранение добавленной игры в БД
            connection.commit()
            # Взять id добвленной игры из БД и присвоить его объекту новой игры
            idNewGame = cursor.lastrowid
            game.Id = idNewGame
            connection.close()
            # Вернуть игру
            return game
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def update(self, game: Game):
        # SQL запрос для обновления игры в БД
        sql = f"UPDATE games " \
              f"SET Name = ?, " \
              f"Brief_description = ?, " \
              f"Date_announce = ?, " \
              f"Trailer_URL = ?, " \
              f"Game_cover_URL = ?, " \
              f"Game_website_URL = ?, " \
              f"Id_Engine = ?, " \
              f"Id_Game_series = ? " \
              f"WHERE Id = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (game.Name, game.BriefDescription, game.DateAnnounce,
            game.TrailerURL, game.GameCoverURL, game.GameWebsiteURL, game.IdEngine, game.IdGameSeries, game.Id))
            # Сохранение обновленной игры в БД
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def delete(self, game: Game):
        sql = f"DELETE FROM games WHERE Id = ?"  # SQL запрос для удаления игры из БД
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (game.Id,))
            # Сохранение БД после удаления игры
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getAvgRating(self, game: Game):
        # SQL запрос для получения среднего рейтинга игры из БД
        sql = f"SELECT AVG(reviews.Rating) " \
              f"FROM reviews " \
              f"JOIN games ON reviews.id_Game = games.Id " \
              f"WHERE games.Name = ?;"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (game.Name,))
            # Получение результата SQL запроса
            rating = cursor.fetchall()
            connection.close()
            # Вернуть полученный рейтинг игры
            return rating[0][0]
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getLanguages(self, game: Game):
        # SQL запрос для всех языков игры из БД
        sql = f"SELECT languages.Name, types_language.Name " \
              f"FROM games " \
              f"JOIN languages_to_games ON languages_to_games.Id_game = games.Id " \
              f"JOIN languages ON languages.Id = languages_to_games.Id_language " \
              f"JOIN types_language ON types_language.Id = languages_to_games.Id_type_language " \
              f"WHERE games.Name = ?;"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (game.Name,))
            # Получение результата SQL запроса
            items = cursor.fetchall()
            languages = list()
            for item in items:
                languages.append(Language(item[0], type=item[1]))
            connection.close()
            # Вернуть полученный рейтинг игры
            return languages
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def addLanguage(self, game: Game, language: Language):
        # SQL запрос для привязки языка к игре из БД
        sql = f"INSERT INTO languages_to_games (`Id_game`, `Id_language`, `Id_type_language`)" \
              f"VALUES (?, ?, ?)"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (int(game.Id), int(language.Id), int(language.Type)))
            # Сохранение БД после добавления
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def deleteLanguage(self, game: Game, language: Language):
        # SQL запрос для привязки языка к игре из БД
        sql = f"DELETE FROM languages_to_games " \
              f"WHERE Id_game = ? AND Id_language = ? AND Id_type_language = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (int(game.Id), int(language.Id), int(language.Type)))
            # Сохранение БД после добавления
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)



class SQLiteGameSeriesRepository(IGameSeriesRepository):
    """
    Класс для работы с таблицей 'серии игр' в SQLite
    """
    def __init__(self):
        """
        Конструктор класса
        """
        self.connectingStr = "BDGames.db"

    def getAll(self):
        gameSeries = list()  # Список серий игр
        # SQL запрос для получения списка серий игр
        sql = f"SELECT `Id`, `Name`, `cover_URL` " \
              f"FROM game_series"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            items = cursor.fetchall()
            # Создать из полученных данных объекты серий игр
            for item in items:
                gameSeries.append(GameSeries(item[1], item[2], item[0]))
            connection.close()
            # Вернуть список серий игры
            return gameSeries
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getById(self, id: int):
        # SQL запрос для получения серии игр по id
        sql = f"SELECT `Id`, `Name`, `cover_URL` " \
              f"FROM game_series " \
              f"WHERE game_series.Id = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (id,))
            # Получение результата SQL запроса
            item = cursor.fetchall()
            connection.close()
            # Если результат есть, создать объект серии игр и вернуть ее
            if len(item) != 0:
                gameSeries = item[0]
                return GameSeries(gameSeries[1], gameSeries[2], gameSeries[0])
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def add(self, gameSeries: GameSeries):
        # SQL запрос для добавления новой серии игр в БД
        sql = f"INSERT INTO game_series (Name, cover_URL)" \
              f"VALUES (?, ?)"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (gameSeries.Name, gameSeries.CoverURL))
            # Сохранение БД после добавления игровой серии
            connection.commit()
            # Взять id добвленной серии игр из БД и присвоить его объекту новой серии игр
            idNewGameSeries = cursor.lastrowid
            gameSeries.Id = idNewGameSeries
            connection.close()
            # Вернуть серию игр
            return gameSeries
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def update(self, gameSeries: GameSeries):
        # SQL запрос для обновленния серии игр в БД
        sql = f"UPDATE game_series " \
              f"SET Name = ?, " \
              f"cover_URL = ? " \
              f"WHERE Id = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (gameSeries.Name, gameSeries.CoverURL, gameSeries.Id))
            # Сохранение БД после обновления игровой серии
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def delete(self, gameSeries: GameSeries):
        sql = f"DELETE FROM game_series WHERE Id = ?"  # SQL запрос для удаления серии игр из БД
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (gameSeries.Id,))
            # Сохранение БД после удаления игры
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getCountGame(self, gameSeries: GameSeries):
        # SQL запрос для получения кол-во игр в серии игр из БД
        sql = f"SELECT COUNT(games.Id) AS Count_games " \
              f"FROM games " \
              f"JOIN game_series ON games.Id_Game_series = game_series.Id " \
              f"WHERE game_series.Name = ?;"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (gameSeries.Name,))
            # Получение результата SQL запроса
            countGame = cursor.fetchall()
            connection.close()
            # Вернуть полученный результат
            return countGame[0][0]
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

class SQLiteEngineRepository(IEngineRepository):
    def __init__(self):
        """
        Конструктор класса
        """
        self.connectingStr = "BDGames.db"

    def getAll(self):
        engines = list()  # Список движков игры
        # SQL запрос для получения списка движков игры
        sql = f"SELECT `Id`, `Name`" \
              f"FROM engines"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            items = cursor.fetchall()
            # Создать из полученных данных объекты движков игры
            for item in items:
                engines.append(Engine(item[1], item[0]))
            connection.close()
            # Вернуть список движков игры
            return engines
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getById(self, id: int):
        # SQL запрос для получения движков по id
        sql = f"SELECT `Id`, `Name`" \
              f"FROM engines " \
              f"WHERE engines.Id = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (id,))
            # Получение результата SQL запроса
            item = cursor.fetchall()
            connection.close()
            # Если результат есть, создать объект движка и вернуть ее
            if len(item) != 0:
                engine = item[0]
                return Engine(engine[1], engine[0])
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

class SQLiteLanguageRepository(ILanguageRepository):
    def __init__(self):
        """
        Конструктор класса
        """
        self.connectingStr = "BDGames.db"

    def getAll(self):
        languages = list()  # Список языков
        # SQL запрос для получения списка языков
        sql = f"SELECT `Id`, `Name`" \
              f"FROM languages"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            items = cursor.fetchall()
            # Создать из полученных данных объекты языков
            for item in items:
                languages.append(Language(item[1], item[0]))
            connection.close()
            # Вернуть список языков
            return languages
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getById(self, id: int):
        # SQL запрос для получения языка по id
        sql = f"SELECT `Id`, `Name`" \
              f"FROM languages " \
              f"WHERE languages.Id = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (id,))
            # Получение результата SQL запроса
            item = cursor.fetchall()
            connection.close()
            # Если результат есть, создать объект языка и вернуть ее
            if len(item) != 0:
                languages = item[0]
                return Language(languages[1], languages[0])
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getByName(self, name: str):
        # SQL запрос для получения языка по названию
        sql = f"SELECT `Id`, `Name`" \
              f"FROM languages " \
              f"WHERE languages.Name = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (name,))
            # Получение результата SQL запроса
            item = cursor.fetchall()
            connection.close()
            # Если результат есть, создать объект языка и вернуть ее
            if len(item) != 0:
                languages = item[0]
                return Language(languages[1], languages[0])
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def add(self, language: Language):
        # SQL запрос для добавления нового языка в БД
        sql = f"INSERT INTO languages (Name)" \
              f"VALUES (?)"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (language.Name,))
            # Сохранение БД после добавления языка
            connection.commit()
            # Взять id добвленного языка из БД и присвоить его объекту нового языка
            idNewLanguage = cursor.lastrowid
            language.Id = idNewLanguage
            connection.close()
            # Вернуть язык
            return language
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def update(self, language: Language):
        # SQL запрос для обновленния языка в БД
        sql = f"UPDATE languages " \
              f"SET Name = ? " \
              f"WHERE Id = ?"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (language.Name, language.Id))
            # Сохранение БД после обновления языка
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def delete(self, language: Language):
        sql = f"DELETE FROM languages WHERE Id = ?"  # SQL запрос для удаления языка из БД
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (language.Id,))
            # Сохранение БД после удаления языка
            connection.commit()
            connection.close()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getGames(self, language: Language):
        # SQL запрос для получения всех игр с данным языком из БД
        sql = f"SELECT DISTINCT games.Id " \
              f"FROM games " \
              f"JOIN languages_to_games ON languages_to_games.Id_game = games.Id " \
              f"JOIN languages ON languages.Id = languages_to_games.Id_language " \
              f"WHERE languages.Name = ?;"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (language.Name,))
            # Получение результата SQL запроса
            idGames = cursor.fetchall()
            games = list()  # Список игр
            for idGame in idGames:
                games.append(SQLiteGameRepository().getById(idGame[0]))
            connection.close()
            # Вернуть полученный результат
            return games
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)