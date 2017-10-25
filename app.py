from flask import Flask, render_template, redirect, url_for, flash, request, session
from functools import wraps
import string

app = Flask(__name__)

app.secret_key = 'lj)0di6i8jop#7$hk&)a9%92@0n6kf96jjm4m2p^j6h^(o(%+7'

# we define this function here so we don't have to keep specifying the database address
def database_connection():
    proc = subprocess.Popen('heroku config:get DATABASE_URL -a raisefree-01', stdout=subprocess.PIPE, shell=True)
    db_url = proc.stdout.read().decode('utf-8').strip() + '?sslmode=require'
    conn = psycopg2.connect(db_url)
    return conn

@app.route('/', methods=['GET', 'POST'])
def home():
	if request.method == 'POST':
		print(request.form)
		if 'email_input' in request.form.keys(): # if signup credentials were posted
			flash('post recognized')
			username, password, email = request.form['username_input'], request.form['password_input'], request.form['email_input']
			# above line assigns the inputted signup credentials
			conn = database_connection()
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
			conn = database_connection()
			curs = conn.cursor()
			curs.execute('SELECT id FROM users ORDER BY id;')
			existing_ids = curs.fetchall()
			new_id = existing_ids[-1] + 1
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