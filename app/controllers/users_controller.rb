class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @user = current_user
  end

  def create
    @user = User.new
  end

  def destroy
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_opinion = Book.new
  end

  private

  def user_params
    #ストロングパラメータで、名前とメールを受け取ることができるように設定しておく。
    params.require(:user).permit(:name, :profile_image ,:introduction)
  end
end
