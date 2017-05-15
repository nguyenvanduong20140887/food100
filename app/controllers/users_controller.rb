class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "flash.success.login"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
    :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:dander] = t "flash.danger.find_user"
      redirect_to root_url
    end
  end
end
