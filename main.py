import os
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    # Check if running as a bundled executable
    if getattr(sys, 'frozen', False):
        # If the application is frozen, use the directory of the executable
        base_path = sys._MEIPASS
    else:
        # If not frozen, use the current directory
        base_path = os.path.dirname(os.path.abspath(__file__))

    # Set the template folder
    app.template_folder = os.path.join(base_path, 'templates')

    app.run(debug=True)