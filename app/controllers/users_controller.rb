class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]
  #onlyなくて大丈夫
  before_action :set_user, only: %I[show edit update destroy followers followeds]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def follower
    @user = User.find(params[:id])
    @follower = @user.following_user
  end

  def followed
    @user = User.find(params[:id])
    @followeds = @user.follower_user
  end



  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
