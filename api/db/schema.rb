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

ActiveRecord::Schema[7.0].define(version: 2023_02_09_072858) do
  create_table "books", charset: "utf8", force: :cascade do |t|
    t.bigint "genre_id", comment: "紐づくジャンルがあれば"
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "contents", charset: "utf8", force: :cascade do |t|
    t.bigint "book_id", comment: "紐づくbookがあれば"
    t.string "word", null: false, comment: "検索する言葉"
    t.string "summary", null: false, comment: "概要"
    t.string "description", null: false, comment: "詳細説明"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_contents_on_book_id"
    t.index ["word"], name: "index_contents_on_word"
  end

  create_table "genres", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_books", charset: "utf8", comment: "紐づくジャンルがない時", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_user_books_on_book_id"
    t.index ["user_id"], name: "index_user_books_on_user_id"
  end

  create_table "user_contents", charset: "utf8", comment: "紐づくbookがなければ", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "content_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_user_contents_on_content_id"
    t.index ["user_id"], name: "index_user_contents_on_user_id"
  end

  create_table "user_genres", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_user_genres_on_genre_id"
    t.index ["user_id"], name: "index_user_genres_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "books", "genres", on_delete: :nullify
  add_foreign_key "contents", "books", on_delete: :nullify
  add_foreign_key "user_books", "books", on_delete: :cascade
  add_foreign_key "user_books", "users", on_delete: :cascade
  add_foreign_key "user_contents", "contents", on_delete: :cascade
  add_foreign_key "user_contents", "users", on_delete: :cascade
  add_foreign_key "user_genres", "genres", on_delete: :cascade
  add_foreign_key "user_genres", "users", on_delete: :cascade
end
