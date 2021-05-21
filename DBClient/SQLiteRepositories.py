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
        sql = f"SELECT * FROM games"  # SQL запрос для получение всех игр
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
                games.append(Game(item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8], item[0]))
            # Вернуть список игр
            return games
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getById(self, id: int):
        sql = f"SELECT * FROM games WHERE games.Id = {id}"  # SQL запрос для получение игры по id
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            item = cursor.fetchall()
            # Если результат есть, создать объект игры и вернуть ее
            if len(item) != 0:
                game = item[0]
                return Game(game[1], game[2], game[3], game[4], game[5], game[6], game[7], game[8], game[0])
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def add(self, game: Game):
        # SQL запрос для добавления игры в БД
        sql = f"INSERT INTO games (Name, Brief_description, Date_announce, Trailer_URL, Game_cover_URL, Game_website_URL, Id_Engine, Id_Game_series)" \
              f"VALUES ({game.getName()}, {game.getBriefDescription()}, {game.getDateAnnounce()}, {game.getTrailerURL()}, {game.getGameCoverURL()}," \
              f"{game.getGameWebsiteURL()}, {game.getIdEngine()}, {game.getIdGameSeries()})"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Сохранение добавленной игры в БД
            connection.commit()
            # Взять id добвленной игры из БД и присвоить его объекту новой игры
            idNewGame = cursor.lastrowid
            game.Id = idNewGame
            # Вернуть игру
            return game
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def update(self, game: Game):
        # SQL запрос для обновления игры в БД
        sql = f"UPDATE games " \
              f"SET Name = {game.getName()}, " \
              f"Brief_description = {game.getBriefDescription()}, " \
              f"Date_announce = {game.getDateAnnounce()}, " \
              f"Trailer_URL = {game.getTrailerURL()}, " \
              f"Game_cover_URL = {game.getGameCoverURL()}, " \
              f"Game_website_URL = {game.getGameWebsiteURL()}, " \
              f"Id_Engine = {game.getIdEngine()}, " \
              f"Id_Game_series = {game.getIdGameSeries()} " \
              f"WHERE Id = {game.Id}"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Сохранение обновленной игры в БД
            connection.commit()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def delete(self, game: Game):
        sql = f"DELETE FROM games WHERE Id = {game.Id}"  # SQL запрос для удаления игры из БД
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Сохранение БД после удаления игры
            connection.commit()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getAvgRating(self, game: Game):
        # SQL запрос для получения среднего рейтинга игры из БД
        sql = f"SELECT AVG(reviews.Rating) " \
              f"FROM reviews " \
              f"JOIN games ON reviews.id_Game = games.Id " \
              f"WHERE games.Name = {game.getName()};"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            rating = cursor.fetchall()
            # Вернуть полученный рейтинг игры
            return rating[0][0]
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
        sql = f"SELECT * FROM game_series"  # SQL запрос для получения списка серий игр
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
            # Вернуть список серий игры
            return gameSeries
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getById(self, id: int):
        sql = f"SELECT * FROM game_series WHERE game_series.Id = {id}"  # SQL запрос для получения серии игр по id
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            item = cursor.fetchall()
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
              f"VALUES ({gameSeries.getName()}, {gameSeries.getCoverURL()})"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Сохранение БД после добавления игровой серии
            connection.commit()
            # Взять id добвленной серии игр из БД и присвоить его объекту новой серии игр
            idNewGameSeries = cursor.lastrowid
            gameSeries.Id = idNewGameSeries
            # Вернуть серию игр
            return gameSeries
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def update(self, gameSeries: GameSeries):
        # SQL запрос для обновленния серии игр в БД
        sql = f"UPDATE game_series " \
              f"SET Name = {gameSeries.getName()}, " \
              f"cover_URL = {gameSeries.getCoverURL()} " \
              f"WHERE Id = {gameSeries.Id}"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Сохранение БД после обновления игровой серии
            connection.commit()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def delete(self, gameSeries: GameSeries):
        sql = f"DELETE FROM game_series WHERE Id = {gameSeries.Id}"  # SQL запрос для удаления серии игр из БД
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Сохранение БД после удаления игры
            connection.commit()
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)

    def getCountGame(self, gameSeries: GameSeries):
        # SQL запрос для получения кол-во игр в серии игр из БД
        sql = f"SELECT COUNT(games.Id) AS Count_games " \
              f"FROM games " \
              f"JOIN game_series ON games.Id_Game_series = game_series.Id " \
              f"WHERE game_series.Name = {gameSeries.getName()};"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            countGame = cursor.fetchall()
            # Вернуть полученный результат
            return countGame[0][0]
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)