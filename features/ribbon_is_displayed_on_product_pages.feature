@temporarily_out_of_stock @javascript
Feature:
  As a customer
  I need to be able to see that a product is temporarily out of stock
  So that I don't have to try to order a product to find out

  Background:
    Given the store operates on a single channel in "United States"
    And the store classifies its products as "Fruits"
    And the store has a product "Banana" with code "banana", created at "05-10-2019"
    And this product belongs to "Fruits"
    And this product's price is "$1.25"
    And this product is tracked by the inventory
    And there are 0 units of product "Banana" available in the inventory
    And the store has a product "Pineapple" with code "pineapple", created at "05-10-2019"
    And this product belongs to "Fruits"
    And this product's price is "$