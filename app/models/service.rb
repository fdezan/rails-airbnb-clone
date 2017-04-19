class Service < ApplicationRecord
  CATEGORIES = ["Arquitetura", "Web Design", "Programador Ruby Rails", "Engenharia Civil", "Categoria 1", "Categoria 2" ]
  belongs_to :user
  has_many :proposals
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_attachments :photos, maximum: 20
end
