class Book < ApplicationRecord
  belongs_to :user#1:N userモデルを参照する。user_idのカラムをbookのmigrationファイルに設定することでuser_idを取得できる
end
