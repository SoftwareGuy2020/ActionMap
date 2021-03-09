 Feature: display list of events
  
 Background: events have been added to database
  Given the following states exist:
  | name                    | symbol | fips_code | is_territory | lat_min | lat_max | long_min | long_max |
  | California              | CA     | 1 |0|0|0|0|0|
  And the following counties exist:
  |state_id| name | fips_code | fips_class |
  |1 | Orange County | 1 | blabla |
  And the following events exist:
  And I am on the home page
  
 Scenario: check out all events in the map
  When I visit "Events"
  Then I should see "Disability Pride Parade"
  #Then 5 seed events should exist 
  
 Scenario: check out all events from California
  When I follow "Events"
  And I choose "actionmap-events-filter-state-radio"
  # (should I use select...from... ?)
  And I select "California" from "actionmap-events-filter-state"
  #And I press "Filter by State"
  #Then 2 seed events should exist
  
 Scenario: check out all events from Oregon
  When I follow "Events"
  And I choose "actionmap-events-filter-state-radio"
  And I select "Oregon" from "actionmap-events-filter-state"
  #And I press "Filter by State"
  #Then 1 seed events should exist

 Scenario: check out all events from Illinois
  When I follow "Events"
  And I choose "actionmap-events-filter-state-radio"
  And I select "Illinois" from "actionmap-events-filter-state"
  #And I press "Filter by State"
  #Then 1 seed events should exist
 
 Scenario: check out all events from Washington
  When I follow "Events"
  And I choose "actionmap-events-filter-state-radio"
  And I select "Washington" from "actionmap-events-filter-state"
  #And I press "Filter by State"
  #Then 1 seed events should exist
 
 Scenario: check out all events from Florida
  When I follow "Events"
  And I choose "actionmap-events-filter-state-radio"
  And I select "Florida" from "actionmap-events-filter-state"
  #And I press "Filter by State"
  #Then 0 seed events should exist
  
 Scenario: reset filter after filtering
  When I follow "Events"
  And I choose "actionmap-events-filter-state-radio"
  And I select "California" from "actionmap-events-filter-state"
  #And I press "Filter by State"
  And I follow "Reset Filters"
  #Then 5 seed events should exist
  
 Scenario: see events
  When I want to see contents of "event 1"
  Then I should see "Event Details"
  And I follow "Edit"
  Then I should see "Sign In"
  
  
  
   