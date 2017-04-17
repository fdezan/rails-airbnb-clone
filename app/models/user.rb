class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :proposals
  has_many :services
  has_many :jobs, through: :services, source: :proposals


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
