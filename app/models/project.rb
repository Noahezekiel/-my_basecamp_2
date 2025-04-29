class Project < ApplicationRecord
  belongs_to :user # creator
  has_many :project_threads, dependent: :destroy
  has_many :attachments, dependent: :destroy 

  has_many :project_memberships, dependent: :destroy
  has_many :members, through: :project_memberships, source: :user

  after_create :add_creator_as_admin

  private

  def add_creator_as_admin
    project_memberships.create(user: user, role: :admin)
  end
end
