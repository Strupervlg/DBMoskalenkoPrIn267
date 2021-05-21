from SQLiteRepositories import *

def tableGameSeries():
    """
    Работа с таблицей серий игр
    """
    while True:
        print("\nВыберите действие над таблицей")
        action = input("c - createGameSeries; r - getGameSeries; u - updateGameSeries; d - deleteGameSeries; "
                       "g - getAll; count - показать кол-во игр в серии; exit - для выхода из таблицы\n")
        if action == 'c':
            # Добавление игровой серии в БД
            addGameSeries()
        elif action == 'r':
            # Получение игровой серии из БД
            getGameSeries()
        elif action == 'u':
            # Обновление игровой серии в БД
            updateGameSeries()
        elif action == 'd':
            # Удаление игровой серии из БД
            deleteGameSeries()
        elif action == 'g':
            # Получение всех игровых серий из БД
            getAllGameSeries()
        elif action == 'count':
            # Подсчитать кол-во игр в серии игр
            getCountGameInGameSeries()
        elif action == 'exit':
            # Выход из таблицы
            break

def addGameSeries():
    """
    Добавление игровой серии в БД
    """
    # Подключиться к таблице игровых серий
    gameSeriesTable = SQLiteGameSeriesRepository()
    # Получение название новой игровой серии
    name = input("Введите название игровой серии: ")
    # Создание объекта новой игровой серии
    newGameSeries = GameSeries(name)
    # Получение и установка объекту ссылки на обложку игровой серии новой игровой серии
    coverURL = input("Введите ссылку на обложку игровой серии: ")
    newGameSeries.setCoverURL(coverURL)
    # Добавление новой игровой серии в БД
    gameSeriesTable.add(newGameSeries)

def getGameSeries():
    """
    Получение игровой серии из БД
    """
    # Подключиться к таблице игровых серий
    gameSeriesTable = SQLiteGameSeriesRepository()
    # Получение айди игровой серии
    idGameSeries = int(input("Введите айди игровой серии: "))
    # Получение игровой серии из БД по айди
    gameSeries = gameSeriesTable.getById(idGameSeries)
    # Вывести игровую серию если он существует в БД
    if gameSeries is not None:
        print(gameSeries.toString())
    else:
        print("Игровая серия не найдена!")

def updateGameSeries():
    """
    Обновление игровой серии в БД
    """
    # Подключиться к таблице игровых серий
    gameSeriesTable = SQLiteGameSeriesRepository()
    # Получение айди игровой серии, которая обновляется
    idGameSeries = int(input("Введите айди измененной игровой серии: "))
    # Получение обновленных данных данной игровой серии
    name = input("Введите новое название игровой серии: ")
    updateGameSeries = GameSeries(name, id=idGameSeries)
    coverURL = input("Введите новую ссылку на обложку игровой серии: ")
    updateGameSeries.setCoverURL(coverURL)
    # Обновить данные игровой серии в БД
    gameSeriesTable.update(updateGameSeries)

def deleteGameSeries():
    """
    Удаление игровой серии из БД
    """
    # Подключиться к таблице игровых серий
    gameSeriesTable = SQLiteGameSeriesRepository()
    # Получение айди для удаления игровой серии
    idDeleteGameSeries = int(input("Введите айди игровой серии для удаления: "))
    # Удаление игровой серии из БД
    gameSeriesTable.delete(GameSeries("", id=idDeleteGameSeries))

def getAllGameSeries():
    """
    Получение всех серий игр из БД
    """
    # Подключиться к таблице игровых серий
    gameSeriesTable = SQLiteGameSeriesRepository()
    # Получение всех серий игр из БД
    gameSeries = gameSeriesTable.getAll()
    # Вывести все серии игр
    for series in gameSeries:
        print(series.toString())

def getCountGameInGameSeries():
    """
    Подсчет кол-во игр в серии игр
    """
    # Подключиться к таблице игровых серий
    gameSeriesTable = SQLiteGameSeriesRepository()
    # Получение название серии игр для расчета
    nameGameSeries = input("Введите название игровой серии: ")
    # Расчитать кол-во игр в БД
    countGame = gameSeriesTable.getCountGame(GameSeries(nameGameSeries))
    # Вывести кол-во игр, если они есть
    if countGame != 0:
        print(countGame)
    else:
        print("Игр в данной игровой серии не найдено!")

def tableGame():
    """
    Работа с таблицей игры
    """
    while True:
        print("\nВыберите действие над таблицей")
        action = input("c - createGame; r - getGame; u - updateGame; d - deleteGame; g - getAll; "
                       "rating - для показа рейтинга игры; exit - для выхода из таблицы\n")
        if action == 'c':
            # Добавление игры в БД
            addGame()
        elif action == 'r':
            # Получение игры из БД
            getGame()
        elif action == 'u':
            # Обновление игры в БД
            updateGame()
        elif action == 'd':
            # Удаление игры из БД
            deleteGame()
        elif action == 'g':
            # Получение всех игр из БД
            getAllGame()
        elif action == 'rating':
            # Получение среднего рейтинга игры из БД
            getAvgRatingGame()
        elif action == 'exit':
            # Выход из таблицы
            break

