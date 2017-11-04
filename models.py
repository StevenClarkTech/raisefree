from sqlapp import db

class User(db.Model):

	__table__ = db.Model.metadata.tables["users"]

	#id = db.Column(db.Integer, primary_key=True)
	#username = db.Column(db.String, nullable=False)
	#password = db.Column(db.String, nullable=False)
	#email = db.Column(db.String, nullable=False)

	def __repr__(self):
		return '<User %r>' % self.username

