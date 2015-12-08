Feature: Posting
    In order to create a post
    A user
    Should clicking the post button and enter text, date, location, and category
 
    Scenario: Create a post
        Given I am on the home page
        And I press "Post"
        And I fill in title with "Looking for game"
        And I fill in date with "12/05/15"
        And I check "Basketball"
        When I press "Create"
        Then I should be on the home page
        
    Scenario: Create a post with no title
        Given I am on the home page
        And I press "Post"
        And I fill in date with "12/05/15"
        And I check "Basketball"
        When I press "Create"
        Then the page should have flash message "Please enter a title"
        
    Scenario: Create a post with no date
        Given I am on the home page
        And I press "Post"
        And I fill in title with "Looking for game"
        And I check "Basketball"
        When I press "Create"
        Then the page should have flash message "Please enter a date"
        
    Scenario: Create a post with no category
        Given I am on the home page
        And I press "Post"
        And I fill in title with "Looking for game"
        And I fill in date with "12/05/15"
        When I press "Create"
        Then the page should have flash message "Please pick a category"