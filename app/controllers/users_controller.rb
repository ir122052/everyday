class UsersController < ApplicationController
  before_action :correct_user, only: [:destroy]
  before_action :require_user_logged_in, only: [:index, :destroy]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '登録が完了しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = '退会しました。'
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :pets, :password, :password_confirmation)
  end
  
  def correct_user
    @user =User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
