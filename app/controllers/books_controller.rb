class BooksController < ApplicationController
  def new
    @book_opinion = Book.new
  end

  def create
    @book_opinion = Book.new(book_params)
    @book_opinion.user_id = current_user.id
    @book_opinion.save
    redirect_to book_path
  end
  def edit

  end

  def show

  end

  def index
    @books = Book.all
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end