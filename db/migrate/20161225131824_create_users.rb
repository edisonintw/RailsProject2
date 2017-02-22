class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 60, null: false
      t.integer :age
      t.string :account, limit: 60  , null: false
      t.string :password, limit: 60 , null: false
      t.attachment :avatar
      t.timestamp
    end
  end


end
