class AddNameToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :name, :string
  end
end
