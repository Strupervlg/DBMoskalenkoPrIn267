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

    def getLanguages(self, game: Game):
        """
        Получение всех языков игры
        :param game: игра для получения языков
        :return: список языков
        """
        pass

    def addLanguage(self, game: Game, language: Language):
        """
        Добавление языка к игре
        :param game: игра
        :param language: язык вместе с типом
        """
        pass

    def deleteLanguage(self, game: Game, language: Language):
        """
        Удаление языка у игры
        :param game: игра
        :param language: язык вместе с типом
        """
        pass

    def getByName(self, name: str):
        """
        Получение объекта игры по названию
        :param name: название игры
        :return: игра
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

class IEngineRepository(IBaseRepository):
    """
    Интерфейс для репозитория движка
    """
    pass

class ILanguageRepository(IBaseRepository):
    """
    Интерфейс для репозитория языка
    """
    def getByName(self, name: str):
        """
        Получение объекта языка по названию
        :param name: название языка
        :return: язык
        """
        pass

    def getGames(self, language: Language):
        """
        Получение всех игр на данном языке
        :param language: язык для получения игр
        :return: список всех игр
        """
        pass

