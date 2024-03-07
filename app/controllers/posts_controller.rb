class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:sort] == "newest"
      @posts = Post.order(created_at: :asc)
    else
      @posts = Post.order(created_at: :desc)
    end
    @post = Post.new
  end
  def new
    @post = current_user.posts.build
  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to ""
    else
      flash[:alert] = @post.errors.full_messages.join(", ") unless @post.errors.empty?
      redirect_to ""
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments # Получаем комментарии для этого поста
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path
    else
      redirect_to @post
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to @post
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by current_user
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
    @action = "edit"
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Пост успешно обновлен.'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end