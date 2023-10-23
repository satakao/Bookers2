class User < ApplicationRecord
  validates :name, presence: true#ユーザーネームを入れない状態でログインできないようにバリデーションをかけている
  has_many :books, dependent: :destroy#1:N userがbooksを複数投稿できる。dependent: :destroyで１側のuserのデータが削除された際に紐づけられてるN側も全て削除される
  has_one_attached :profile_image#モデルに画像を持たせる（activestorageインストール）
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name,
    length: { minimum: 2, maximum: 20 }

  validates :introduction,
    length: { maximum: 50 }

  def get_profile_image(width, height)
    if profile_image.attached?
     profile_image.variant(resize_to_limit: [width, height]).processed
    else
    'no_image.jpg'
    end
  end
end
