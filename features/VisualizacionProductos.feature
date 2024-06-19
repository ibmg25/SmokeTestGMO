Feature: Testing GMO Post
  As an internet user
  I want to interact with the demo GMO Post website
  So I can view details of available products

Scenario Outline: Get products and view details of selected product
  Given I am on the GMO Post homepage
  When I click Enter GMO OnLine button
  And I click "<product_name>" product
  Then I should see for product "<product_name>", details: "<product_details>", item number: "<item>"

Examples:
  | product_name             | product_details                                                                 | item |
  | 3 Person Dome Tent       | Our best 3 person backpack dome tent     | 1000 |
  | Glacier Sun Glasses      | Our best glacier sun glasses will protect you on your next expedition or when you hit the slopes. | 1002 |
  | Back Country Shorts      | Our quick drying shorts are a customer favorite. Perfect for a day of any outdoor activity or just lounging around the camp. | 1005 |
