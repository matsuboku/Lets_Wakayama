class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :explanation, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_one_attached :image
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height], gravity: :center).processed
  end

  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するか調べる
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  # 検索するためのメソッド
  def self.looks(search, word)
      @post = Post.where("title LIKE?","%#{word}%")
  end

end
