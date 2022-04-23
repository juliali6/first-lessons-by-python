__author__ = "Юлия Кирик"


from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, world!'


@app.route('/111')
def work():
    return 'Its working!'


if __name__ == "__main__":
    app.run()
