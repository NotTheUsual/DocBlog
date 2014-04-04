class Post < ActiveRecord::Base
  def self.upload(arg)
    post = create
    post.title = "Blog Post"
    post.save
  end
end
