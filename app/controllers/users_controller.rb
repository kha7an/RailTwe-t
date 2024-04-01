class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts, :comments).find(params[:id])
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
end
