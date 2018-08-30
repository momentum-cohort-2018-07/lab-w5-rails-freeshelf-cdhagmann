class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
      t.index(:username, unique: true)
    end
  end
end
