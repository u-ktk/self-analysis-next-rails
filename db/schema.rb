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

ActiveRecord::Schema[7.1].define(version: 20_240_616_093_222) do
  create_table 'categories', id: :integer, charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'questions', charset: 'latin1', force: :cascade do |t|
    t.integer 'category_id', null: false
    t.string 'text', collation: 'utf8mb4_unicode_ci'
    t.string 'life_stage', collation: 'utf8mb4_unicode_ci'
    t.string 'user_id'
    t.boolean 'is_custom', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'fk_rails_d2f8aeda0b'
    t.index ['user_id'], name: 'index_questions_on_user_id'
  end

  create_table 'users', id: :string, charset: 'latin1', force: :cascade do |t|
    t.string 'name', null: false
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

  add_foreign_key 'questions', 'categories'
  add_foreign_key 'questions', 'users'
end
