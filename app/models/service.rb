class Service < ApplicationRecord
  CATEGORIES = ["Arquitetura", "Web Design", "Programador Ruby Rails"]
  belongs_to :user
  has_many :proposals
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_attachment :photos, maximum: 20
end
