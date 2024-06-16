class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories, id: :integer, charset: "utf8mb4" do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
