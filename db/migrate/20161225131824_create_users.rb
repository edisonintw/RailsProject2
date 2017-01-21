class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 60, null: false
      t.integer :age
      t.string :account, limit: 60  , null: false
      t.string :password, limit: 60 , null: false
      t.timestamp
    end
  end

  def self.up
    change_table :users do |t|
      t.attachment :avatar
    end
  end
  def self.down
    remove_attachment :users, :avatar
  end

end
