class BooksController < ApplicationController
  def new

    @book_opinion = Book.new
  end

  def create
    @user = User.new
    @book_opinion = Book.new(book_params)
    @book_opinion.user_id = current_user.id
    if @book_opinion.save
      redirect_to book_path(@book_opinion)
    else
      render :index
    end
  end

  def edit

  end

  def show
    @book = Book.find(params[:id])#userのidが欲しいがbookのコントローラなので現在のbookのidを@bookに格納する
    @book_opinion = Book.new
    @user = @book.user#上記で格納された現在のページのbookデータとuserのidを紐づける（モデル同士アソシエーション（関連付け）しているためできる）
  end

  def index
    @book_opinion = Book.new
    @books = Book.all
    @book_opinion.user_id = current_user.id
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end