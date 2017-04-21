class Service < ApplicationRecord
  CATEGORIES = ["Arquitetura", "Web Design", "Programador Ruby Rails"]
  belongs_to :user
  has_many :proposals, dependent: :destroy
  validates :description, presence: true
  validates :user, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_attachments :photos, maximum: 20
end
