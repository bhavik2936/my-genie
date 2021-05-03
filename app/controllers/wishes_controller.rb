class WishesController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    @wishes = Wish.where(user_id: current_user.id)
  end

  def show
    @wish = Wish.find_by(id: current_user.id)
  end

  def new
    @wish = @user.wishes.build
  end

  def create
    @wish = @user.wishes.build(wish_params)

    ActiveRecord::Base.transaction do
      unless @user.wish_count == 0
        make_wish
        deduct_wish_count

        redirect_to authenticated_root_path
      else
        flash[:alert] = "You have used all your wishes!"
        render :new
      end
    end

  rescue
    render :new
  end

  private
    def wish_params
      params.require(:wish).permit(:wish_statement)
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def make_wish
      @wish.save!
    end

    def deduct_wish_count
      @user.update!(wish_count: @user.wish_count-1)
    end
end
