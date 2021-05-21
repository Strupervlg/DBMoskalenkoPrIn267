class Game:
    """
    Класс игры
    """
    def __init__(self, name, briefDescription = None, dateAnnounce = None, trailerURL = None,
                 gameCoverURL = None, gameWebsiteURL = None, idEngine = None, idGameSeries = None, id = None):
        """
        Конструктор класса
        :param name: название игры
        :param briefDescription: краткое описание
        :param dateAnnounce: дата анонса
        :param trailerURL: ссылка на трейлер игры
        :param gameCoverURL: ссылка на обложку игры
        :param gameWebsiteURL: ссылка на сайт игры
        :param idEngine: айди движка
        :param idGameSeries: айди серии игр
        :param id: айди игры
        """
        self.Name = name
        self.BriefDescription = briefDescription
        self.DateAnnounce = dateAnnounce
        self.TrailerURL = trailerURL
        self.GameCoverURL = gameCoverURL
        self.GameWebsiteURL = gameWebsiteURL
        self.IdEngine = idEngine
        self.IdGameSeries = idGameSeries
        self.Id = id

    def toString(self):
        """
        Перевести объект класса в строку
        :return: строка состоящая из полей класса
        """
        return f"Id: {self.Id}, Name: {self.Name}, Brief description: {self.BriefDescription}, Date announce: {self.DateAnnounce}, " \
               f"Trailer URL: {self.TrailerURL},  Game cover URL: {self.GameCoverURL}, Game website URL: {self.GameWebsiteURL}, " \
               f"IdEngine: {self.IdEngine}, IdGameSeries: {self.IdGameSeries}"

    def getName(self):
        """
        Получение название игры
        :return: название игры
        """
        return f"'{self.Name}'"

    def getBriefDescription(self):
        """
        Получение краткого описания игры
        :return: краткое описание игры
        """
        if self.BriefDescription is None:
            return 'Null'
        else:
            return f"'{self.BriefDescription}'"

    def getDateAnnounce(self):
        """
        Получение даты анонса игры
        :return: дата анонса
        """
        if self.DateAnnounce is None:
            return 'Null'
        else:
            return f"'{self.DateAnnounce}'"

    def getTrailerURL(self):
        """
        Получение ссылки на трейлер игры
        :return: ссылка на трейлер игры
        """
        if self.TrailerURL is None:
            return 'Null'
        else:
            return f"'{self.TrailerURL}'"

    def getGameCoverURL(self):
        """
        Получение ссылки на обложку игры
        :return: ссылка на обложку игры
        """
        if self.GameCoverURL is None:
            return 'Null'
        else:
            return f"'{self.GameCoverURL}'"

    def getGameWebsiteURL(self):
        """
        Получение ссылки на сайт игры
        :return: ссылка на сайт игры
        """
        if self.GameWebsiteURL is None:
            return 'Null'
        else:
            return f"'{self.GameWebsiteURL}'"

    def getIdEngine(self):
        """
        Получение айди движка игры
        :return: айди движка игры
        """
        if self.IdEngine is None:
            return 'Null'
        else:
            return self.IdEngine

    def getIdGameSeries(self):
        """
        Получение айди серии игры
        :return: айди серии игры
        """
        if self.IdGameSeries is None:
            return 'Null'
        else:
            return self.IdGameSeries

    def setBriefDescription(self, brief: str):
        """
        Установка краткого описания игры
        :param brief: краткое описание игры
        """
        if brief != '':
            self.BriefDescription = brief

    def setDateAnnounce(self, date: str):
        """
        Установка даты анонса игры
        :param date: дата анонса
        """
        if date != '':
            self.DateAnnounce = date

    def setTrailerURL(self, url: str):
        """
        Установка ссылки на трейлер игры
        :param url: ссылка на трейлер игры
        """
        if url != '':
            self.TrailerURL = url

    def setGameCoverURL(self, url: str):
        """
        Установка ссылки на обложку игры
        :param url: ссылка на обложку игры
        """
        if url != '':
            self.GameCoverURL = url

    def setGameWebsiteURL(self, url: str):
        """
        Установка ссылки на сайт игры
        :param url: ссылка на сайт игры
        """
        if url != '':
            self.GameWebsiteURL = url

    def setIdEngine(self, id: int):
        """
        Установка айди движка игры
        :param id: айди движка игры
        """
        if id != 0:
            self.IdEngine = id

    def setIdGameSeries(self, id: int):
        """
        Установка айди игровой серии
        :param id: айди игровой серии
        """
        if id != 0:
            self.IdGameSeries = id

class GameSeries:
    def __init__(self, name, coverURL = None, id = None):
        self.Name = name
        self.CoverURL = coverURL
        self.Id = id

    def toString(self):
        return f"Id: {self.Id}, Name: {self.Name}, Cover URL: {self.CoverURL}"

    def getName(self):
        return f"'{self.Name}'"

    def getCoverURL(self):
        if self.CoverURL is None:
            return 'Null'
        else:
            return f"'{self.CoverURL}'"

    def setCoverURL(self, url: str):
        if url != '':
            self.CoverURL = url