class AddRoleToUser < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :role, :integer, using: 'role::integer'
  end
end
