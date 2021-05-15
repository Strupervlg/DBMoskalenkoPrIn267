from Interfaces import *
import sqlite3

class SQLiteGameRepository(IGameRepository):
    def __init__(self):
        self.connectingStr = "BDGames.db"

    def getAll(self):
        games = list()
        sql = f"SELECT * FROM games"
        try:
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            cursor.execute(sql)
            items = cursor.fetchall()
            for item in items:
                games.append(Game(item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8], item[0]))
            return games
        except sqlite3.OperationalError as errorMessage:
            print(errorMessage)

    def getById(self, id: int):
        sql = f"SELECT * FROM games WHERE games.Id = {id}"
        try:
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            cursor.execute(sql)
            item = cursor.fetchall()
            if len(item) != 0:
                game = item[0]
                return Game(game[1], game[2], game[3], game[4], game[5], game[6], game[7], game[8], game[0])
        except sqlite3.OperationalError as errorMessage:
            print(errorMessage)

    def add(self, game: Game):
        sql = f"INSERT INTO games (Name, Brief_description, Date_announce, Trailer_URL, Game_cover_URL, Game_website_URL, Id_Engine, Id_Game_series)" \
              f"VALUES ({game.getName()}, {game.getBriefDescription()}, {game.getDateAnnounce()}, {game.getTrailerURL()}, {game.getGameCoverURL()}," \
              f"{game.getGameWebsiteURL()}, {game.getIdEngine()}, {game.getIdGameSeries()})"
        try:
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            cursor.execute(sql)
            connection.commit()
            idNewGame = cursor.lastrowid
            game.Id = idNewGame
            return game
        except sqlite3.OperationalError as errorMessage:
            print(errorMessage)

    def update(self, game: Game):
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
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            cursor.execute(sql)
            connection.commit()
        except sqlite3.OperationalError as errorMessage:
            print(errorMessage)

    def delete(self, game: Game):
        sql = f"DELETE FROM games WHERE Id = {game.Id}"
        try:
            connection = sqlite3.connect(self.connectingStr)
            cursor = connection.cursor()
            cursor.execute(sql)
            connection.commit()
        except sqlite3.OperationalError as errorMessage:
            print(errorMessage)