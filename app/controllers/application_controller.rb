class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get "/songs" do
    songs = Song.all
    songs.to_json(include: :album)
  end

  get "/albums" do
    albums = Album.all
    albums.to_json
  end

end
