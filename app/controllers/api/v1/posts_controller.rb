class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  skip_before_action :verify_authenticity_token


  def index
    if params[:sort] == "newest"
      @posts = Post.order(created_at: :asc)
    else
      @posts = Post.order(created_at: :desc)
    end
    render json: @posts
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
