Given(/^I am on the new post page$/) do
  visit new_post_path
end

When(/^I (?:upload|have uploaded) a new doc$/) do
  attach_file('post[doc]', "#{::Rails.root.to_s}/features/fixtures/Blog Post 1.htm")
  click_button 'Upload'
end

When(/^I upload two docs$/) do
  visit new_post_path
  attach_file('post[doc]', "#{::Rails.root.to_s}/features/fixtures/Blog Post 1.htm")
  click_button 'Upload'
  visit new_post_path
  attach_file('post[doc]', "#{::Rails.root.to_s}/features/fixtures/Blog Post 2.htm")
  click_button 'Upload'
end

When(/^I visit the homepage$/) do
  visit root_path
end

Then(/^I should see the title of that post in the posts index$/) do
  visit posts_path
  expect(page).to have_content("Blog Post 1")
end

Then(/^I should see both titles in the posts index$/) do
  visit posts_path
  expect(page).to have_content("Blog Post 1")
  expect(page).to have_content("Blog Post 2")
end

Then(/^I should see the text of the doc$/) do
  expect(page).to have_content("Dear diary, I want to create a blog and haven't been able to find anything satisfactory. Can you help?")
end

Then(/^I should see the date that post was created$/) do
  expect(page).to have_content(Time.now.strftime("%d/%m/%y"))
end

Then(/^it should be formatted correctly$/) do
  expect(page).not_to have_content("#")
end