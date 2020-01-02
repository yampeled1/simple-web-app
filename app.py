from flask import Flask
from subprocess import check_output

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello world!"

@app.route("/intense")
def get_shell_script_output_using_check_output():
    stdout = check_output(['./stress.sh']).decode('utf-8')
    return "This is intense page"


# instead of flask run, python app.py
if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')