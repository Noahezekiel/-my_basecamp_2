class ProjectThread < ApplicationRecord
  belongs_to :project
  has_many :messages, dependent: :destroy

  validates :title, presence: true
end
