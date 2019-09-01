class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').page(params[:page]).per(9)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    Post.create(post_params)
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:name, :have_done, :to_do, :comment)
  end

end
