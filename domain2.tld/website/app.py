from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
	return "Hey. I'm a simple Flask-driven website."

# Not required, if we run app using gunicorn.
# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=5000, debug=True)
