class Attachment < ApplicationRecord
  belongs_to :project
  has_one_attached :file

  validates :file, presence: true
end
