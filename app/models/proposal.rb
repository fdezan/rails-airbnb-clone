class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :description, presence: true
  has_attachments :photos, maximum: 6
end
