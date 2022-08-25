class ChangeAlbumDateToString < ActiveRecord::Migration[6.1]
  def change
    change_column :albums, :release_date, :string
  end
end
