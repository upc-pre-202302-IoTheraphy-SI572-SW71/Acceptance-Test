Feature: Videos Upload

  As a physiotherapist
  I want to upload a treatment video for a patient
  So that they can follow the prescribed exercises at their convenience

  Scenario: Successfully upload a treatment video for a patient
    Given that the user is logged in as a "Physiotherapist"
    When the physiotherapist navigates to the "Patient List" page
    And selects the patient with the name "John Smith"
    And clicks the "Upload Treatment" button
    And enters the treatment details:
      | Video Name        | Description                              | Scheduled Day  |
      | BackStretching    | Gentle stretching exercises for the back | 25/12/2023     |
    And uploads the treatment video file
    And submits the treatment information
    Then the system verifies that the treatment video has been successfully uploaded for John Smith
    And the treatment details are recorded in John Smith's treatment history
    And a success message is displayed with the text "The treatment video has been successfully uploaded for John Smith"

  Scenario: Attempt to upload a treatment for a past date
    Given that the user is logged in as a "Physiotherapist"
    When the physiotherapist navigates to the "Patient List" page
    And selects the patient with the name "Mary Johnson"
    And clicks the "Upload Treatment" button
    And enters the treatment details for a past date:
      | Video Name        | Description                              | Scheduled Day  |
      | NeckExercises     | Exercises to relieve neck tension        | 10/11/2023     |
    And uploads the treatment video file
    And submits the treatment information
    Then the system displays an error message indicating "Cannot schedule a treatment for a past date"
    And the treatment is not uploaded

  Scenario: Attempt to upload too many treatments for a patient on the same day
    Given that the user is logged in as a "Physiotherapist"
    When the physiotherapist navigates to the "Patient List" page
    And selects the patient with the name "Alice Johnson"
    And clicks the "Upload Treatment" button
    And enters the treatment details for multiple treatments scheduled on the same day:
      | Video Name        | Description                              | Scheduled Day  |
      | StretchingRoutine | Full-body stretching routine             | 01/01/2024     |
      | StrengthTraining  | Strength training exercises              | 01/01/2024     |
      | RelaxationTips    | Tips for relaxation and stress reduction | 01/01/2024     |
      | CoreWorkout       | Core muscle workout                      | 01/01/2024     |
    And uploads the corresponding treatment video files
    And submits the treatment information
    Then the system checks the total number of treatments scheduled for Alice Johnson on 01/01/2024
    And the system detects that the total number of treatments exceeds the limit
    And the original treatment schedule for Alice Johnson remains unchanged
    And the physiotherapist receives a message indicating that the maximum number of treatments for a patient on the same day has been reached with the text "Unable to upload treatments: Maximum limit of treatments per patient on the same day exceeded. Please adjust the schedule."
