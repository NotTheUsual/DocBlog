Feature: Blog Posts
  In order to blog
  As a non-web-savvy writer
  I want to be able to write blog posts from Word

  Scenario: On the new post page
    Given I am on the new post page
    When I upload a new doc
    Then I should see the title of that post in the posts index
    And I should see the date that post was created

  Scenario: Adding two posts
    When I upload two docs
    Then I should see both titles in the posts index

  Scenario: Viewing content
    Given I am on the new post page
    And I have uploaded a new doc
    When I visit the homepage
    Then I should see the text of the doc
    And it should be formatted correctly