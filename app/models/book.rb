class Book < ApplicationRecord
  belongs_to :user#1:N userモデルを参照する。user_idのカラムをbookのmigrationファイルに設定することでuser_idを取得できる
  validates :title, presence: true
  validates :body, presence: true

  validates :body,
   length: { maximum: 200 }
end
