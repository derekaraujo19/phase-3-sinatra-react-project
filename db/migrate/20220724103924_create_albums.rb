class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.date :release_date
      t.string :genre
      t.string :spotify_link
    end
  end
end
