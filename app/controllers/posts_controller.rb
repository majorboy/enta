class PostsController < ApplicationController
  def index

  end

  def new
    @post = Post.new
  end

  def create

  end

  private
  def post_params
  end

end
