Feature: Buy Products
  As a client
  I want to select products to buy
  So that I can verify that the purchase process works correctly and the total amount is accurate

  Background:
   Given I am on the GMO 
   When I click the button Enter GMO OnLine button
  
  Scenario: Place a Empty order
  
  When Click on the Place and orden Button
  Then I should see an alert "Please Order Something First"

  Scenario Outline: Select Multiple Products

  When I update the quantities of the following products:
     | Product Name           | Quantity |
    | 3 Person Dome Tent    | 2        |
    | External Frame Backpack| 1        |
    | Glacier Sun Glasses    | 3        |
    | Padded Socks           | 4        |
    | Hiking Boots           | 1        |
    | Back Country Shorts    | 2        |
   
  And Click on the Place and orden Button
Then I should see the correct "<Tax>" the correct "<Shipping>" and the correct "<Subtotal>" and the total amount the sum:
Examples:
|Subtotal | Shipping | Tax | 
|$ 1223.66 |$ 5.00 | $ 61.18| 
