class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :album_id
      t.string :spotify_link
      t.boolean :favorite
      t.timestamps
    end
  end
end
