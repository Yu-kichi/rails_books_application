class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :address, length: { maximum: 80 }
  validates :introduction, length: { maximum: 500 }
  # validates :zip_code,  length: {in: 4..10}#inにするとnilでもエラーになる。新規登録ページで郵便番号の登録が4文字以上必要となりエラーになる為考え直し。
  has_many :user_books
  has_many :books, through: :user_books
end
