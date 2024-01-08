class AddRoleToProjectsUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :projects_users, :role, :string
  end
end
