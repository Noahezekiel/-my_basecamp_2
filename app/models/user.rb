class User < ApplicationRecord
    has_secure_password

    has_many :projects
  
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
  
    def admin?
      admin == true
    end
  end
  