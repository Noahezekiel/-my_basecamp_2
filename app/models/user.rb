class User < ApplicationRecord
    has_secure_password

    has_many :projects
    has_many :project_memberships
    has_many :joined_projects, through: :project_memberships, source: :project
  
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
  
    def admin?
      admin == true
    end

    # Method to set the role based on the admin status
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
  end
  