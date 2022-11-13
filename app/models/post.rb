class Post < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
end
