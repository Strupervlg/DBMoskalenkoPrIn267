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
    """
    Интерфейс для репозитория серии игр
    """
    def getAll(self):
        """
        Получение всех серий игр
        :return: список серий игр
        """
        pass

    def getById(self, id: int):
        """
        Получение серии игр по айди
        :param id: айди серии игр
        :return: серия игр
        """
        pass

    def add(self, gameSeries: GameSeries):
        """
        Добавление серии игр в БД
        :param gameSeries: серия игр
        :return: серия игр с айди из БД
        """
        pass

    def update(self, gameSeries: GameSeries):
        """
        Обновление серии игр в БД
        :param gameSeries: обновленная серия игр
        """
        pass

    def delete(self, gameSeries: GameSeries):
        """
        Удаление серии игр из БД
        :param gameSeries: серия игр для удаления
        """
        pass

    def getCountGame(self, gameSeries: GameSeries):
        """
        Получение кол-во игр в серии игр
        :param gameSeries: серия игр, для которой расчитывается кол-во игр
        :return: кол-во игр в серии игр
        """
        pass