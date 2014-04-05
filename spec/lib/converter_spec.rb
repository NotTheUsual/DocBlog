require 'spec_helper'

describe Converter do
  let(:post) { double :post, body: "# Header" }

  it "can convert stored Markdown to html" do
    expect(HTML::Pipeline::MarkdownFilter).to receive(:new).with("# Header").and_return(->{ "<h1>Header</h1>" })
    expect(Converter.to_html(post)).to eq("<h1>Header</h1>")
  end
end