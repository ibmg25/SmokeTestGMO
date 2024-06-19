Feature: As a internet user
         I want to use the GMO OnLine Catalog
         so I test that it works correctly

      

Scenario Outline: Click all the buttons in Home page
  Given I am on GMO OnLine Catalog page
  When Press the "<name_button>"     
  Then I should see title text "<title>" in the page

  Examples:
  | name_button          | title                             | 
  |About The GMO site    | About This Site                       |
  |Browser Test Page     | All Browsers Are Not Created Equal     |
  |Enter GMO OnLine      |OnLine Catalog    |
