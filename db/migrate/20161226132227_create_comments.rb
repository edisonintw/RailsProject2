class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.string :username, limit: 20, null: false
      t.string :message, null: false
      t.timestamp
    end
  end
end
