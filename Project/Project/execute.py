import mysql.connector

mydb = mysql.connector.connect(
  host="5.59.11.66",
  user="arstan",
  passwd="mysql",
  database="arstan"
)

mycursor = mydb.cursor()

sql = "UPDATE Song_Files SET url = '/home/arstan/Desktop/Database Principles/Songs_For_Project/Eiffel 65 - Blue (Da Ba Dee).mp3' WHERE id = 2;"

mycursor.execute(sql)

mydb.commit()

print(mycursor.rowcount, "record(s) affected")
