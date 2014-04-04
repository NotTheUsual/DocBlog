class PostsController < ApplicationController
  def new
    @post = "post"
  end

  def create
    redirect_to new_post_path
  end
end
