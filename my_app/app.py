from flask import Flask
import logging

app = Flask(__name__)

# Настройка логирования
logging.basicConfig(level=logging.INFO)

@app.route('/')
def home():
    app.logger.info("Home page accessed")
    return "Hello, World!"

if __name__ == "__main__":
    app.run(host='0.0.0.0')