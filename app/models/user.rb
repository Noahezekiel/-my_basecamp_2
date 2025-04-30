class User < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :project_memberships
  has_many :joined_projects, through: :project_memberships, source: :project

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # Check if the user is a global admin
  def admin?
    admin == true
  end

  # Set role based on admin status
  def update_role!
    update(role: admin? ? 'Admin' : 'User')
  end

  def make_admin!
    update(admin: true)
    update_role!
  end

  def remove_admin!
    update(admin: false)
    update_role!
  end

  # Check if the user is the creator (owner) of a project
  def owns_project?(project)
    project.user_id == id
  end

  # Check if the user can manage a project (either an admin or the project owner)
  def can_manage_project?(project)
    admin? || owns_project?(project)
  end
end
