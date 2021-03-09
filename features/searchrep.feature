Feature: Search for representatives by address
  As a user
  So that I can find my representatives
  I want to search for my representatives by address
  
Scenario: Search with valid address
  Given I am on the home page
  When I follow "Representatives"
  Then I should be on the representatives page
  When I fill in "address" with "Berkeley, CA"
  And I press "commit"
  Then I should be on the search page
  And I should see "Donald J. Trump"
  
Scenario: Search with a blank address
  Given I am on the home page
  When I follow "Representatives"
  Then I should be on the representatives page
  When I press "commit"
  Then I should be on the representatives page
  
 