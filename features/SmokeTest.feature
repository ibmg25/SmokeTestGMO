Feature: SmokeTest
  As a client
  I want to select products, make a purchase and complete billing process
  So that I know that the purchase process works correctly and the total amount is accurate

  Background:
   Given I am on the GMO 
   When I click the button Enter GMO OnLine button

  Scenario Outline: Select Products

    When I update the quantity of "<product_name>" to "<quantity>"
    And Click on the Place and orden Button
    Then the TotalAmount should be "<Total>"

    Examples:
    | product_name              | quantity |Total
    | 3 Person Dome Tent        | 2        |$ 634.98
    | External Frame Backpack   | 1        |$ 193.95