class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fullname, { limit: 64, null: false }
      t.string :email, { limit: 128, null: false }
      t.string :password_hash

      t.timestamps
    end
  end
end
