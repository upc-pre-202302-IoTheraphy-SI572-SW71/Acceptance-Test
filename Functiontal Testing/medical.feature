Feature: Medical appointment schedule

    As a patient
    I want to schedule a medical appointment
    So that I manage my schedule and receive a medical care when needed

    Scenario: Successsfully Schedule a medical appointment
      Given the user is logged as a "Patient"
      When the user navigates to the "Physiotherapist List" page
      And the user select a Physiotherapist
      And the Physiotherapist provides a 24-hour cancellation notice
      And the user clicks on the "Book Appointment" button
      And the user enters the appointments details
        |  Topic   |    day     |  hour |
        | Backbone | 22/12/2023 | 16:00 |
      And the user submits the appointment information
      Then the system verifies that the selected Physiotherapist is available on "22/12/2023" at "16:00"
      And the system adds the appointment to the database
      And a success message is showed with the text "Your appointment was scheduled succesfully. You can cancel up to 24 hours before the appointment."

  Scenario: Schedule a medical appointment with a conflicting schedule
    Given the user is logged in as a "Patient"
    When the user navigates to the "Physiotherapist List" page
    And the user selects a Physiotherapist
    And the Physiotherapist provides a 24-hour cancellation notice
    And the user clicks on the "Book Appointment" button
    And the user enters the appointment details
        | Topic      | day         | hour  |
        | Orthopedic | 22/12/2023  | 16:00 |
    And the user submits the appointment information
    Then the system checks for the selected Physiotherapist's availability on "22/12/2023" at "16:00"
    And the system detects a scheduling conflict
    And the original appointment database remains unchanged
    And the user receives a message indicating a scheduling conflict with the text "Physiotherapist not available at the selected time"

  Scenario: Attempt to schedule a medical appointment with insufficient notice
    Given the user is logged in as a "Patient"
    When the user navigates to the "Physiotherapist List" page
    And the user selects a Physiotherapist
    And the user clicks on the "Book Appointment" button
    And the user enters the appointment details
        | Topic      | day         | hour  |
        | Pediatrics | 22/11/2023  | 09:00 |
    And the user submits the appointment information
    Then the system checks for the selected Physiotherapist's availability on "22/11/2023" at "09:00"
    And the system detects that the scheduling notice is insufficient
    And the original appointment database remains unchanged
    And the user receives a message indicating that the appointment cannot be scheduled due to insufficient notice with the text "Unable to schedule appointment: Insufficient notice. Please schedule at least 24 hours in advance."

  Scenario: Attempt to schedule a medical appointment exceeding the daily limit
    Given the user is logged in as a "Patient"
    When the user navigates to the "Physiotherapist List" page
    And the user selects a Physiotherapist who has already scheduled 6 appointments for the day
    And the user clicks on the "Book Appointment" button
    And the user enters the appointment details
        | Topic      | day         | hour  |
        | Sports     | 22/12/2023  | 14:00 |
    And the user submits the appointment information
    Then the system checks for the selected Physiotherapist's availability on "22/12/2023" at "14:00"
    And the system detects that the daily appointment limit has been reached
    And the original appointment database remains unchanged
    And the user receives a message indicating that the appointment cannot be scheduled due to reaching the daily limit with the text "Unable to schedule appointment: Daily appointment limit exceeded. Please choose another time or physiotherapist."
