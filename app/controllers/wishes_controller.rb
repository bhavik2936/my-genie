class WishesController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
  end

  def show
    @wish = Wish.find_by(id: params[:id])
  end

  def new
    @wish = @user.wishes.build
  end

  def create
    @wish = @user.wishes.build(wish_params)
    
    if @wish.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
    def wish_params
      params.require(:wish).permit(:wish_statement)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
