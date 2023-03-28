import mysql.connector
import base64

# Conecto a MariaDB
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="bicyclestore"
)

# Obtener una referencia al cursor de la base de datos
mycursor = mydb.cursor()
values = [["Carbon fiber bicycle", "Description of carbon fiber bicycle", 2000.00, 1,"bike-carbon.jpg"],
            ["Electric bicycle", "Description of electric bicycle", 3000.00, 3, "bike-electric.jpg"],
            ["BMX bicycle", "Description of BMX bicycle", 1200.00, 4, "bike-bmx.jpg"],
            ["Aluminum bicycle", "Description of aluminum bicycle", 1000.00, 6, "bike-aluminum.jpg"],
            ["City bicycle", "Description of city bicycle", 800.00, 9, "bike-city.jpg"],
            ["Mountain Bike", "Mountain Bike Description", 1500.00, 11, "bike-mountain.jpg"]]

for val in values:
    with open("C:\\Users\\jouad\\Videos\\BD\\U7-Project\\img\\" + val[-1], "rb") as image_file:
        val[-1] = base64.b64encode(image_file.read())
        sql = "INSERT INTO Products (brand, description, price, supplier_id, image) VALUES (%s, %s, %s, %s, %s)"
        mycursor.execute(sql,val)
        mydb.commit()

# Recupera las imágenes de la base de datos y las guarda en el directorio static
sql = "SELECT id, image FROM Products"
mycursor.execute(sql)
resultIMG = mycursor.fetchall()

for x in resultIMG:
    with open("C:\\Users\\jouad\\OneDrive\\Documentos\\Git_Repositorios\\Api_IntermediateSQL\\static\\bike-" + str(x[0]) + ".jpg", "wb") as fh:
        fh.write(base64.decodebytes(x[1]))
    
    print("Image: " + str(x[0]))
