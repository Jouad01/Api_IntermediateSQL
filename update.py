import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="bicyclestore"
)

mycursor = mydb.cursor()

# Ejecutar la actualización
sql = "UPDATE Products SET price = %s WHERE id = %s"
val = (2200.00, 21)
mycursor.execute(sql, val)

# Confirmar los cambios en la base de datos
mydb.commit()

print(mycursor.rowcount, "Updated datas.")
