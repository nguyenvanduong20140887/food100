class FoodsController < ApplicationController
  before_action :load_food, only: [:show]

  def index
    @foods = Food.search(params[:search]).order name: :asc
    if @foods
    else
      @foods = Food.all.order name: :asc
    end
  end

  def show
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
