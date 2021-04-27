class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @wishes = current_user.wishes
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
