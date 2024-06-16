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

ActiveRecord::Schema[7.1].define(version: 20_240_616_122_448) do
  create_table 'categories', id: :integer, charset: 'utf8mb4', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'folder_questions', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'question_id', null: false
    t.bigint 'folder_id', null: false
    t.index ['folder_id'], name: 'fk_rails_f04b6b6bbf'
    t.index ['question_id'], name: 'fk_rails_9dcf4c175b'
  end

  create_table 'folders', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'fk_rails_2a04d378cf'
  end

  create_table 'question_users', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'question_id', null: false
    t.string 'user_id', null: false
    t.boolean 'has_answers', default: false
    t.boolean 'is_custom', default: false
    t.index %w[question_id user_id], name: 'index_question_users_on_question_id_and_user_id', unique: true
    t.index ['user_id'], name: 'fk_rails_3a345593b5'
  end

  create_table 'questions', charset: 'utf8mb4', force: :cascade do |t|
    t.integer 'category_id', null: false
    t.string 'text', null: false
    t.string 'life_stage', null: false
    t.string 'user_id'
    t.boolean 'is_custom', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'fk_rails_d2f8aeda0b'
    t.index ['user_id'], name: 'index_questions_on_user_id'
  end

  create_table 'users', id: :string, charset: 'utf8mb4', force: :cascade do |t|
    t.string 'nickname', null: false
    t.string 'email', null: false
    t.string 'encrypted_password', null: false
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token'
    t.index ['email'], name: 'index_users_on_email'
  end

  add_foreign_key 'folder_questions', 'folders'
  add_foreign_key 'folder_questions', 'questions'
  add_foreign_key 'folders', 'users'
  add_foreign_key 'question_users', 'questions'
  add_foreign_key 'question_users', 'users'
  add_foreign_key 'questions', 'categories'
  add_foreign_key 'questions', 'users'
end
