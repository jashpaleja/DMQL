import psycopg2
from flask import Flask, render_template, request

con = psycopg2.connect(
    database="InstaCart",
    user="postgres",
    password="#2iforeverk",
    host="localhost",
    port='5432'
)

cursor = con.cursor()
app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def main():
    return render_template('index.html')

@app.route("/add-query", methods=["POST"])
def results():
    if request.method == "POST":
        query = request.form["query_entered"]
        cursor.execute(query)
        results = cursor.fetchall()
        column_names = [desc[0] for desc in cursor.description]
        results_with_columns = [dict(zip(column_names, row)) for row in results]
        return render_template('results.html', results=results_with_columns)

if __name__ == "__main__":
    app.run()
