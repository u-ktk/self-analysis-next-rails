class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :name, null: false
      t.string :email, null: false, index: true
      t.string :encrypted_password, null: false
      t.string   :confirmation_token, index: true
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
      t.timestamps
    end
  end
end
