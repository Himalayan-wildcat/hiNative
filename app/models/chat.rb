class Chat < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  validates :user_id, presence: true
end
