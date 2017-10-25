from flask import Flask, render_template, redirect, url_for, flash, request, session
from functools import wraps
import psycopg2
import os
import urlparse
import read_env
import string

app = Flask(__name__)

app.secret_key = 'lj)0di6i8jop#7$hk&)a9%92@0n6kf96jjm4m2p^j6h^(o(%+7'

read_env.read_env()
urlparse.uses_netloc.append("postgres")
db_url = urlparse.urlparse(os.environ["DATABASE_URL"])

# we define this function here so we don't have to keep specifying the database address
def database_connection(db_url):
	return psycopg2.connect(
		database = db_url.path[1:],
		user = db_url.username,
		password = db_url.password,
		host = db_url.hostname,
		port = db_url.port)

@app.route('/', methods=['GET', 'POST'])
def home():
	if request.method == 'POST':

		if 'username_input' in request.form.keys(): # if signup credentials were posted
			username, password, email = request.form['username_input'], request.form['password_input'], request.form['email_input']
			# above line assigns the inputted signup credentials
			conn = database_connection(db_url)
			curs = conn.cursor()
			curs.execute('SELECT username, email FROM users;')
			existing_user_credentials = curs.fetchall()
			conn.close()

			# if the username or email submitted is already taken...
			existing_usernames = [entry[0] for entry in existing_user_credentials]
			existing_emails = [entry[1] for entry in existing_user_credentials]
			if username in existing_usernames:
				flash('Sorry, the username %s is already taken'.format(username))
				return redirect(url_for('home'))
			if email in existing_emails:
				flash('There is already an account registered to the email address %s'.format(email))
				return redirect(url_for('home'))

			# only allow characters/numbers and '_' in the username and password and only allow usernames/passwords of length <= 20
			allowed_characters = list(string.ascii_letters) + list(string.digits) + ['_']
			disallowed_characters_in_username = (not set(list(username)).issubset(allowed_characters))
			disallowed_characters_in_password = (not set(list(password)).issubset(allowed_characters))
			if (len(username) > 20) or (len(password) > 20) or disallowed_characters_in_password or disallowed_characters_in_username:
				flash('Usernames and passwords must be of length less than 20 and can contain only letters, digits and "_"')
				return redirect(url_for('home'))

			#else, proceed to make the account
			conn = database_connection(db_url)
			curs = conn.cursor()
			curs.execute('SELECT id FROM users ORDER BY id;')
			existing_ids = curs.fetchall()
			new_id = existing_ids[-1][0] + 1
			curs.execute('INSERT INTO users VALUES (%s, %s, %s, %s);', (new_id, username, password, email))
			conn.commit()
			conn.close()
			return redirect(url_for('home')) #for the time being, just go back to signup page
	return render_template('index.html')

@app.route('/dashboard/', methods=['GET', 'POST'])
def dashboard():
	return render_template('dashboard.html')

#start the server with the 'run()' method
if __name__ == '__main__':
    app.run(debug=True)
