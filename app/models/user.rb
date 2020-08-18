class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :address, length: {maximum: 80}
  validates :introduction, length: {maximum: 500}
  validates :zip_code,  length: {in: 4..10}
end
