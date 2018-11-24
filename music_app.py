import mysql.connector

mydb = mysql.connector.connect(
  host="192.168.55.153",
  user="arstan",
  passwd="mysql",
  database="music_collection"
)

mycursor = mydb.cursor()

def show_all():

    mycursor.execute("""
    SELECT Songs.name, Albums.name, Artists.name, Subgenres.name, Genres.name, Songs.release_date, Songs.duration FROM Songs
    INNER JOIN Albums ON Songs.album_id = Albums.id
    INNER JOIN Artists ON Albums.artist_id = Artists.id
    INNER JOIN Subgenres ON Albums.subgenre_id = Subgenres.id
    INNER JOIN Genres ON Subgenres.genre_id = Genres.id
    """)

    myresult = mycursor.fetchall()

    songs = [x[0] for x in myresult]
    albums = [x[1] for x in myresult]
    artists = [x[2] for x in myresult]
    subgenres = [x[3] for x in myresult]
    genres = [x[4] for x in myresult]
    realease_date = [x[5] for x in myresult]
    duration = [x[6] for x in myresult]
    duration_formatted = []

    for t in duration:
        mins = (t / 60)
        secs = t % 60
        duration_formatted.append("%02d:%02d" % (mins, secs))

    # for x in duration_formatted:
    #     print(x)
    titles = ['Songs', 'Albums', 'Artists', 'Subgenres', 'Genres', 'Release Date', 'Duration']
    data = [titles] + list(zip(songs, albums, artists, subgenres, genres, realease_date, duration_formatted))

    for i, d in enumerate(data):
        line = '|'.join(str(x).ljust(25) for x in d)
        if (i == 0):
            print("   " + line)
        else:
            print("%d. %s" % (i, line))
        if i == 0:
            print('-' * len(line))

    # for x in myresult:
    #     print(x)

    print()


def show_all_songs():
    mycursor.execute("SELECT id, name FROM Songs")

    myresult = mycursor.fetchall()

    for x in myresult:
        print("%d. %s" % (x[0], x[1]))

    print()

def show_all_albums():
    mycursor.execute("SELECT id, name FROM Albums")

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%d. %s" % (x[0], x[1]))

    print()

def show_all_artists():
    mycursor.execute("SELECT id, name FROM Artists")

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%d. %s" % (x[0], x[1]))

    print()

def show_all_albums():
    mycursor.execute("SELECT id, name FROM Albums")

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%d. %s" % (x[0], x[1]))

    print()

def show_all_subgenres():
    mycursor.execute("SELECT id, name FROM Subgenres")

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%d. %s" % (x[0], x[1]))

    print()

def show_all_genres():
    mycursor.execute("SELECT id, name FROM Genres")

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%d. %s" % (x[0], x[1]))

    print()


def play_song(song_id):
    mycursor.execute("""
    SELECT Song_Files.url FROM Songs
    INNER JOIN Song_Files ON Songs.file_id = Song_Files.id
    WHERE Songs.id = %d
    """ % song_id)

    myresult = mycursor.fetchall()

    # mycursor.execute("""
    # SELECT file_id FROM Songs
    # WHERE id = %d
    # """ % song_id)
    #
    # myresult = mycursor.fetchall()
    #
    # file_id = myresult[0][0]
    #
    # mycursor.execute("""
    # SELECT url FROM Song_Files
    # WHERE id = %d
    # """ % file_id)
    #
    # myresult = mycursor.fetchall()

    print("Playing...\n%s" % myresult[0][0])
    print()

def show_album(song_id):
    mycursor.execute("""
    SELECT Albums.name FROM Songs
    INNER JOIN Albums ON Songs.album_id = Albums.id
    WHERE Songs.id = %d
    """ % song_id)

    myresult = mycursor.fetchall()

    print(myresult[0][0])
    print()

def show_artist(song_id):
    mycursor.execute("""
    SELECT Artists.name, Logos.url FROM Songs
    INNER JOIN Albums ON Songs.album_id = Albums.id
    INNER JOIN Artists ON Albums.artist_id = Artists.id
    INNER JOIN Logos ON Artists.logo_id = Logos.id
    WHERE Songs.id = %d
    """ % song_id)

    myresult = mycursor.fetchall()

    for x in myresult:
        print("%s - %s" % (x[0], x[1]))
    print()

