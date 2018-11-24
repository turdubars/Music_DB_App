import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="266625Bek",
  database="music"
)

mycursor = mydb.cursor()

mycursor.execute("DROP DATABASE music")

mycursor.execute("CREATE DATABASE music_collection")
