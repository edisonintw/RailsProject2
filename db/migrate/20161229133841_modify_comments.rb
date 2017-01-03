class ModifyComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :username
    add_column :comments, :user_id, :integer
    remove_column :comments, :email

  end
end
