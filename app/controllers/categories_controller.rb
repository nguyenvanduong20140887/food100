class CategoriesController < ApplicationController
  before_action :load_category, except: [:index, :new, :create]

  def index
    @categories =
      if params[:search]
        Category.search(params[:search]).order_in_scope
      else
        Category.order_in_scope
      end
  end

  def new
    @category = Category.new
  end

  def show
    @food = Category.find_follow_category params[:id]
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:dander] = t "flash.danger.find_food"
      redirect_to root_url
    end
  end
end
