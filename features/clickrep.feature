Feature: Click on counties to see its representatives
  As a user
  So that I can find my representatives
  I want to click on my county to see its representatives 

Scenario: See representatives in Orange County (CA)
  Given I am on the home page
  When I click on state "CA"
  And I click on county "Orange County"
  Then I should see "Fiona Ma"
  And I should see "Frank Daviess"
  
Scenario: See representatives in Otsego County (NY)
  Given I am on the home page
  When I click on state "NY"
  And I click on county "Otsego County"
  Then I should see "Andrew M. Cuomo"
  And I should see "Kathy Sinnott Gardner"
  


  
  
  
  