import psycopg2
from flask import Flask, render_template, request

app = Flask(__name__)

connect = psycopg2.connect("dbname=music user=postgres password=dlwjdgns1587")
cur = connect.cursor()


@app.route('/', methods=['GET'])
def main():
    cur.execute("select artist, title, album, plays from music natural join albums natural join artists order by plays desc")
    result = cur.fetchall()
    cur.execute("with mostplay as (select artist, sum(plays) from artists natural join albums natural join music group by artist) select artist from mostplay where sum=(select max(sum) from mostplay)")
    most = cur.fetchall()
    return render_template("main.html", dataset=result, most = most)


@app.route('/search')
def search():
    return render_template("search.html")

curr_music = []
curr_feat = []

@app.route('/music_info', methods=['POST'])
def information():
    global curr_music, curr_feat
    title = request.form["title"]

    cur.execute("select * from music natural join albums natural join artists where title='{}'".format(title))
    search_music = cur.fetchall()
    curr_music = search_music
    cur.execute("select artist from music, featuring where music.music_id=featuring.music_id and title='{}'".format(title))
    search_feat = cur.fetchall()
    curr_feat = search_feat

    return render_template("info.html", music = search_music, feat = search_feat)


@app.route('/playing')
def play():
    cur.execute("update music set plays=plays+1 where music_id='{}'".format(curr_music[0][3]))
    music = curr_music
    return render_template("playing.html", music = music)


@app.route('/new')
def new():
    return render_template("new.html")


@app.route('/add', methods=['POST'])
def add():
    id = request.form["id"]
    title = request.form["title"]
    album = request.form["album"]
    year = request.form["year"]
    genre = request.form["genre"]
    artist = request.form["artist"]

    cur.execute("insert into albums values('{}', {}, '{}', '{}')".format(album, year, genre, artist))
    cur.execute("insert into music values ({}, '{}', '{}', 0)".format(id, title, album))
    return render_template("add.html")


@app.route('/delete')
def delete():
    cur.execute("delete from music where music_id='{}'".format(curr_music[0][3]))
    return render_template("delete.html")


if __name__ == '__main__':
    app.run()
