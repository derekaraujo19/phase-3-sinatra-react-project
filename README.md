# Backend DB for Song.portfolio

SONG.PORTFOLIO is a one-stop shop for musicians and song creators to keep a record of their work.  It lets users create, edit, and delete song entries as well as their corresponding albums.  Unlike the current methods of music archiving (like Google Drive and Dropbox), SONG.PORTFOLIO allows the user to log and perform queries based on certain musical attributes.

The frontend repository can be found here: [github.com/derekaraujo19/phase-3-sinatra-react-frontend](https://github.com/derekaraujo19/phase-3-sinatra-react-frontend)

A video walkthrough of the application running can be found [here](https://www.youtube.com/watch?v=KY3WjMBmdzE&ab_channel=DerekAraujo).

## Data

The data is split up into two tables: Songs and Albums. The Albums table has title, release_date, genre, and spotify_link keys. The Songs table has name, artist, spotify_link keys. Album_id is the foreign key, which corresponds to the Album's primary key.

A favorite boolean column is included in the Songs table but is not currently being used in this build.
