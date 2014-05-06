class PostsController < ApplicationController
  def index
    @posts = all_posts_as_html
  end

  def admin_index
    @posts = Post.all
    render layout: 'admin'
  end

  def new
    @post = Post.new
    render layout: 'admin'
  end

  def create
    Post.upload(params[:post][:doc])
    redirect_to posts_path
  end

  def convert
    doc = params[:file]
    wtm_doc = WordToMarkdown.new(doc.read.force_encoding('utf-8'))
    string = '{ "post": { "body": "' + wtm_doc.to_s + '" } }'
    json = string.gsub(/\n/, '\\n').to_json
    render json: json
  end

  private

  def all_posts_as_html
    Post.all.map { |post| Converter.to_html(post) }
  end
end
