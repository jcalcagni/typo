Feature: Merge Articles
  As a blog administrator
  In order to organize articles 
  I want to be able to merge related articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given I am on the new article page
    When I fill in "article_title" with "Holiday Article"
    And I fill in "article__body_and_extended_editor" with "Cooking for a crowd"
    And I press "Publish"
    Given I am on the home page
    Then I should see "Holday Article"
    And I follow "Holiday Article"
    Then I should see "Comment Holiday Article"
    And I fill in "comment_author" with "MyName"
    And I fill in "comment_email" with "MyEmail@address.com"
    And I fill in "comment_url" with "http://www.google.com"
    And I fill in "comment_body" with "Comment Text goes here"
    And I press "comment"
    Given I am on the new article page
    When I fill in "article_title" with "Holiday Article 2"
    And I fill in "article__body_and_extended_editor" with "Receipes"
    And I press "Publish"
    Given I am on the home page
    Then I should see "Holiday Article 2"
    And I follow "Holiday Article 2"
    Then I should see "Comment Holiday Article 2"
    And I fill in "comment_author" with "OtherName"
    And I fill in "comment_email" with "OtherEmail@address.com"
    And I fill in "comment_url" with "http://www.yahoo.com"
    And I fill in "comment_body" with "Other Comment Text"
    And I press "comment"
    Given I am on the admin content page
    Then I should see "Holiday Article"
    And I should see "Holiday Article 2"
    And I follow "Holiday Article"
    Then I should see "Merge Articles"
    And I fill in "merge_with" with "Holiday Article 2"'s ID
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Holiday Article"
    And I should not see "Holiday Article 2"

  Scenario: The merged article should contain the text of both previous articles.
    Given I am on the home page
    Then I should see "Holiday Article"
    And I should not see "Holiday Article 2"
    And I should see "Cooking for a Crowd"
    And I should see "Recipes"
    When I follow "Holiday Article"
    And I should see "Cooking for a crowd"
    And I should see "Recipes"

  Scenario: The merged article should have one author
    Given I am on the admin content page
    Then I should see "Holiday Article"
    And I should not see "Holiday Article 2"
    And "Holiday Article"'s "author" should be "admin"

Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
    Given I am on the home page
    And I follow "Holiday Article"
    Then I should see "Comment Text goes here"
    And I should see "By MyName"
    And I should see "Other Comment Text"
    And I should see "By OtherName 2"

Scenario: The title of the new article should be the title from either one of the merged articles
    Given I am on the home page
    Then I should see "Holiday Article"
    And I should not see "Holiday Article 2"