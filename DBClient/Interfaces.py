from Entities import *

class IGameRepository(Game):
    """
    Интерфейс для репозитория игры
    """
    def getAll(self):
        """
        Получение всех игры
        :return: список игр
        """
        pass

    def getById(self, id: int):
        """
        Получение игры по айди
        :param id: айди игры
        :return: игра
        """
        pass

    def add(self, game: Game):
        """
        Добавление игры в БД
        :param game: игра
        :return: игра с айди из БД
        """
        pass

    def update(self, game: Game):
        """
        Обновление игры в БД
        :param game: обновленная игра
        """
        pass

    def delete(self, game: Game):
        """
        Удаление игры из БД
        :param game: игра для удаления
        """
        pass

    def getAvgRating(self, game: Game):
        """
        Получение среднего рейтинга игры
        :param game: игра для расчета рейтинга
        :return: средний рейтинг игры
        """
        pass

class IGameSeriesRepository(GameSeries):
    def getAll(self):
        pass

    def getById(self, id: int):
        pass

    def add(self, gameSeries: GameSeries):
        pass

    def update(self, gameSeries: GameSeries):
        pass

    def delete(self, gameSeries: GameSeries):
        pass

    def getCountGame(self, gameSeries: GameSeries):
        pass