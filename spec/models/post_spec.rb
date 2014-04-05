require 'spec_helper'

describe Post do
  it "can return the date in a sensible format" do
    post = Post.new
    post.created_at = Time.now
    expect(post.date).to eq(Time.now.strftime("%d/%m/%y"))
  end

  it "can create a new instance of itself with a properly formatted body" do
    # how do you test Rails file uploads?
  end
end
