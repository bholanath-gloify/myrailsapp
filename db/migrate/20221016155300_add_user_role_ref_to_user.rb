class AddUserRoleRefToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_role, :integer, null: false, default: 1
  end
end
