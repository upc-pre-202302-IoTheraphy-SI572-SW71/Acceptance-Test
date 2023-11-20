Feature: Diagnostic Submission

  As a physiotherapist
  I want to submit a diagnosis to my patients
  So that I provide detailed information about their treatment

  Scenario: Successfully submit a diagnosis after the scheduled appointment
    Given that the user is logged in as "Physiotherapist"
    When the physiotherapist navigates to the "Appointment List" page
    And selects the patient with the name "John Smith"
    And clicks the "Submit Diagnosis" button
    And enters the diagnosis details:
      | Diagnosis   | Date       |                           Description                                      |
      | John Smith  | 05/01/2024 | Muscle tension in the lower back. Recommended rest and specific exercises. |
    And submits the diagnosis
    Then the system verifies that the diagnosis has been successfully submitted to John Smith
    And the diagnosis is recorded in John Smith's medical history
    And a success message is displayed with the text "The diagnosis has been successfully submitted to John Smith"

  Scenario: Attempt to submit a diagnosis before the scheduled appointment
    Given that the user is logged in as "Physiotherapist"
    When the physiotherapist navigates to the "Appointment List" page
    And selects the patient with the name "Jane Doe"
    And clicks the "Submit Diagnosis" button
    And attempts to submit the diagnosis before the scheduled appointment date
    Then the system displays an error message indicating "Diagnosis cannot be submitted before the scheduled appointment date"
    And the diagnosis is not submitted