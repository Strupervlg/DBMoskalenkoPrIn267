from Entities import *

class IGameRepository(Game):
    def getAll(self):
        pass

    def getById(self, id: int):
        pass

    def add(self, game: Game):
        pass

    def update(self, game: Game):
        pass

    def delete(self, game: Game):
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