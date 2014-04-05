class PostsController < ApplicationController
  def index
    @posts = Post.all.map do |post|
      HTML::Pipeline::MarkdownFilter.new(post.body, :gfm => false).call
    end
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
