class ChangeRoleToIntegerInProjectMemberships < ActiveRecord::Migration[6.1]
  def change
    remove_column :project_memberships, :role, :string
    add_column :project_memberships, :role, :integer, default: 0
  end
end
