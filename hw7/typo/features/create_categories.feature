Feature: Write Articles
  As a blog administrator
  In order to organize my posts
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create categories
    Given I am on the admin categories page
    #Given I follow "Categories"
    When I fill in "category_name" with "Foobar"
    And I fill in "category_keywords" with "Foobar"
    And I press "Save"
#    Then I should be on the admin content page
#    When I go to the home page
#    Then I should see "Foobar"
#    When I follow "Foobar"
    Then I should see "Category was successfully saved."