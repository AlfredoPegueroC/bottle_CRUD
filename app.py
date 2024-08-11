from bottle import Bottle, request, template, redirect, response, static_file
import json
import sqlite3

app = Bottle()

# MODELO DE LA BASE DE DATOS 
def initialize_db():
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS items (
                     id INTEGER PRIMARY KEY AUTOINCREMENT,
                     name TEXT NOT NULL
                 )''')
    conn.commit()
    conn.close()
    
initialize_db()

# Conexion a la base de datos
def get_db_connection():
    conn = sqlite3.connect('app.db')
    conn.row_factory = sqlite3.Row
    return conn


# CRUD CON BOTTLE
@app.route('/')
def index():
    conn = get_db_connection()
    items = conn.execute('SELECT * FROM items').fetchall()
    conn.close()
    return template('index', items=items)

@app.route('/create', method=['GET', 'POST'])
def create():
    if request.method == 'POST':
        name = request.forms.get('name')
        conn = get_db_connection()
        conn.execute('INSERT INTO items (name) VALUES (?)', (name,))
        conn.commit()
        conn.close()
        redirect('/')
    return template('create')

@app.route('/details/<id>')
def read(id):
  conn = get_db_connection()
  item = conn.execute('SELECT * FROM items WHERE id = ?', (id,)).fetchone()
  conn.commit()
  conn.close()

  return template('details', item=item)


@app.route('/update/<id>', method=['GET', 'POST'])
def update(id):
    conn = get_db_connection()
    item = conn.execute('SELECT * FROM items WHERE id = ?', (id,)).fetchone()
    if request.method == 'POST':
        name = request.forms.get('name')
        conn.execute('UPDATE items SET name = ? WHERE id = ?', (name, id))
        conn.commit()
        conn.close()
        redirect('/')
    conn.close()
    return template('update', item=item)

@app.route('/delete/<id>')
def delete(id):
    conn = get_db_connection()
    conn.execute('DELETE FROM items WHERE id = ?', (id,))
    conn.commit()
    conn.close()
    redirect('/')

@app.route('/api/items', method='GET')
def api_get_items():
    conn = get_db_connection()
    items = conn.execute('SELECT * FROM items').fetchall()
    conn.close()
    # Convert rows to dictionaries
    items_list = [dict(item) for item in items]
    response.content_type = 'application/json'
    return json.dumps(items_list)

@app.route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='static')

if __name__ == '__main__':
    app.run(debug=True,  reloader=True)
