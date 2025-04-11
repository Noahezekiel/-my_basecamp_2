class Message < ApplicationRecord
  belongs_to :thread
  belongs_to :user

  validates :content, presence: true
end
