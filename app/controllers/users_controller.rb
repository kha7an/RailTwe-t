class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = current_user
    @user = User.includes(:posts, :comments)
  end

  def edit

  end

  def update

  end

end
