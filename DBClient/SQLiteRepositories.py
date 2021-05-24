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
                games.append(Game(item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8], item[0]))
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
            cursor.execute(sql, id)
            # Получение результата SQL запроса
            item = cursor.fetchall()
            connection.close()
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
              f"VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql, (game.Name, game.Brief_description, game.Date_announce,
            game.Trailer_URL, game.Game_cover_URL, game.Game_website_URL, game.Id_Engine, game.Id_Game_series))
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
            cursor.execute(sql, (game.Name, game.Brief_description, game.Date_announce,
            game.Trailer_URL, game.Game_cover_URL, game.Game_website_URL, game.Id_Engine, game.Id_Game_series, game.Id))
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
            cursor.execute(sql, game.Id)
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
            cursor.execute(sql, game.Name)
            # Получение результата SQL запроса
            rating = cursor.fetchall()
            connection.close()
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
            cursor.execute(sql, id)
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
            cursor.execute(sql, (gameSeries.Name, gameSeries.cover_URL))
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
            cursor.execute(sql, (gameSeries.Name, gameSeries.cover_URL, gameSeries.Id))
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
            cursor.execute(sql, gameSeries.Id)
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
              f"WHERE game_series.Name = {gameSeries.getName()};"
        try:
            # Подключение к БД
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            # Исполнение SQL запроса
            cursor.execute(sql)
            # Получение результата SQL запроса
            countGame = cursor.fetchall()
            connection.close()
            # Вернуть полученный результат
            return countGame[0][0]
        except sqlite3.OperationalError as errorMessage:
            # Вывести ошибку, если возникло исключение
            print(errorMessage)