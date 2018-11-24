import mysql.connector

con = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="266625Bek",
  database="music_collection"
)
cursor = con.cursor()

sql = 'INSERT INTO Persons (name, artist_id, image_id) VALUES ("Gabry Ponte", 4, 4);'

cursor.execute(sql)
con.commit()

print("inserted")
