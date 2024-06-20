from flask import Flask, request
import logging

app = Flask(__name__)

# Настроим логирование
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.route('/')
def hello_world():
    logger.info('Hello world endpoint was reached')
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0')
