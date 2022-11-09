class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

  has_one_attached :profile_image
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
