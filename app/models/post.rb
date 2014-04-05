class Post < ActiveRecord::Base
  def self.upload(doc)
    post = new
    post.title = doc.original_filename.gsub('.htm', '')
    # File.open(Rails.root.join('public', 'uploads', doc.original_filename), 'w') do |file|
    #   file.write(doc.read)
    # end
    # wtm_doc = WordToMarkdown.new(Rails.root.join('features', 'fixtures', doc.original_filename))
    wtm_doc = WordToMarkdown.new(doc.read.force_encoding('utf-8'))
    # Try loading file from fixtures
    # Check edge ski
    post.body = wtm_doc.to_s
    post.save
  end

  def date
    created_at.strftime("%d/%m/%y")
  end
end
