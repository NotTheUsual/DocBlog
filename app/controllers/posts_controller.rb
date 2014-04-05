class PostsController < ApplicationController
  def index
    @posts = all_posts_as_html
  end

  def admin_index
    @posts = Post.all
    render layout: 'admin'
  end

  def new
    @post = "post"
    render layout: 'admin'
  end

  def create
    Post.upload(params[:post][:doc])
    redirect_to posts_path
  end

  private

  def all_posts_as_html
    Post.all.map { |post| Converter.to_html(post) }
  end
end
