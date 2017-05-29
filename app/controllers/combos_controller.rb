class CombosController < ApplicationController
  before_action :load_combo, except: [:index, :new, :create]

  def index
    @combos =
      if params[:search]
        Combo.search(params[:search]).order_in_scope
      else
        Combo.order_in_scope
      end
  end

  def new
    @combo = Combo.new
  end

  def show
    @food = Combo.find_follow_combo params[:id]
  end

  private

  def load_combo
    @combo = Combo.find_by id: params[:id]
    unless @combo
      flash[:danger] = t "flash.danger.find_food"
      redirect_to root_url
    end
  end
end
