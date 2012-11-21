Feature: Merge Articles
  As a blog administrator
  In order to prevent merging by non-admin users
  I want to prevent non-administrative users from merging articles

  Background:
    Given the blog is set up
    And I add a publisher
    And I am logged in as the publisher

  Scenario: A non-admin cannot merge articles
    Given I am on the new article page
    When I fill in "article_title" with "random"
    And I fill in "article__body_and_extended_editor" with "foo bar baz guh"
    And I press "Publish"
    Given I am on the home page
    Then I should see "random"
    And I should see "foo bar baz guh"
    Given I am on the admin content page
    Then I should see "random"
    And I follow "random"
    Then I should not see "Merge Articles"
	