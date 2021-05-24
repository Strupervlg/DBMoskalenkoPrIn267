from Entities import *

class IBaseRepository():
    """
    Базовый интерфейс репозитория
    """
    def getAll(self):
        """
        Получение всех игры
        :return: список элементов таблицы
        """
        pass

    def getById(self, id: int):
        """
        Получение элемента по айди
        :param id: айди элемента
        :return: элемент
        """
        pass

    def add(self, item):
        """
        Добавление элемента в БД
        :param item: элемент
        :return: элемент с айди из БД
        """
        pass

    def update(self, item):
        """
        Обновление элемента в БД
        :param item: обновленный элемент
        """
        pass

    def delete(self, item):
        """
        Удаление элемента из БД
        :param item: элемент для удаления
        """
        pass

class IGameRepository(IBaseRepository):
    """
    Интерфейс для репозитория игры
    """
    def getAvgRating(self, game: Game):
        """
        Получение среднего рейтинга игры
        :param game: игра для расчета рейтинга
        :return: средний рейтинг игры
        """
        pass

class IGameSeriesRepository(IBaseRepository):
    """
    Интерфейс для репозитория серии игр
    """
    def getCountGame(self, gameSeries: GameSeries):
        """
        Получение кол-во игр в серии игр
        :param gameSeries: серия игр, для которой расчитывается кол-во игр
        :return: кол-во игр в серии игр
        """
        pass

