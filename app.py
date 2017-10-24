from flask import Flask, render_template, redirect, url_for, flash, request, session
from functools import wraps

app = Flask(__name__)

app.secret_key = 'lj)0di6i8jop#7$hk&)a9%92@0n6kf96jjm4m2p^j6h^(o(%+7'

@app.route('/')
def home():
	return render_template('index.html')

@app.route('/dashboard')
def dashboard():
	return render_template('dashboard.html')

#start the server with the 'run()' method
if __name__ == '__main__':
    app.run(debug=True)