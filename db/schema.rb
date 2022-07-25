# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_24_103924) do

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.datetime "release_date"
    t.string "genre"
    t.string "spotify_link"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
  end

  create_table "song_writers", force: :cascade do |t|
    t.integer "song_id"
    t.integer "writer_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.integer "artist_id"
    t.integer "album_id"
    t.string "produced_by"
    t.string "spotify_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "writers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

end
