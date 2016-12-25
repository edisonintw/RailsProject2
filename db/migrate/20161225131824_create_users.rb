class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 20, null: false
      t.integer :age
      t.string :account, limit: 20 , null: false
      t.string :password, limit: 20, null: false
      t.timestamp
    end
  end
end
