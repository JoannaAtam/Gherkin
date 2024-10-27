Feature: Purchasing a product in an online store
  As a returning customer of the cosmetics online store
  I want to search for my favorite products, add them to the cart, and complete the purchase
  So that I can quickly buy my preferred items with my saved settings

  Background:
    Given the user is logged into their account
    And the user has saved billing and shipping addresses
    And the user has saved payment and shipping options
    And the user is on the main page of the cosmetics online store

  Scenario Outline: Search and add your favorite product to the cart
    When the user enters "<product_name>" in the search bar
    And clicks on the search button
    Then the search results should display items related to "<product_name>"
    And the user selects their preferred "<product_name>" from the list
    And clicks on the "Add to cart" button
    Then "<product_name>" should be added to the cart
    And the cart should display the correct quantity of 1 for "<product_name>"

    Examples:
      | product_name     |
      | face cream       |
      | body lotion      |
      | shower gel       |
      | shampoo          |
      | conditioner      |

  Scenario: Go to cart and verify products
    Given the user has added their favorite products to the cart
    When the user goes to the cart page
    Then the cart should display each selected product with the correct details
    And the total price should match the sum of all items in the cart

  Scenario: Purchase products using saved options
    Given the user is on the cart page with all desired products
    When the user clicks on the "Proceed to checkout" button
    And confirms the pre-filled billing and shipping address
    And selects their saved payment and shipping options
    And clicks on the "Confirm Purchase" button
    Then the user should see a confirmation message for the purchase
