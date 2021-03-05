class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    @wishes = @user.wishes
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_wish_path(@user)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
