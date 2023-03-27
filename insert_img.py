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

# Bike-carbon
with open("C:\\Users\\jouad\\Videos\\BD\\U7-Project\\img\\bike-carbon.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

sql = "INSERT INTO Products (brand, description, price, supplier_id, image) VALUES (%s, %s, %s, %s, %s)"
val = ("Carbon fiber bicycle", "Description of carbon fiber bicycle", 2000.00, 1, encoded_string)
mycursor.execute(sql, val)
mydb.commit()

# Bike-electric
with open("C:\\Users\\jouad\\Videos\\BD\\U7-Project\\img\\bike-electric.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

sql = "INSERT INTO Products (brand, description, price, supplier_id, image) VALUES (%s, %s, %s, %s, %s)"
val = ("Electric bicycle", "Description of electric bicycle", 3000.00, 3, encoded_string)
mycursor.execute(sql, val)
mydb.commit()

# Bike-bmx
with open("C:\\Users\\jouad\\Videos\\BD\\U7-Project\\img\\bike-bmx.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

sql = "INSERT INTO Products (brand, description, price, supplier_id, image) VALUES (%s, %s, %s, %s, %s)"
val = ("BMX bicycle", "Description of BMX bicycle", 1200.00, 4, encoded_string)
mycursor.execute(sql, val)
mydb.commit()

# Bike-aluminum
with open("C:\\Users\\jouad\\Videos\\BD\\U7-Project\\img\\bike-aluminum.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

sql = "INSERT INTO Products (brand, description, price, supplier_id, image) VALUES (%s, %s, %s, %s, %s)"
val = ("Aluminum bicycle", "Description of aluminum bicycle", 1000.00, 6, encoded_string)
mycursor.execute(sql, val)
mydb.commit()

# Bike-city
with open("C:\\Users\\jouad\\Videos\\BD\\U7-Project\\img\\bike-city.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

sql = "INSERT INTO Products (brand, description, price, supplier_id, image) VALUES (%s, %s, %s, %s, %s)"
val = ("City bicycle", "Description of city bicycle", 800.00, 9, encoded_string)
mycursor.execute(sql, val)
mydb.commit()

# Bike-mountain
with open("C:\\Users\\jouad\\Videos\\BD\\U7-Project\\img\\bike-mountain.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

sql = "INSERT INTO Products (brand, description, price, supplier_id, image) VALUES (%s, %s, %s, %s, %s)"
val = ("Mountain Bike", "Mountain Bike Description", 1500.00, 11, encoded_string)
mycursor.execute(sql, val)
mydb.commit()


# Recupera las imágenes de la base de datos y las guarda en el directorio static
sql = "SELECT id, image FROM Products"
mycursor.execute(sql)
resultIMG = mycursor.fetchall()

for x in resultIMG:
    with open("C:\\Users\\jouad\\OneDrive\\Documentos\\Git_Repositorios\\Api_IntermediateSQL\\static\\bike-" + str(x[0]) + ".jpg", "wb") as fh:
        fh.write(base64.decodebytes(x[1]))
    
    print("Image: " + str(x[0]))
