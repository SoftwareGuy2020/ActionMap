Feature: Login to account 
  As a user
  So that I can login to my account through google or github

Scenario: Login through Google
  Given I am on the home page
  When I follow "Login"
  Then I should see "Sign In"
  Then I follow "Sign in with Google"
  
Scenario: Login through GitHub
  Given I am on the home page
  When I follow "Login"
  Then I should see "Sign In"
  Then I follow "Sign in with Github"