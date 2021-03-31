class Post < ApplicationRecord

    has_many :likes

    belongs_to :user

    # uploaderを実装したいクラスに以下のコードを追加
  mount_uploader :img, ImageUploader
end
