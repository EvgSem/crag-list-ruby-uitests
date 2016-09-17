Feature: Craigslist navigation
  Craigslist homepage allows user to navigate to a particular area, subarea, section and category.

  Scenario Outline: Users can perform navigation to area, subarea, section and category
    Given I open the Craigslist home page
    When I select area "<area>"
    And I select subarea "<subarea>"
    And I select category "<category>" in section "<section>"
    Then I should see the result list

   Examples:
   |area         |subarea |section   |category |
   |los angeles  |wst     |community |artists  |
   |los angeles  |wst     |community |childcare|