class Post < ActiveRecord::Base
  def self.upload(arg)
    post = create
    post.title = arg.gsub('.htm', '')
    post.save
  end
end
