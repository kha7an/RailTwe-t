class UsersController < ApplicationController
  include UsersHelper
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.includes(:posts, :comments).find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user == current_user
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      if @user.update(user_params)
        redirect_to @user, notice: 'Профиль успешно обновлен.'
      else
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        render :edit
      end
    else
      redirect_to root_path, alert: 'Вы не можете редактировать этот профиль.'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Подписки"
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Подписчики"
    @user = User.find(params[:id])
    @followers = @user.followers
    render 'show_followers'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
