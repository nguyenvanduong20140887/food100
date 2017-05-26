class FoodsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show, :destroy]
  before_action :load_food, except: [:index, :new, :create]

  def index
    @foods =
      if params[:search]
        Food.search(params[:search]).order_in_scope
      else
        Food.order_in_scope
      end
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new food_params
    if @food.save
      flash[:success] = t "foods.create_success"
      redirect_to @food
    else
      flash[:danger] = t "foods.create_failed"
      redirect_to foods_url
    end
  end

  def show
  end

  def edit
  end

  def update
    if @food.update_attributes food_params
      flash[:success] = t "foods.profile_updated"
      redirect_to @food
    else
      flash[:danger] = t "foods.profile_update_failed"
      render :show
    end
  end

  def destroy
    if @food.destroy
      flash[:success] = t "foods.food_deleted"
    else
      flash[:danger] = t "foods.delete_failed"
    end
    redirect_to foods_url
  end

  private

  def food_params
    params.require(:food).permit :name, :price, :image, :description
  end

  def load_food
    @food = Food.find_by id: params[:id]
    unless @food
      flash[:dander] = t "flash.danger.find_food"
      redirect_to root_url
    end
  end
end
