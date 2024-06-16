class CreateFolderQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :folder_questions do |t|
      t.bigint :question_id, null: false
      t.bigint :folder_id, null: false
    end
    add_foreign_key :folder_questions, :questions, column: :question_id
    add_foreign_key :folder_questions, :folders, column: :folder_id
  end
end
