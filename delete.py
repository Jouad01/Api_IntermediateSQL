import mysql.connector

# Conecto a MariaDB
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="bicyclestore"
)

# Obtener una referencia al cursor de la base de datos
mycursor = mydb.cursor()

# Borrar todos los datos de la tabla Products
sql = "DELETE FROM Products"
mycursor.execute(sql)
mydb.commit()

