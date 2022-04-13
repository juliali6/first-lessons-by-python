__author__ = "Юлия Кирик"

from typing import List
from datetime import datetime
from exceptions import ValidationError


class Data:
    """Класс конструктора name и age.
    Метод очистки от пробелов  name и age у экземпляра класса."""


    def __init__(self, name, age):
        self.name = name
        self.age = age

        self._clear_whitespaces()

        self.age = int(self.age)


    def _clear_whitespaces (self):
        """Метод очистки name и age от пробелов в начале и в конце строки."""

        self.name = self.name.strip()
        self.age = self.age.strip()


class DataWithDate(Data):
    """Дочерний класс от класса Data.
    Класс сохраняет текущее время, когда был создан экземпляр класса."""

    def __init__(self, name: int, age: int):
        super().__init__(name, age)
        self.time_end = datetime.utcnow()


class Validator:
    """Класс валидации данных"""


    def __init__(self):
        """Конструктор класса создает пустой список в экземпляре класса."""

        self.data_history: List[Data] = []


    def validate(self, data: Data):
        """Метод объекта класса Validator в котором хранится информация класса Data."""

        self.data_history.append(data)

        self._validate_name()
        self._validate_age()


    def _validate_name(self) -> None:
        """Функция проверки имени."""

        if not self.data_history[-1].name :
             raise ValidationError("Пустое имя")

        elif self.data_history[-1].name.count(" ") > 1:
            raise ValidationError("Нельзя больше одного пробела")

        elif len(self.data_history[-1].name ) < 3:
            raise ValidationError("Минимум 3 символа")


    def _validate_age(self) -> None:
        """Функция проверки возраста."""

        if self.data_history[-1].age <= 0:
            raise ValidationError("Недопустимо отрицательное число либо 0")

        elif self.data_history[-1].age < 14:
            raise ValidationError("Минимальный возраст - 14 лет.")