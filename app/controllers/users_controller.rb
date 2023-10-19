class UsersController < ApplicationController
  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
  end
end
