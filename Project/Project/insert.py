import mysql.connector

con = mysql.connector.connect(
  host="5.59.11.66",
  user="arstan",
  passwd="mysql",
  database="arstan"
)
cursor = con.cursor()

sql = 'INSERT INTO Song_Files (url) VALUES ("/home/arstan/Desktop/Database Principles/Songs_For_Project/Radiohead - Creep.m4a");'

cursor.execute(sql)
con.commit()

print("inserted")
