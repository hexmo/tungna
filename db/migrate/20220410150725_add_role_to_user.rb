class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :int, default: 0
  end
end