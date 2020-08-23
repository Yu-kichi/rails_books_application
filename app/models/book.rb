# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  has_many :user_books
  has_many :users, through: :user_books
  def created_by?(user)
    user_books.where(user_id: user.id).exists?
  end
end
