class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :explanation, presence: true

   has_one_attached :image
end
