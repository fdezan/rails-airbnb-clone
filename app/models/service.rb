class Service < ApplicationRecord
  CATEGORIES = ["Arquitetura", "Web Design", "Programador Ruby Rails"]
  belongs_to :user
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
