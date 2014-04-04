class PostsController < ApplicationController
  def index

  end

  def admin_index
    @posts = Post.all
  end

  def new
    @post = "post"
  end

  def create
    title = params[:post][:doc].original_filename
    Post.upload(title)
    redirect_to new_post_path
  end
end
