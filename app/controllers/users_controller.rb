class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.includes(:posts, :comments).find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  def edit

  end

  def update

  end

end
