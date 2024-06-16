class AlterNameUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :name, :nickname
  end
end
