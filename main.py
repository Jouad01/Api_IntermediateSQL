from flask import Flask, render_template, request
import mysql.connector
import base64

app = Flask(__name__)

# Conecto a MariaDB
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="bicyclestore"
)

# ruta para mostrar la página principal
@app.route('/')
def home():
    # realiza la consulta para obtener todos los productos
    cursor = db.cursor()
    sql = "SELECT * FROM Products"
    cursor.execute(sql)
    results = cursor.fetchall()

    # decodifica los datos de las imagenes y genera una url de datos para cada imagen
    products = []
    for result in results:
        image_data = base64.b64decode(result[5])
        image_url = "data:image/jpeg;base64," + base64.b64encode(image_data).decode('utf-8')
        product = {
            'id': result[0],
            'brand': result[1],
            'description': result[2],
            'price': result[3],
            'supplier_id': result[4],
            'image_url': image_url
        }
        products.append(product)

    # muestra el fichero con los resultados de la consulta
    return render_template('index.html', products=products)

if __name__ == '__main__':
    app.run()