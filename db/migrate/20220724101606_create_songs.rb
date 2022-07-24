class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.integer :album_id
      t.string :produced_by
      t.string :spotify_link
      t.timestamps
    end
  end
end