def show_lyrics(song_id):
    mycursor.execute("""
    SELECT Lyrics.url FROM Songs
    INNER JOIN Lyrics ON Songs.lyrics_id = Lyrics.id
    WHERE Songs.id = %d
    """ % song_id)

    myresult = mycursor.fetchall()

    print(myresult[0][0])
    print()

def show_cover(song_id):
    mycursor.execute("""
    SELECT Album_Covers.url FROM Songs
    INNER JOIN Albums ON Songs.album_id = Albums.id
    INNER JOIN Album_Covers ON Albums.cover_id = Album_Covers.id
    WHERE Songs.id = %d
    """ % song_id)

    myresult = mycursor.fetchall()

    print(myresult[0][0])
    print()

def show_genre(song_id):
    mycursor.execute("""
    SELECT Subgenres.name, Genres.name FROM Songs
    INNER JOIN Albums ON Songs.album_id = Albums.id
    INNER JOIN Subgenres ON Albums.subgenre_id = Subgenres.id
    INNER JOIN Genres ON Subgenres.genre_id = Genres.id
    WHERE Songs.id = %d
    """ % song_id)

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%s - %s" % (x[0], x[1]))

    print()

def select_artist(artist_id):
    mycursor.execute("""
    SELECT name FROM Artists
    WHERE id = %d
    """ % artist_id)

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%s is selected" % (x[0]))

    print()

def show_persons(artist_id):
    mycursor.execute("""
    SELECT Persons.name, Person_Images.url FROM Persons
    INNER JOIN Person_Images ON Persons.image_id = Person_Images.id
    WHERE Persons.artist_id = %d
    """ % artist_id)

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%s - %s" % (x[0], x[1]))

    print()

def show_origin(artist_id):
    mycursor.execute("""
    SELECT Cities.name, Countries.name, Flags.url FROM Artists
    INNER JOIN Cities ON Artists.city_id = Cities.id
    INNER JOIN Countries ON Cities.country_id = Countries.id
    INNER JOIN Flags ON Countries.flag_id = Flags.id
    WHERE Artists.id = %d
    """ % artist_id)

    myresult = mycursor.fetchall()

    for x in myresult:
      print("%s - %s - %s" % (x[0], x[1], x[2]))

    print()

#( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)  BETTER VERSION OF SPOTIFY!1!  ( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)#

if __name__ == '__main__':

    song_id = -1
    artist_id = -1

    print("""
    Available commands:
        show all,
        show all songs,
        show all albums,
        show all artists,
        show all subgenres,
        show all genres,

        play <song_id>
        select artist <artist_id>

        If song is selected:
            show album,
            show artist,
            show lyrics,
            show cover,
            show genre

        If artist is selected:
            show persons,
            show origin
        """)
    while(True):
        command = input("Enter a command: ")
        command = command.lower()
        if (command == "show all"):
            show_all()

        if (command == "show all songs"):
            show_all_songs()

        if (command == "show all albums"):
            show_all_albums()

        if (command == "show all artists"):
            show_all_artists()

        if (command == "show all subgenres"):
            show_all_subgenres()

        if (command == "show all genres"):
            show_all_genres()

# if song is selected

        if ("play" in command):
            song_id = int(command[len(command) - 1])
            play_song(song_id)

        if (command == "show album"):
            if (song_id > 0):
                show_album(song_id)

        if (command == "show artist"):
            if (song_id > 0):
                show_artist(song_id)

        if (command == "show lyrics"):
            if (song_id > 0):
                show_lyrics(song_id)

        if (command == "show cover"):
            if (song_id > 0):
                show_cover(song_id)

        if (command == "show genre"):
            if (song_id > 0):
                show_genre(song_id)

# if artist is selected

        if ("select" in command):
            artist_id = int(command[len(command) - 1])
            select_artist(artist_id)

        if (command == "show persons"):
            if (artist_id > 0):
                show_persons(artist_id)

        if (command == "show origin"):
            if (artist_id > 0):
                show_origin(artist_id)
