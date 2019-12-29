from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello world!"

@app.route("/intense")
def intense():
    return "This is intense page"


# instead of flask run, python app.py
if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')