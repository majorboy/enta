class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').page(params[:page]).per(9)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:name, :have_done, :to_do, :comment)
  end

end
