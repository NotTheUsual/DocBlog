Given(/^I am on the new post page$/) do
  visit new_post_path
end

When(/^I upload a new doc$/) do
  attach_file('post[doc]', "#{::Rails.root.to_s}/features/fixtures/Blog Post 1.htm")
  click_button 'Upload'
end