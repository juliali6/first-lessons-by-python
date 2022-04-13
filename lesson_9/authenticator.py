__author__ = "Юлия Кирик"


import os.path

from typing import Optional
from datetime import datetime
from exceptions import AuthorizationError, RegistrationError


class Authenticator:

    def __init__(self):
        """Метод переменных экземпляра класса."""

        self.user_login = None
        self.login: Optional[str] = None
        self._password: Optional[str] = None
        self.last_success_login_at: Optional[str] = None
        self.errors_count: [int] = 0

        if self._is_auth_file_exist():
            self._read_auth_file()


    def _is_auth_file_exist(self) -> bool:
        """Метод проверки наличия файла."""

        return os.path.exists('./auth.txt')


    def _read_auth_file(self):
        """Метод чтения и записи данных из файла."""

        with open("auth.txt" + "r") as f:
            self.login = f.readline().strip()
            self._password = f.readline().strip()
            self.last_success_login_at = datetime.fromisoformat(f.readline().strip())
            self.errors_count = f.readline().strip()


    def _update_auth_file(self):
        """Метод перезаписи количества попыток авторизации и время авторизации."""

        with open("auth.txt", "w") as f:
            f.write(f"{self.login}\n")
            f.write(f"{self._password}\n")
            f.write(f"{self.last_success_login_at}\n")
            f.write(f"{self.errors_count}")


    def registrate(self, login, password) -> None:
        """Метод регистрации пользователя.
        Делает проверку, что файла 'auth.txt' рядом нет.
        Создает этот файл и сохраняет логин, пароль, время
        и количество проваленных попыток при регистрации."""

        if self.login:
            self.errors_count += 1

            raise RegistrationError("Вы зарегистрированы.")

        if not login:
            self.errors_count += 1
            self._update_auth_file()
            raise RegistrationError("Вы не зарегистрированы.")

        self.login = login
        self._password = password
        self.last_success_login_at = datetime.utcnow()
        self._update_auth_file()


    def authorize(self, login, password) -> None:
        """Метод проверки логина и пароля."""

        if login != self.login and password != self._password:
            self.errors_count += 1
            self._update_auth_file()
            raise AuthorizationError("Вы не зарегистрированы")
