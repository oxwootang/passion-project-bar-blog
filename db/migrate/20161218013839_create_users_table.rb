class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.text :email, null: false
      t.text :password_hash, null: false

      t.timestamps
    end
  end
end
