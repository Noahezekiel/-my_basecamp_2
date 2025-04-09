class User < ApplicationRecord
    has_secure_password
  
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
  
    def admin?
      admin == true
    end
  end
  