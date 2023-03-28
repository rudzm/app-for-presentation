from flask import render_template

from shopapp import app


@app.route('/')
def index():
    version = app.config.get('VERSION', '1.0')

    # Renderujemy szablon HTML z przekazanymi danymi
    return render_template('index.html', version=version)
