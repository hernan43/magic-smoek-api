class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :username
  end
end
