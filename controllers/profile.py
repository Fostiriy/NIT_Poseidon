from app import app
from flask import render_template


@app.route('/profile', methods=['GET'])
def profile():
    # выводим форму
    html = render_template('profile.html'
                           )
    return html
