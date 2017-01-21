class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
    t.string :title, limit: 100, null: false
    t.string :content, null: false
    t.timestamp
    end
  end
end
