class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def admin_index
    @posts = Post.all
  end

  def new
    @post = "post"
  end

  def create
    doc = params[:post][:doc]
    Post.upload(doc)
    redirect_to new_post_path
  end
end
