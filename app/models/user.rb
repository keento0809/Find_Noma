class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # postsテーブルとlikesテーブルの中間テーブル
  has_many :like_posts, through: :likes, source: :post
  # test
  # has_many :liked_posts, through: :likes, source: :post

  # ゲストログイン機能の実装
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now # Confirmableを使用している場合は必要
    end
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

  def myposts
    return Post.where(user_id: self.id)
  end

  # uploaderを実装したいクラスに以下のコードを追加
  mount_uploader :image, ImageUploader
end
