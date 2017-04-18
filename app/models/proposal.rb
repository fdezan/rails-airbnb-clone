class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :description, presence: true
  has_attachment :photos, maximum: 6
end
