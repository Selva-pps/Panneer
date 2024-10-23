Feature: Gmail Compose Email Functionality

  Scenario: Verify user can successfully enter text in the email body field
    Given the user is on the Gmail compose window
    When the user enters "QA test for Incubyte" in the email body field
    Then the text should be successfully entered in the email body field

  Scenario: Verify user can successfully enter a subject in the subject field
    Given the user is on the Gmail compose window
    When the user enters "Incubyte" in the subject field
    Then the subject should be successfully entered in the subject field

  Scenario: Verify behavior when an email is sent without a subject
    Given the user has composed an email with a recipient and body
    When the user leaves the subject field empty and clicks "Send"
    Then Gmail should display a warning message about sending an email without a subject
    And Gmail should allow the user to send the email without the subject after confirmation

  Scenario: Verify behavior when an email is sent without content in the body
    Given the user has composed an email with a recipient and subject
    When the user leaves the body field empty and clicks "Send"
    Then Gmail should display a warning message about sending an email without content in the body
    And Gmail should allow the user to send the email without the body after confirmation

  Scenario: Verify user can successfully enter an email address in the "To" field
    Given the user is on the Gmail compose window
    When the user enters "test@example.com" in the "To" field
    Then the email address should be successfully entered in the "To" field

  Scenario: Verify that multiple email addresses can be added as recipients in the "To" field
    Given the user is on the Gmail compose window
    When the user enters multiple email addresses in the "To" field
    Then all the email addresses should be successfully added as recipients in the "To" field

  Scenario: Verify users can add recipients to both the Cc and Bcc fields
    Given the user is on the Gmail compose window
    When the user enters email addresses in the "Cc" and "Bcc" fields
    Then the email addresses should be successfully added to the "Cc" and "Bcc" fields

  Scenario: Verify behavior when no recipient is added in "To," "Cc," or "Bcc" fields
    Given the user has composed an email with a subject and body
    When the user leaves the "To," "Cc," and "Bcc" fields empty and clicks "Send"
    Then Gmail should display an error message prompting the user to add at least one recipient

  Scenario: Verify behavior when an invalid email address format is entered in the recipient field
    Given the user is on the Gmail compose window
    When the user enters an invalid email address format in the recipient field
    Then Gmail should display a warning message that the email address is invalid
    And the user should not be able to send the email until the address is corrected

  Scenario: Verify behavior when an attachment exceeds the allowed file size limit
    Given the user is on the Gmail compose window
    When the user tries to attach a file exceeding the allowed file size limit
    Then Gmail should display an error message about the file size limit
    And the attachment should not be uploaded

  Scenario: Verify user can discard a composed email and remove it from the drafts folder
    Given the user is on the Gmail compose window
    When the user clicks the "Discard" button
    Then the composed email should be removed from the compose window
    And the draft should be deleted from the drafts folder

  Scenario: Verify behavior when a corrupted attachment is added to the email
    Given the user is on the Gmail compose window
    When the user attaches a corrupted file to the email
    Then Gmail should display an error message that the attachment is corrupted
    And the email should not be sent until the corrupted attachment is removed

  Scenario: Verify behavior when trying to send an email without logging in
    Given the user is not logged into their Gmail account
    When the user tries to send an email
    Then Gmail should prompt the user to log in before sending the email

  Scenario: Verify Gmail exceeds the limit on the number of recipients
    Given the user is on the Gmail compose window
    When the user enters more recipients than Gmail's limit in the "To," "Cc," and "Bcc" fields combined
    Then Gmail should display a message that the recipient limit has been exceeded
    And the user should not be able to send the email until the number of recipients is reduced
