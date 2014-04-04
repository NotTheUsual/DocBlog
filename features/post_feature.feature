Feature: Blog Posts
  In order to blog
  As a non-web-savvy writer
  I want to be able to write blog posts from Word

  Scenario: On the new post page
    Given I am on the new post page
    When I upload a new doc
    Then I should see the title of that post in the posts index