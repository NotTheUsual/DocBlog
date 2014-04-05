class Converter
  def self.to_html(post)
    HTML::Pipeline::MarkdownFilter.new(post.body).call
  end
end