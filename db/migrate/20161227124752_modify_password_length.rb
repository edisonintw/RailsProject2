class ModifyPasswordLength < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :password, :string, limit: 60
  end
end
