# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151115141636) do

  create_table "chapters", force: :cascade do |t|
    t.integer "order"
    t.string  "book"
    t.text    "meaning"
    t.string  "audio_hebrow"
    t.string  "audio_arabic"
    t.string  "slug"
  end

  create_table "sentences", force: :cascade do |t|
    t.text    "hebrow"
    t.text    "arabic"
    t.text    "aramic"
    t.text    "english"
    t.integer "order"
    t.integer "chapter_id"
  end

end
