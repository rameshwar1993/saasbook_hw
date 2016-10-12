Feature: Merge Articles - Admin
  As a blog administrator
  In order to organize my posts
  I want to be able to merge articles

  Background:
    Given the blog is set up
    
  Scenario: Successfully create categories
    Given I am logged into the admin panel
    And I am on the first article edit page
    Then I should see "Merge Articles"

  Scenario: Cannot Merge as Publisher
    Given I am logged into the admin panel as a publisher
    And I am on the first article edit page
    Then I should not see "Merge Articles"
    
    
    
    
    
#    When I fill in "category_name" with "Foobar"
#    And I fill in "category_keywords" with "Foobar"
#    And I press "Save"
#    Then I should be on the admin content page
#    When I go to the home page
#    Then I should see "Foobar"
#    When I follow "Foobar"
