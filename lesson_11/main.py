__author__ = "Юлия Кирик"


from random import randint
from authenticator import Authenticator
from exceptions import AuthorizationError, RegistrationError


def guess_number_game():
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


def decorator(func):
    """Функция декоратора.
    Возвращает True, если в функции main не было ни одной ошибки
    регистрации/авторизации"""

    def wrapper():
        while True:
            if func():
                break

    return wrapper()


authenticator = Authenticator()


@decorator
def main() -> bool:
    """Функция вызова всех данных функций."""

    if authenticator.login:
        print("Для авторизации введите логин и пароль.")
    else:
        print("Для регистрации придумайте логин и пароль.")

        login = input("Введите Ваш логин: ")
        password = input("Введите Ваш пароль: ")

        if authenticator:

            try:
                authenticator.authorize(login, password)
                print(f"Приветствую! Ваш логин:{authenticator.login}.\n"
                      f"Время последней успешной авторизации: {authenticator.last_success_login_at: %D:%M:%Y %H:%M:%S}."
                      f"Количество попыток авторизации: {authenticator.errors_count}.\n ")

            except AuthorizationError as mistake:
                print(mistake)
                return False

        else:

            try:
                authenticator.registrate(login, password)
            except RegistrationError as mistake:
                print(mistake)
                return False

        guess_number_game()


if __name__ == "__main__":
    main()