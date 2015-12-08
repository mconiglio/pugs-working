Feature: Login testing
  In order to access the site
  a user should  login using one of three options
  
  Scenario: Log in manually without signup
    Given I am on the login page
    When I fill in email with "astjuste423@gmail.com"
    When I fill in password with "P@ssword"
    When I press Log in
    Then I should be on the login page

  #Scenario: Log in with Facebook
  #  Given I am on the login page
  #  When I click Sign in with Facebook 
    #W#hen I am redirected to facebook login page
   # Then I should be on the home page
    
 # Scenario: Log in with Twitter
   # Given I am on the login page
   # When I click Sign in with Twitter
    #When I am redirected to facebook login page
   # Then I should be on the sign up page

  Scenario: Forgot password
    Given I am on the login page
    When I click Forgot your password?
    Then I should be on the reset password page
    
  Scenario: Invalid Email
    Given I am on the login page
    When I fill in email with "cats"
    Then the page should have flash message "Invalid Email"
    
  Scenario: Invalid password length
    Given I am on the login page
    When I fill in password with "cats"
    Then the page should have flash message "Invalid password length"

    
 