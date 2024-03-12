class UsersController < ApplicationController

  include UsersHelper
  def index
    @user = User.all
  end

  def show
    @user = User.includes(:posts, :comments).find(params[:id])
  end

  def edit

  end

  def update

  end


end
