class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # READ - All
  get "/songs" do
    songs = Song.all
    songs.to_json(include: :album)
  end
  get "/albums" do
    albums = Album.all
    albums.to_json(include: :songs)
  end

  # READ - Individual
  get "/songs/:id" do
    song = Song.find(params[:id])
    song.to_json(include: :album)
  end
  get "/albums/:id" do
    album = Album.find(params[:id])
    album.to_json(include: :songs)
  end

  # CREATE(post) - All
  post "/songs" do

    new_song_options={
      name: params[:name],
      artist: params[:artist],
      spotify_link: params[:spotify_link],
      favorite: params[:favorite]
    }
    #the album title text entering the front end from the POST
    album_title = params[:album_title]
    #album that already exists in the DB
    album = Album.find_by title: album_title

    # if it exists
    if album
    # setting its id into the :album_id param in the new song entry
      new_song_options[:album_id] = album.id
    #if it doesn't already exist but user is entering in a new title
    elsif album_title.length > 0
    # create an album with a new title and set that song's album_id to the new album.id
      album = Album.create(
        title: album_title
      )
      new_song_options[:album_id] = album.id
    end
    Song.create(new_song_options).to_json
  end

  post "/albums" do

    album = Album.create(
      title: params[:title],
      release_date: params[:release_date],
      genre: params[:genre],
      spotify_link: params[:spotify_link]
    )
    album.to_json
  end

  # UPDATE - Individual
  patch "/songs/:id" do

    song = Song.find(params[:id])
    updated_song_options={
      name: params[:name],
      artist: params[:artist],
      spotify_link: params[:spotify_link],
      favorite: params[:favorite]
    }
    #the album title text entering the front end from the PATCH
    album_title = params[:album_title]
    #album that already exists in the DB
    album = Album.find_by title: album_title

    if album
      updated_song_options[:album_id] = album.id
    elsif album_title.length > 0
      # puts "Creating Album = #{album_title}"
      album = Album.create(
        title: album_title
      )
      # puts "Album ID =  #{album.id}"
      updated_song_options[:album_id] = album.id
    end
    song.update(updated_song_options).to_json
  end

  patch "/albums/:id" do
    album = Album.find(params[:id])
    album.update(
      title: params[:title],
      release_date: params[:release_date],
      genre: params[:genre],
      spotify_link: params[:spotify_link]
    )
    album.to_json
  end

  # DELETE
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

