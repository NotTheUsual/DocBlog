class PostsController < ApplicationController
  def index
    @posts = Post.all.map do |post|
      HTML::Pipeline::MarkdownFilter.new(post.body).call
    end
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
    doc = params[:post][:doc]
    Post.upload(doc)
    redirect_to posts_path
  end
end
