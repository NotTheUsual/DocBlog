class Post < ActiveRecord::Base
  def self.upload(doc)
    post = new
    post.title = doc.original_filename.gsub('.htm', '')
    wtm_doc = WordToMarkdown.new(doc.read.force_encoding('utf-8'))
    post.body = wtm_doc.to_s
    post.save
  end

  def date
    created_at.strftime("%d/%m/%y")
  end
end
