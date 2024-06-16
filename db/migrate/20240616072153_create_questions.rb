class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions, charset: "utf8mb4" do |t|
      t.integer :category_id, null:false
      t.string :text, null:false
      t.string :life_stage, null:false
      t.string :user_id, index: true
      t.boolean :is_custom, null: false, default: true
      t.timestamps
    end
    add_foreign_key :questions, :categories
    add_foreign_key :questions, :users, column: :user_id
  end
end
