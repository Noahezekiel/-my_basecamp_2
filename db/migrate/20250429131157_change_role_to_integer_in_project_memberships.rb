class ChangeRoleToIntegerInProjectMemberships < ActiveRecord::Migration[6.1]
  def change
    change_column :project_memberships, :role, :integer, default: 0, using: 'role::integer'
  end
end
