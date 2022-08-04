class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # READ - All
  get "/songs" do
    songs = Song.all
    songs.to_json(include: :album)
  end
  get "/albums" do
    albums = Album.all
    albums.to_json
  end

  # READ - Individual
  get "/songs/:id" do
    # look up the song in the database using its ID
    song = Song.find(params[:id])
    # send a JSON-formatted response of the game data
    song.to_json(include: :album)
  end
  get "/albums/:id" do
    album = Album.find(params[:id])
    album.to_json(include: :songs)
  end

  # CREATE(post) - All

  # UPDATE - Individual

  # Delete -
  delete "/songs/:id" do
    # find the song using the ID
    song = Song.find(params[:id])
    # delete the song
    song.destroy
    # send a response with the deleted song as JSON
    song.to_json
  end
  delete "/albums/:id" do
    album = Album.find(params[:id])
    album.destroy
    album.to_json
  end

end

