Feature: Search representatives and see their events
  As a user
  So that I can find my representatives' information
  And I want to follow certain representatives and see their events
Background: representatives are seed in db
  Given the following representatives exist:
  |name| id | title | party | photo |
  |Donald| 1000000 | President of USA | Republican | blabla |

Scenario: Search representative to get their information
  Given I am on the representatives page
  When I fill in "address" with "San Francisco"
  And I press "commit"
  Then I should see "Carmen Chu"
  When I follow "Carmen Chu"
  Then I should see "1 Doctor Carlton B Goodlett Place"

Scenario: Search representative and see his/her events
  Given I am on the representatives page
  When I fill in "address" with "San Francisco"
  And I press "commit"
  Then I should see "Carmen Chu"
  When I clink on News Articles for "Donald"
  Then I should see "Listing News Articles for Donald"
  And I should see "Add News Article"
  When I follow "Add News Article"
  Then I should see "Sign In"