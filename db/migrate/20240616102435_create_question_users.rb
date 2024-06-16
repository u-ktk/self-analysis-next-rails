class CreateQuestionUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :question_users, charset: "utf8mb4" do |t|
      t.bigint :question_id, null: false
      t.string :user_id, null: false
      t.boolean :has_answers, default: false
      t.boolean :is_custom, default: false
      t.index [:question_id, :user_id], unique: true
    end

    add_foreign_key :question_users, :questions, column: :question_id
    add_foreign_key :question_users, :users, column: :user_id, primary_key: :id
  end
end
