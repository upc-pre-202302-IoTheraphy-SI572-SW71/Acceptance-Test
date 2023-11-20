Feature: Appointment Processing

  As a patient
  I want to be able to make a payment for my medical treatments
  So that I can complete the transaction securely and conveniently

  Scenario: Successfully make a payment
    Given the user is logged in as a "Patient"
    And the patient has treatments with a total cost of $100
    When the patient navigates to the "Payment" page
    And enters the payment details:
      | Card Number         | Expiry Date | CVV | Amount |
      | 1234 5678 9012 3456 | 12/25       | 123 | $100   |
    And clicks the "Submit Payment" button
    Then the system processes the payment
    And the system verifies that the payment was successful
    And the patient receives a confirmation message with the text "Payment successful. Thank you for your payment."

  Scenario: Attempt to make a payment with an expired card
    Given the user is logged in as a "Patient"
    And the patient has treatments with a total cost of $75
    When the patient navigates to the "Payment" page
    And enters the payment details with an expired card:
      | Card Number         | Expiry Date | CVV | Amount |
      | 9876 5432 1098 7654 | 05/21       | 456 | $75    |
    And clicks the "Submit Payment" button
    Then the system displays an error message indicating "Payment failed. The card has expired."
    And the payment is not processed

  Scenario: Attempt to make a payment with insufficient funds
    Given the user is logged in as a "Patient"
    And the patient has treatments with a total cost of $120
    When the patient navigates to the "Payment" page
    And enters the payment details with insufficient funds:
      | Card Number         | Expiry Date | CVV | Amount |
      | 5678 9012 3456 7890 | 09/24       | 789 | $120   |
    And clicks the "Submit Payment" button
    Then the system displays an error message indicating "Payment failed. Insufficient funds on the card."
    And the payment is not processed

  Scenario: Attempt to make a payment without entering all required details
    Given the user is logged in as a "Patient"
    And the patient has treatments with a total cost of $50
    When the patient navigates to the "Payment" page
    And attempts to make a payment without entering all required details
    Then the system displays an error message indicating "Please fill in all required fields before submitting the payment."
    And the payment is not processed
