class Post < ApplicationRecord
    validates :cafename, presence: true
    validates :comment, presence: true, length: {minimum:2, maximum:100}


    has_many :likes, dependent: :destroy
    # usersテーブルとlikesテーブルの中間テーブル
    has_many :liked_users, through: :likes, source: :user

    belongs_to :user

    # いいねの有無を確認するメソッドを定義
    def post_liked_by?(current_user)
      likes.where(user_id: current_user.id).exists?
    end

    # uploaderを実装したいクラスに以下のコードを追加
  mount_uploader :img, ImageUploader
end
