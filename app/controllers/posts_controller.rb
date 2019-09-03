class PostsController < ApplicationController
  before_action :move_to_index , except: :index
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
    Post.create(name: post_params[:name], have_done:post_params[:have_done],to_do: post_params[:to_do], comment: post_params[:comment], user_id: current_user.id )
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
