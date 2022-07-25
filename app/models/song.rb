class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
  has_many :song_writers
  has_many :writers, through: :song_writers
end