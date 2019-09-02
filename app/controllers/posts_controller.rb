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
    @post = Post.find(params[:id])
  end

  def create
    Post.create(post_params)
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy 
  end

  private
  def post_params
    params.require(:post).permit(:name, :have_done, :to_do, :comment)
  end

end
