class BooksController < ApplicationController
  def new

    @book_opinion = Book.new
  end

  def create

    @book_opinion = Book.new(book_params)
    @book_opinion.user_id = current_user.id
    @book_opinion.save
    redirect_to user_path(@book_opinion.user.id)
  end
  def edit

  end

  def show
    @book = Book.find(params[:id])#userのidが欲しいがbookのコントローラなので現在のbookのidを@bookに格納する
    @user = @book.user#上記で格納された現在のページのbookデータとuserのidを紐づける（モデル同士アソシエーション（関連付け）しているためできる）
  end

  def index
    @book_opinion = Book.new
    @books = Book.all
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end