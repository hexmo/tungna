class AddStausToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :status, :int, default: 0
  end
end
