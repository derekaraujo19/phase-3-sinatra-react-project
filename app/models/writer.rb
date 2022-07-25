class Writer < ActiveRecord::Base
  has_many :song_writers
  has_many :songs, through: :song_writers

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end