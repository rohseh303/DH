import scraper

from flask import Flask

app = Flask(__name__)

@app.route('/run_script')
def run_script():
    # Call the python script here and return the result
    return scraper.getMenus()

if __name__ == '__main__':
    app.run()