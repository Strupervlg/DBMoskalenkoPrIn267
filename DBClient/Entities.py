class Game:
    def __init__(self, name, briefDescription = None, dateAnnounce = None, trailerURL = None,
                 gameCoverURL = None, gameWebsiteURL = None, idEngine = None, idGameSeries = None, id = None):
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
        return f"Id: {self.Id}, Name: {self.Name}, Brief description: {self.BriefDescription}, Date announce: {self.DateAnnounce}, " \
               f"Trailer URL: {self.TrailerURL},  Game cover URL: {self.GameCoverURL}, Game website URL: {self.GameWebsiteURL}, " \
               f"IdEngine: {self.IdEngine}, IdGameSeries: {self.IdGameSeries}"

    def getName(self):
        return f"'{self.Name}'"

    def getBriefDescription(self):
        if self.BriefDescription is None:
            return 'Null'
        else:
            return f"'{self.BriefDescription}'"

    def getDateAnnounce(self):
        if self.DateAnnounce is None:
            return 'Null'
        else:
            return f"'{self.DateAnnounce}'"

    def getTrailerURL(self):
        if self.TrailerURL is None:
            return 'Null'
        else:
            return f"'{self.TrailerURL}'"

    def getGameCoverURL(self):
        if self.GameCoverURL is None:
            return 'Null'
        else:
            return f"'{self.GameCoverURL}'"

    def getGameWebsiteURL(self):
        if self.GameWebsiteURL is None:
            return 'Null'
        else:
            return f"'{self.GameWebsiteURL}'"

    def getIdEngine(self):
        if self.IdEngine is None:
            return 'Null'
        else:
            return self.IdEngine

    def getIdGameSeries(self):
        if self.IdGameSeries is None:
            return 'Null'
        else:
            return self.IdGameSeries

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