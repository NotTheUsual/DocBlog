class PostsController < ApplicationController
  def admin_index
    @posts = Post.all
  end

  def new
    @post = "post"
  end

  def create
    Post.upload("nothing yet")
    redirect_to new_post_path
  end
end
