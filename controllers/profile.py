from app import app
from flask import render_template, session


@app.route('/profile', methods=['GET'])
def profile():
    # выводим форму
    html = render_template('profile.html',
                           building_code=session['building_code'],
                           client_name=session['client_name'],
                           )
    return html