def addGame():
    """
    Добавление игры в БД
    """
    # Подключиться к таблице игр
    gameTable = SQLiteGameRepository()
    # Получение всех полей игры
    name = input("Введите название игры: ")
    newGame = Game(name)
    brief = input("Введите описание игры: ")
    newGame.setBriefDescription(brief)
    date = input("Введите дату анонса игры: ")
    newGame.setDateAnnounce(date)
    trailerURL = input("Введите ссылку на трейлер игры: ")
    newGame.setTrailerURL(trailerURL)
    gameCoverURL = input("Введите ссылку на обложку игры: ")
    newGame.setGameCoverURL(gameCoverURL)
    gameWebsiteURL = input("Введите ссылку на сайт игры: ")
    newGame.setGameWebsiteURL(gameWebsiteURL)
    idEngine = int(input("Введите айди движка игры: "))
    newGame.setIdEngine(idEngine)
    idGameSeries = int(input("Введите айди серии игры: "))
    newGame.setIdGameSeries(idGameSeries)
    # Добавление новой игры в БД
    gameTable.add(newGame)

def getGame():
    """
    Получение игры из БД
    """
    # Подключиться к таблице игр
    gameTable = SQLiteGameRepository()
    # Получение айди игры
    idGame = int(input("Введите айди игры: "))
    # Получить игру по айди из БД
    game = gameTable.getById(idGame)
    # Если игра найдена в БД, вывести ее
    if game is not None:
        print(game.toString())
    else:
        print("Игра не найдена!")

def updateGame():
    """
    Обновление игры в БД
    """
    # Подключиться к таблице игр
    gameTable = SQLiteGameRepository()
    # Получение айди игры для изменения
    idGame = int(input("Введите айди измененной игры: "))
    # Получение новых полей игры
    name = input("Введите новое название игры: ")
    updatedGame = Game(name, id=idGame)
    brief = input("Введите новое описание игры: ")
    updatedGame.setBriefDescription(brief)
    date = input("Введите новую дату анонса игры: ")
    updatedGame.setDateAnnounce(date)
    trailerURL = input("Введите новую ссылку на трейлер игры: ")
    updatedGame.setTrailerURL(trailerURL)
    gameCoverURL = input("Введите новую ссылку на обложку игры: ")
    updatedGame.setGameCoverURL(gameCoverURL)
    gameWebsiteURL = input("Введите новую ссылку на сайт игры: ")
    updatedGame.setGameWebsiteURL(gameWebsiteURL)
    idEngine = int(input("Введите новый айди движка игры: "))
    updatedGame.setIdEngine(idEngine)
    idGameSeries = int(input("Введите новый айди серии игры: "))
    updatedGame.setIdGameSeries(idGameSeries)
    # Обновить игру в БД
    gameTable.update(updatedGame)

def deleteGame():
    """
    Удаление игры из БД
    """
    # Подключиться к таблице игр
    gameTable = SQLiteGameRepository()
    # Получение айди игры для удаления из БД
    idDeleteGame = int(input("Введите айди игры для удаления: "))
    # Удалить игру из БД
    gameTable.delete(Game("", id=idDeleteGame))

def getAllGame():
    """
    Получение всех игр из БД
    """
    # Подключиться к таблице игр
    gameTable = SQLiteGameRepository()
    # Получить все игры из БД
    games = gameTable.getAll()
    # Вывести все игры
    for game in games:
        print(game.toString())

def getAvgRatingGame():
    """
    Получение среднего рейтинга игры из БД
    """
    # Подключиться к таблице игр
    gameTable = SQLiteGameRepository()
    # Получение названия игры для расчета среднего рейтинга
    nameGame = input("Введите название игры: ")
    # Получение среднего рейтинга заданной игры из БД
    rating = gameTable.getAvgRating(Game(nameGame))
    # Вывести рейтинг заданной игры, если он рассчитался
    if rating is not None:
        print(rating)
    else:
        print("Невозможно рассчитать рейтинг данной игры!")

if __name__ == '__main__':
    while True:
        print("\nВыберите таблицу")
        choice = input("1 - Game; 2 - GameSeries; exit - для выхода\n")
        if choice == '1':
            # Работа с таблицей game
            tableGame()
        elif choice == '2':
            # Работа с таблицей GameSeries
            tableGameSeries()
        elif choice == 'exit':
            # Выход из программы
            break

