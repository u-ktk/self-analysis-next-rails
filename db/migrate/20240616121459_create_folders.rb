class CreateFolders < ActiveRecord::Migration[7.1]
  def change
    create_table :folders, charset: "utf8mb4" do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true, type: :string
      t.timestamps
    end
  end
end
