class User < ApplicationRecord
  has_many :books, dependent: :destroy#1:N userがbooksを複数投稿できる。dependent: :destroyで１側のuserのデータが削除された際に紐づけられてるN側も全て削除される
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
