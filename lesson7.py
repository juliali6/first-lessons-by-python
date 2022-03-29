__author__ = "Юлия Кирик"


from typing import Optional
from random import randint
from datetime import datetime
from validator import Validator
from validator import DataWithDate
from exceptions import ValidationError



def get_passport_advice(passport):
    """Функция с советом получить паспорт в определенный возраст."""

    if 16 <= passport <= 17:
         return "Не забудь получить первый  паспорт по достижению 16 лет."

    elif 25 <= passport <= 26:
        return "Не забудь заменить паспорт по достижению 25 лет."

    elif 45 <= passport <= 46:
        return "Не забудь заменить второй раз паспорт по достижению 45 лет."


def guess_number_game() :
    """Функция "Угадай число"."""

    game_number = randint(1, 5)

    error_numbers = 0

    while True:

        number_game = input("Угадай число от 1 до 5: ")
        number_game = int(number_game.strip())

        if number_game == game_number:
            print(f"Вы угадали! Это {number_game}! Количество попыток {error_numbers + 1}.")
            break
        else:
            print(f"Вы не угадали. Попробуйте снова.")

        error_numbers += 1


def main():
    """Функция вызова всех данных функций."""

    validate_data = Validator()

    first_time = datetime.utcnow()
    error_counts = 0

    while True:
        if error_counts > 0:
            print(f"Попытка №: {error_counts + 1}.\nВведите заново.\n")

        your_name = input("Введите имя: ")
        your_age = input("Введите возраст: ")

        try:
            data = DataWithDate(your_name, your_age)
        except ValueError as e:
            error_counts += 1
            print(f"Я поймал ValueError ошибку при попытке перевести строку в int: {e}")
            continue

        try:
            validate_data.validate(data)
        except ValidationError as e:
            error_counts += 1
            print(f"Я поймал ошибку: {e}. ")
            continue

        break

    text = f"Привет, {your_name.title()}! Тебе {your_age} лет."
    document = get_passport_advice(data.age)

    if document:
        text += document

    print(f"Общее количество попыток: {error_counts + 1}.\n "
          f"Время первой попытки {first_time: %H:%M:%S}.\n"
          f"Время последней попытки {data.time_end: %H:%M:%S}.")

    print(text)

    guess_number_game()


if __name__ == "__main__":
    main()


